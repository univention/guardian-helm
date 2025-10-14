# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2025 Univention GmbH

from univention.testing.helm.auth_flavors.password_usage import (
    AuthPasswordUsageViaEnv, AuthPasswordUsageViaVolume)
from univention.testing.helm.auth_flavors.secret_generation import \
    AuthSecretGenerationOwner


class SettingsTestKeycloakSecret:
    secret_name = "release-name-guardian-keycloak-client-secret"
    prefix_mapping = {
        "auth.clientSecret": "auth.password",
        "managementApi.oauth.auth": "auth"
    }

    # for AuthPasswordUsageViaEnv and AuthPasswordUsageViaVolume
    path_password = "stringData.clientSecret"
    secret_default_key = "clientSecret"

class TestChartCreatesKeycloakClientSecretAsOwner(SettingsTestKeycloakSecret, AuthSecretGenerationOwner):
    derived_password = "28ee69de2ddd505abb1ae37e6a4584cb2b97f59a"


class TestProvisioningJobUsesKeycloakClientPasswordViaEnv(SettingsTestKeycloakSecret, AuthPasswordUsageViaEnv):
    workload_name = "release-name-guardian-provisioning-1"
    workload_kind = "Job"
    sub_path_env_password = "env[?@name=='GUARDIAN_MANAGEMENT_API_CLIENT_SECRET']"


class TestManagementApiUsesKeycloakClientPasswordViaVolume(SettingsTestKeycloakSecret, AuthPasswordUsageViaVolume):
    workload_name = "release-name-guardian-management-api"
    volume_name = "secrets"
