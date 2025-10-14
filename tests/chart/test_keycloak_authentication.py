# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2025 Univention GmbH

from univention.testing.helm.auth_flavors.password_usage import (
    AuthPasswordUsageViaEnv, AuthPasswordUsageViaVolume)
from univention.testing.helm.auth_flavors.secret_generation import \
    AuthSecretGenerationUser
from univention.testing.helm.auth_flavors.username import \
    AuthUsernameViaConfigMap


class SettingsTestKeycloakSecret:
    secret_name = "release-name-guardian-keycloak-credentials"
    prefix_mapping = {"provisioning.keycloak.auth": "auth"}

    # for AuthPasswordUsageViaEnv and AuthPasswordUsageViaVolume
    workload_name = "release-name-guardian-provisioning-1"
    workload_kind = "Job"
    path_password = "stringData.adminPassword"
    secret_default_key = "adminPassword"


class TestChartCreatesKeycloakSecretAsUser(SettingsTestKeycloakSecret, AuthSecretGenerationUser):
    pass


class TestProvisioningJobUsesKeycloakPasswordViaEnv(SettingsTestKeycloakSecret, AuthPasswordUsageViaEnv):
    sub_path_env_password = "env[?@name=='KEYCLOAK_PASSWORD']"



class TestProvisioningJobUsesKeycloakPasswordViaVolume(SettingsTestKeycloakSecret, AuthPasswordUsageViaVolume):
    volume_name = "keycloak-credentials-volume"


class TestProvisioningJobUsesKeycloakUsernameViaConfigMap(SettingsTestKeycloakSecret, AuthUsernameViaConfigMap):
    config_map_name = "release-name-guardian-provisioning-env"
    path_username = "data.KEYCLOAK_USERNAME"
    default_username = "stub_username"
