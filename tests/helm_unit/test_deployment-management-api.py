# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2025 Univention GmbH


import pytest
from pytest_helm.utils import get_containers
from univention.testing.helm.container import ContainerEnvVarSecret
from univention.testing.helm.deployment import Deployment
from yaml import safe_load


class TestDeployment(Deployment):
    template_file = "templates/deployment-management-api.yaml"

    def test_pod_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            managementApi:
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
            managementApi:
              podSecurityContext:
                enabled: true
                fsGroup: 1000
                fsGroupChangePolicy: "Always"
                sysctls: null
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
            "sysctls": None,
        }
        assert pod_security_context == expected_pod_security_context

    def test_container_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            managementApi:
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
            managementApi:
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
    "key, env_var",
    [
        ("postgresql", "SQL_PERSISTENCE_ADAPTER__PASSWORD"),
    ],
)
class TestMainContainer(ContainerEnvVarSecret):
    template_file = "templates/deployment-management-api.yaml"
    container_name = "management-api"

    def test_auth_disabling_existing_secret(self, helm, chart_path, key, env_var):
        # TODO: Since automatic secret creation is not implemented for guardian,
        # this test is not applicable
        pass
