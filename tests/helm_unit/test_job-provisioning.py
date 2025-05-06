# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2025 Univention GmbH


import pytest
from pytest_helm.utils import add_jsonpath_prefix, findone, get_containers
from univention.testing.helm.container import ContainerEnvVarSecret
from univention.testing.helm.deployment import Deployment
from yaml import safe_load


class TestDeployment(Deployment):
    template_file = "templates/job-provisioning.yaml"

    def test_pod_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            provisioning:
              podSecurityContext:
                enabled: false
                fsGroup: 1000
                fsGroupChangePolicy: "Always"
            """,
            ),
        )
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        pod_spec = deployment["spec"]["template"]["spec"]

        assert "securityContext" not in pod_spec.keys()

    def test_pod_security_context_is_applied(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            provisioning:
              podSecurityContext:
                enabled: true
                fsGroup: 1000
                runAsGroup: 1000
                fsGroupChangePolicy: "Always"
            """,
            ),
        )
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        pod_security_context = deployment["spec"]["template"]["spec"]["securityContext"]
        expected_pod_security_context = {
            "fsGroup": 1000,
            "fsGroupChangePolicy": "Always",
            "runAsGroup": 1000,
        }
        assert pod_security_context == expected_pod_security_context

    def test_container_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            provisioning:
              containerSecurityContext:
                enabled: false
                capabilities:
                  drop: []
                runAsUser: 9876
            """,
            ),
        )
        expected_security_context = {}
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        containers = get_containers(deployment)
        _assert_all_have_security_context(containers, expected_security_context)

    def test_container_security_context_is_applied(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            provisioning:
              containerSecurityContext:
                enabled: true
                capabilities:
                  drop: []
                runAsUser: 9876
            """,
            ),
        )
        expected_security_context = {
            "capabilities": {
                "drop": [],
            },
            "runAsUser": 9876,
        }

        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        containers = get_containers(deployment)
        _assert_all_have_security_context(containers, expected_security_context)


def _assert_all_have_security_context(containers, expected_security_context):
    for container in containers:
        security_context = container.get("securityContext", {})
        name = container["name"]
        assert (
            security_context.keys() >= expected_security_context.keys()
        ), f'Wrong securityContext in container "{name}"'
        assert (
            security_context.items() >= expected_security_context.items()
        ), f'Wrong securityContext in container "{name}"'


@pytest.mark.parametrize(
    "key, env_var, key_mapping",
    [
        ("provisioning.keycloak", "KEYCLOAK_PASSWORD", "password"),
        (
            "managementApi.oauth",
            "GUARDIAN_MANAGEMENT_API_CLIENT_SECRET",
            "clientSecret",
        ),
    ],
)
class TestMainContainer(ContainerEnvVarSecret):
    template_file = "templates/job-provisioning.yaml"
    container_name = "keycloak-provisioning"

    @pytest.mark.skip(
        reason="Automatic secret creation is not implemented for guardian yet"
    )
    def test_auth_disabling_existing_secret(
        self, helm, chart_path, key, env_var, key_mapping
    ):
        pass

    def test_auth_existing_secret_custom_name(
        self,
        helm,
        chart_path,
        key,
        env_var,
        key_mapping,
    ):
        values = add_jsonpath_prefix(
            key,
            safe_load(
                """
                auth:
                  existingSecret:
                    name: "stub-secret-name"
            """,
            ),
        )
        container_type = "initContainers" if self.container_is_init else "containers"
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        env = findone(
            deployment,
            f"spec.template.spec.{container_type}[?@.name=='{self.container_name}'].env[?@.name=='{env_var}']",
        )
        assert env["valueFrom"]["secretKeyRef"]["name"] == "stub-secret-name"
        assert env["valueFrom"]["secretKeyRef"]["key"] == key_mapping

    def test_auth_existing_secret_custom_key(
        self,
        helm,
        chart_path,
        key,
        env_var,
        key_mapping,
    ):
        values = add_jsonpath_prefix(
            key,
            safe_load(
                f"""
                auth:
                  existingSecret:
                    name: "stub-secret-name"
                    keyMapping:
                      {key_mapping}: "stub_password_key"
            """,
            ),
        )
        container_type = "initContainers" if self.container_is_init else "containers"
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        env = findone(
            deployment,
            f"spec.template.spec.{container_type}[?@.name=='{self.container_name}'].env[?@.name=='{env_var}']",
        )
        assert env["valueFrom"]["secretKeyRef"]["name"] == "stub-secret-name"
        assert env["valueFrom"]["secretKeyRef"]["key"] == "stub_password_key"

    def test_auth_existing_secret_has_precedence(
        self,
        helm,
        chart_path,
        key,
        env_var,
        key_mapping,
    ):
        values = add_jsonpath_prefix(
            key,
            safe_load(
                f"""
                auth:
                  password: stub-plain-password
                  existingSecret:
                    name: "stub-secret-name"
                    keyMapping:
                      {key_mapping}: "stub_password_key"
            """,
            ),
        )
        container_type = "initContainers" if self.container_is_init else "containers"
        deployment = self.helm_template_file(
            helm, chart_path, values, self.template_file
        )
        env = findone(
            deployment,
            f"spec.template.spec.{container_type}[?@.name=='{self.container_name}'].env[?@.name=='{env_var}']",
        )
        assert env["valueFrom"]["secretKeyRef"]["name"] == "stub-secret-name"
        assert env["valueFrom"]["secretKeyRef"]["key"] == "stub_password_key"
