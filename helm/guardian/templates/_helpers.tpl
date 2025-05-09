{{- /*
SPDX-FileCopyrightText: 2024 Univention GmbH
SPDX-License-Identifier: AGPL-3.0-only
*/}}

{{- /*
These template definitions relate to the use of this Helm chart as a sub-chart of the Nubus Umbrella Chart.
Templates defined in other Helm sub-charts are imported to be used to configure this chart.
If the value .Values.global.nubusDeployment equates to true, the defined templates are imported.
*/}}

{{- define "guardian.authorizationApi.config.udmDataAdapterUrl" -}}
{{- if .Values.authorizationApi.config.udmDataAdapterUrl -}}
{{- .Values.authorizationApi.config.udmDataAdapterUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "http://%s-udm-rest-api:9979/udm/" .Release.Name -}}
{{- else -}}
{{- printf "http://udm-rest-api:9979/udm/" -}}
{{- end -}}
{{- end -}}

{{- define "guardian.managementUi.config.viteApiDataAdapterUri" -}}
{{- if .Values.managementUi.config.viteApiDataAdapterUri -}}
{{- .Values.managementUi.config.viteApiDataAdapterUri -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "https://%s.%s/guardian/management" .Values.global.subDomains.portal .Values.global.domain }}
{{- else -}}
{{- required "managementUi.config.viteApiDataAdapterUri is required" .Values.managementUi.config.viteApiDataAdapterUri -}}
{{- end -}}
{{- end -}}

{{- define "guardian.managementUi.config.viteKeycloakAuthenticationAdapterSsoUri" -}}
{{- if .Values.managementUi.config.viteKeycloakAuthenticationAdapterSsoUri -}}
{{- .Values.managementUi.config.viteKeycloakAuthenticationAdapterSsoUri -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "https://%s.%s" .Values.global.subDomains.keycloak .Values.global.domain }}
{{- else -}}
{{- required "SSO URI is required for managementUi" .Values.managementUi.config.viteKeycloakAuthenticationAdapterSsoUri -}}
{{- end -}}
{{- end -}}

{{- /*
These template definitions are only used in this chart and do not relate to templates defined elsewhere.
*/}}

{{- /*
AUTHORIZATION API
*/}}

{{- define "guardian.authorizationApi.config.guardianAuthzCorsAllowedOrigins" -}}
{{- if .Values.authorizationApi.config.guardianAuthzCorsAllowedOrigins -}}
{{- .Values.authorizationApi.config.guardianAuthzCorsAllowedOrigins -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "*" }}
{{- end -}}
{{- end -}}

