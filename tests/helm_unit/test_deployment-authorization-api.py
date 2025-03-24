# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2025 Univention GmbH


import pytest

from pytest_helm.utils import add_jsonpath_prefix, findone, get_containers
from univention.testing.helm.container import ContainerEnvVarSecret
from univention.testing.helm.deployment import Deployment
from yaml import safe_load


class TestDeployment(Deployment):
    template_file = "templates/deployment-authorization-api.yaml"

    def test_pod_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            authorizationApi:
              podSecurityContext:
                enabled: false
                fsGroup: 1000
                fsGroupChangePolicy: "Always"
            """,
            ),
        )
        deployment = self.helm_template_file(helm, chart_path, values, self.template_file)
        pod_spec = deployment["spec"]["template"]["spec"]

        assert "securityContext" not in pod_spec.keys()

    def test_pod_security_context_is_applied(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            authorizationApi:
              securityContext:
                enabled: True
                fsGroup: 1000
                fsGroupChangePolicy: "Always"
                sysctls: null
            """,
            ),
        )
        deployment = self.helm_template_file(helm, chart_path, values, self.template_file)
        pod_security_context = deployment["spec"]["template"]["spec"]["securityContext"]
        expected_security_context = {
            "fsGroup": 1000,
            "fsGroupChangePolicy": "Always",
        }
        assert pod_security_context == expected_security_context

    def test_container_security_context_can_be_disabled(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            authorizationApi:
              securityContext:
                enabled: false
                capabilities:
                  drop: []
                runAsUser: 9876
            """,
            ),
        )
        expected_security_context = {}
        deployment = self.helm_template_file(helm, chart_path, values, self.template_file)
        containers = get_containers(deployment)
        _assert_all_have_security_context(containers, expected_security_context)

    def test_container_security_context_is_applied(self, helm, chart_path):
        values = self.add_prefix(
            safe_load(
                """
            authorizationApi:
              securityContext:
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

        deployment = self.helm_template_file(helm, chart_path, values, self.template_file)
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