{{- define "guardian.authorizationApi.config.opaAdapterUrl" -}}
{{- if .Values.authorizationApi.config.opaAdapterUrl -}}
{{- .Values.authorizationApi.config.opaAdapterUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-guardian-open-policy-agent/" .Release.Name }}
{{- else -}}
http://guardian-open-policy-agent:8181/
{{- end -}}
{{- end -}}

{{- define "guardian.authorizationApi.config.oauthAdapterWellKnownUrl" -}}
{{- if .Values.authorizationApi.config.oauthAdapterWellKnownUrl -}}
{{- .Values.authorizationApi.config.oauthAdapterWellKnownUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-keycloak:8080/realms/%s/.well-known/openid-configuration" .Release.Name .Values.global.keycloak.realm }}
{{- else -}}
http://keycloak/realms/nubus/.well-known/openid-configuration
{{- end -}}
{{- end -}}

{{- define "guardian.authorizationApi.config.guardianAuthzLoggingLevel" -}}
{{- if .Values.authorizationApi.config.guardianAuthzLoggingLevel -}}
{{- .Values.authorizationApi.config.guardianAuthzLoggingLevel -}}
{{- else if .Values.global.nubusDeployment -}}
INFO
{{- else -}}
DEBUG
{{- end -}}
{{- end -}}

{{- define "guardian.authorizationApi.config.guardianAuthzLoggingStructured" -}}
{{- if .Values.authorizationApi.config.guardianAuthzLoggingStructured -}}
{{- .Values.authorizationApi.config.guardianAuthzLoggingStructured -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "true" }}
{{- else -}}
{{ printf "true" }}
{{- end -}}
{{- end -}}

{{- define "guardian.authorizationApi.config.guardianAuthzLoggingFormat" -}}
{{- if .Values.authorizationApi.config.guardianAuthzLoggingFormat -}}
{{- .Values.authorizationApi.config.guardianAuthzLoggingFormat -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "<green>{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}</green> | <level>{level}</level> | <level>{message}</level> | {extra}" }}
{{- else -}}
{{ printf "<green>{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}</green> | <level>{level}</level> | <level>{message}</level> | {extra}" }}
{{- end -}}
{{- end -}}


{{- /*
MANAGEMENT API
*/}}

{{- define "guardian.managementApi.config.guardianManagementCorsAllowedOrigins" -}}
{{- if .Values.managementApi.config.guardianManagementCorsAllowedOrigins -}}
{{- .Values.managementApi.config.guardianManagementCorsAllowedOrigins -}}
{{- else if .Values.global.nubusDeployment -}}
*
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.guardianManagementAdapterAuthorizationApiUrl" -}}
{{- if .Values.managementApi.config.guardianManagementAdapterAuthorizationApiUrl -}}
{{- .Values.managementApi.config.guardianManagementAdapterAuthorizationApiUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-guardian-authorization-api/guardian/authorization" .Release.Name }}
{{- else -}}
http://guardian-management-api/guardian/authorization
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.sqlPersistenceAdapterDialect" -}}
{{- if .Values.managementApi.config.sqlPersistenceAdapterDialect -}}
{{- .Values.managementApi.config.sqlPersistenceAdapterDialect -}}
{{- else if .Values.global.nubusDeployment -}}
postgresql
{{- else -}}
postgresql
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.guardianManagementLoggingLevel" -}}
{{- if .Values.managementApi.config.guardianManagementLoggingLevel -}}
{{- .Values.managementApi.config.guardianManagementLoggingLevel -}}
{{- else if .Values.global.nubusDeployment -}}
INFO
{{- else -}}
DEBUG
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.guardianManagementLoggingStructured" -}}
{{- if .Values.managementApi.config.guardianManagementLoggingStructured -}}
{{- .Values.managementApi.config.guardianManagementLoggingStructured -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "true" }}
{{- else -}}
{{ printf "true" }}
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.guardianManagementLoggingFormat" -}}
{{- if .Values.managementApi.config.guardianManagementLoggingFormat -}}
{{- .Values.managementApi.config.guardianManagementLoggingFormat -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "<green>{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}</green> | <level>{level}</level> | <level>{message}</level> | {extra}" }}
{{- else -}}
{{ printf "<green>{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}</green> | <level>{level}</level> | <level>{message}</level> | {extra}" }}
{{- end -}}
{{- end -}}

{{- define "guardian.managementApi.config.guardianManagementBaseUrl" -}}
{{- if .Values.managementApi.config.guardianManagementBaseUrl -}}
{{- .Values.managementApi.config.guardianManagementBaseUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "https://%s.%s" .Values.global.subDomains.portal .Values.global.domain }}
{{- end -}}
{{- end -}}


{{- /*
MANAGEMENT UI
*/}}

{{- define "guardian.managementUi.config.viteKeycloakAuthenticationAdapterRealm" -}}
{{- if .Values.managementUi.config.viteKeycloakAuthenticationAdapterRealm -}}
{{- .Values.managementUi.config.viteKeycloakAuthenticationAdapterRealm -}}
{{- else if .Values.global.nubusDeployment -}}
{{- .Values.global.keycloak.realm -}}
{{- else -}}
nubus
{{- end -}}
{{- end -}}


{{- /*
OPEN POLICY AGENT
*/}}

{{- define "guardian.openPolicyAgent.config.opaPollingMinDelay" -}}
{{- if .Values.openPolicyAgent.config.opaPollingMinDelay -}}
{{- .Values.openPolicyAgent.config.opaPollingMinDelay -}}
{{- else if .Values.global.nubusDeployment -}}
10
{{- else -}}
10
{{- end -}}
{{- end -}}

{{- define "guardian.openPolicyAgent.config.opaPollingMaxDelay" -}}
{{- if .Values.openPolicyAgent.config.opaPollingMaxDelay -}}
{{- .Values.openPolicyAgent.config.opaPollingMaxDelay -}}
{{- else if .Values.global.nubusDeployment -}}
15
{{- else -}}
15
{{- end -}}
{{- end -}}

{{- define "guardian.openPolicyAgent.config.opaGuardianManagementUrl" -}}
{{- if .Values.openPolicyAgent.config.opaGuardianManagementUrl -}}
{{- .Values.openPolicyAgent.config.opaGuardianManagementUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-guardian-management-api/guardian/management" .Release.Name }}
{{- else -}}
http://guardian-management-api/guardian/management
{{- end -}}
{{- end -}}


{{- /*
PROVISIONING
*/}}

{{- define "guardian.provisioning.config.nubusBaseUrl" -}}
{{- if .Values.provisioning.config.nubusBaseUrl -}}
{{ .Values.provisioning.config.nubusBaseUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "https://%s.%s" .Values.global.subDomains.portal .Values.global.domain }}
{{- else -}}
{{ required ".Values.provisioning.config.nubusBaseUrl is required" .Values.provisioning.config.nubusBaseUrl -}}
{{- end -}}
{{- end -}}

{{- /*
PROVISIONING Keycloak
*/}}

{{- define "guardian.provisioning.keycloak.url" -}}
{{- if .Values.provisioning.keycloak.url -}}
{{ .Values.provisioning.keycloak.url -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-keycloak:8080/realms/%s" .Release.Name  (include "guardian.provisioning.keycloak.realm" .) }}
{{- else -}}
{{ required ".Values.provisioning.keycloak.url is required" .Values.provisioning.keycloak.url -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.keycloak.realm" -}}
{{- if .Values.provisioning.keycloak.realm -}}
{{- .Values.provisioning.keycloak.realm -}}
{{- else if .Values.global.nubusDeployment -}}
{{- coalesce .Values.provisioning.keycloak.realm .Values.global.keycloak.realm "nubus" -}}
{{- else -}}
{{- required ".Values.provisioning.keycloak.realm must be defined." .Values.provisioning.keycloak.realm -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.keycloak.connection.protocol" -}}
{{- if .Values.provisioning.keycloak.connection.protocol -}}
{{- .Values.provisioning.keycloak.connection.protocol -}}
{{- else -}}
http
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.keycloak.connection.host" -}}
{{- if .Values.provisioning.keycloak.connection.host -}}
{{- .Values.provisioning.keycloak.connection.host -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-keycloak" .Release.Name -}}
{{- else if not .Values.provisioning.keycloak.connection.baseUrl -}}
{{- required ".Values.provisioning.keycloak.connection.host must be defined." .Values.provisioning.keycloak.connection.host -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.keycloak.connection.port" -}}
{{- if .Values.provisioning.keycloak.connection.port -}}
{{- .Values.provisioning.keycloak.connection.port -}}
{{- else -}}
8080
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.keycloak.connection.baseUrl" -}}
{{- if .Values.provisioning.keycloak.connection.baseUrl -}}
{{- .Values.provisioning.keycloak.connection.baseUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{- $protocol := include "guardian.provisioning.keycloak.connection.protocol" . -}}
{{- $host := include "guardian.provisioning.keycloak.connection.host" . -}}
{{- $port := include "guardian.provisioning.keycloak.connection.port" . -}}
{{- printf "%s://%s:%s" $protocol $host $port -}}
{{- else -}}
{{- required ".Values.provisioning.keycloak.connection.baseUrl must be defined." .Values.provisioning.keycloak.connection.baseUrl -}}
{{- end -}}
{{- end -}}

{{- /*
POSGRESQL
*/}}

{{- define "guardian.postgresql.connection.host" -}}
{{- if or .Values.postgresql.connection.host .Values.global.postgresql.connection.host -}}
{{- tpl ( coalesce .Values.postgresql.connection.host .Values.global.postgresql.connection.host ) . -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-postgresql" .Release.Name -}}
{{- else -}}
{{- required ".Values.postgresql.connection.host or .Values.global.postgresql.connection.host must be defined." (coalesce .Values.postgresql.connection.host .Values.global.postgresql.connection.host) -}}
{{- end -}}
{{- end -}}

{{- define "guardian.postgresql.connection.port" -}}
{{- if or .Values.postgresql.connection.port .Values.global.postgresql.connection.port -}}
{{- tpl ( coalesce .Values.postgresql.connection.port .Values.global.postgresql.connection.port ) . -}}
{{- else -}}
5432
{{- end -}}
{{- end -}}

{{- define "guardian.postgresql.auth.database" -}}
{{- if .Values.postgresql.auth.database -}}
{{- .Values.postgresql.auth.database -}}
{{- else if .Values.global.nubusDeployment -}}
guardian
{{- else -}}
{{- required ".Values.postgresql.auth.database must be defined." .Values.postgresql.auth.database -}}
{{- end -}}
{{- end -}}

{{- define "guardian.ingress.tls.secretName" -}}
{{- if .Values.ingress.tls.secretName -}}
{{- tpl .Values.ingress.tls.secretName . -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-guardian-tls" .Release.Name -}}
{{- else -}}
{{- required ".Values.ingress.tls.secretName must be defined" .Values.ingress.tls.secretName -}}
{{- end -}}
{{- end -}}
