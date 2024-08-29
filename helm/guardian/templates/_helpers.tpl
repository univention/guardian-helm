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
{{- printf "http://%s-udm-rest-api/udm/" .Release.Name -}}
{{- else -}}
{{- printf "http://udm-rest-api/udm/" -}}
{{- end -}}
{{- end -}}

{{- define "guardian.managementUi.config.viteApiDataAdapterUri" -}}
{{- if .Values.managementUi.config.viteApiDataAdapterUri -}}
{{- .Values.managementUi.config.viteApiDataAdapterUri -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "https://%s.%s/guardian/management" .Values.global.subDomains.portal .Values.global.domain }}
{{- else -}}
{{- required "managementUi.config.viteApiDataAdepterUri is required" .Values.managementUi.config.viteApiDataAdapterUri -}}
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

{{- define "guardian.authorizationApi.config.secretRef" -}}
{{- if .Values.authorizationApi.config.secretRef -}}
{{- .Values.authorizationApi.config.secretRef -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "%s-guardian-udm-secret" .Release.Name }}
{{- else -}}
{{- required "A authorizationApi.config.secretRef containing `udmDataAdapterPassword` and `udmDataAdapterUsername` is needed." .Values.authorizationApi.config.secretRef -}}
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

{{- define "guardian.managementApi.config.oauthAdapterWellKnownUrl" -}}
{{- if .Values.managementApi.config.oauthAdapterWellKnownUrl -}}
{{ required ".Values.managementApi.config.oauthAdapterWellKnownUrl is required" .Values.managementApi.config.oauthAdapterWellKnownUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-keycloak:8080/realms/%s/.well-known/openid-configuration" .Release.Name .Values.global.keycloak.realm }}
{{- else -}}
{{- required "managementApi oAuth well known URL is required" .Values.managementApi.config.oauthAdapterWellKnownUrl -}}
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

{{- define "guardian.managementApi.config.secretRef" -}}
{{- if .Values.managementApi.config.secretRef -}}
{{- .Values.managementApi.config.secretRef -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "%s-guardian-keycloak-client-secret" .Release.Name }}
{{- else -}}
{{- required "A managementApi.config.secretRef containing `OAUTH_ADAPTER__M2M_SECRET` is needed." .Values.managementApi.config.secretRef -}}
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

{{- define "guardian.provisioning.config.keycloak.url" -}}
{{- if .Values.provisioning.config.keycloak.url -}}
{{ .Values.provisioning.config.keycloak.url -}}
{{- else if .Values.global.nubusDeployment -}}
{{ printf "http://%s-keycloak:8080/realms/%s" .Release.Name  (include "guardian.provisioning.config.keycloak.realm" .) }}
{{- else -}}
{{ required ".Values.provisioning.config.keycloak.url is required" .Values.provisioning.config.keycloak.url -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.realm" -}}
{{- if .Values.provisioning.config.keycloak.realm -}}
{{- .Values.provisioning.config.keycloak.realm -}}
{{- else if .Values.global.nubusDeployment -}}
{{- coalesce .Values.provisioning.config.keycloak.realm .Values.global.keycloak.realm "nubus" -}}
{{- else -}}
{{- required ".Values.provisioning.config.keycloak.realm must be defined." .Values.provisioning.config.keycloak.realm -}}
{{- end -}}
{{- end -}}

{{- define "keycloak-bootstrap.keycloak.auth.masterRealm" -}}
{{- if .Values.provisioning.config.keycloak.masterRealm -}}
{{- .Values.provisioning.config.keycloak.masterRealm -}}
{{- else if .Values.global.nubusDeployment -}}
master
{{- else -}}
{{- required ".Values.provisioning.config.keycloak.masterRealm must be defined." .Values.provisioning.config.keycloak.masterRealm -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.username" -}}
{{- if .Values.provisioning.config.keycloak.username -}}
{{- .Values.provisioning.config.keycloak.username -}}
{{- else if .Values.global.nubusDeployment -}}
kcadmin
{{- else -}}
{{- required ".Values.provisioning.config.keycloak.username must be defined." .Values.provisioning.config.keycloak.username -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.credentialSecret.name" -}}
{{- if .Values.provisioning.config.keycloak.credentialSecret.name -}}
{{- .Values.provisioning.config.keycloak.credentialSecret.name -}}
{{- else if .Values.provisioning.config.keycloak.password -}}
{{ printf "%s-keycloak-credentials" (include "common.names.fullname" .) }}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-guardian-provisioning-secret" .Release.Name -}}
{{- else -}}
{{ required ".Values.provisioning.config.keycloak.password must be defined." .Values.provisioning.config.keycloak.password}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.credentialSecret.key" -}}
{{- if .Values.provisioning.config.keycloak.credentialSecret.key -}}
{{- .Values.provisioning.config.keycloak.credentialSecret.key -}}
{{- else if .Values.global.nubusDeployment -}}
adminPassword
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.password" -}}
{{- if .Values.provisioning.config.keycloak.credentialSecret.name -}}
valueFrom:
  secretKeyRef:
    name: {{ .Values.provisioning.config.keycloak.credentialSecret.name | quote }}
    key: {{ .Values.provisioning.config.keycloak.credentialSecret.key | quote }}
{{- else if .Values.global.nubusDeployment -}}
valueFrom:
  secretKeyRef:
    name: {{ include "guardian.provisioning.config.keycloak.credentialSecret.name" . | quote }}
    key: {{ .Values.provisioning.config.keycloak.credentialSecret.key | quote }}
{{- else -}}
value: {{ required ".Values.provisioning.config.keycloak.password is required." .Values.provisioning.config.keycloak.password | quote }}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.connection.protocol" -}}
{{- if .Values.provisioning.config.keycloak.connection.protocol -}}
{{- .Values.provisioning.config.keycloak.connection.protocol -}}
{{- else -}}
http
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.connection.host" -}}
{{- if .Values.provisioning.config.keycloak.connection.host -}}
{{- .Values.provisioning.config.keycloak.connection.host -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-keycloak" .Release.Name -}}
{{- else if not .Values.provisioning.config.keycloak.connection.baseUrl -}}
{{- required ".Values.provisioning.config.keycloak.connection.host must be defined." .Values.provisioning.config.keycloak.connection.host -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.connection.port" -}}
{{- if .Values.provisioning.config.keycloak.connection.port -}}
{{- .Values.provisioning.config.keycloak.connection.port -}}
{{- else -}}
8080
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.keycloak.connection.baseUrl" -}}
{{- if .Values.provisioning.config.keycloak.connection.baseUrl -}}
{{- .Values.provisioning.config.keycloak.connection.baseUrl -}}
{{- else if .Values.global.nubusDeployment -}}
{{- $protocol := include "guardian.provisioning.config.keycloak.connection.protocol" . -}}
{{- $host := include "guardian.provisioning.config.keycloak.connection.host" . -}}
{{- $port := include "guardian.provisioning.config.keycloak.connection.port" . -}}
{{- printf "%s://%s:%s" $protocol $host $port -}}
{{- else -}}
{{- required ".Values.provisioning.config.keycloak.connection.baseUrl must be defined." .Values.provisioning.config.keycloak.connection.baseUrl -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.managementApi.credentialSecret.name" -}}
{{- if .Values.provisioning.config.managementApi.credentialSecret.name -}}
{{- .Values.provisioning.config.managementApi.credentialSecret.name -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-guardian-provisioning-secret" .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.managementApi.credentialSecret.key" -}}
{{- if .Values.provisioning.config.managementApi.credentialSecret.key -}}
{{- .Values.provisioning.config.managementApi.credentialSecret.key -}}
{{- else if .Values.global.nubusDeployment -}}
managementApiClientSecret
{{- end -}}
{{- end -}}

{{- define "guardian.provisioning.config.managementApi.clientSecret" -}}
{{- if .Values.provisioning.config.managementApi.credentialSecret.name -}}
valueFrom:
  secretKeyRef:
    name: {{ .Values.provisioning.config.managementApi.credentialSecret.name | quote }}
    key: {{ .Values.provisioning.config.managementApi.credentialSecret.key | quote }}
{{- else if .Values.global.nubusDeployment -}}
valueFrom:
  secretKeyRef:
    name: {{ include "guardian.provisioning.config.managementApi.credentialSecret.name" . | quote }}
    key: {{ include "guardian.provisioning.config.managementApi.credentialSecret.key" . | quote }}
{{- else -}}
value: {{ required ".Values.provisioning.config.managementApi.clientSecret is required." .Values.provisioning.config.managementApi.clientSecret | quote }}
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

{{- define "guardian.postgresql.auth.username" -}}
{{- if .Values.postgresql.auth.username -}}
{{- .Values.postgresql.auth.username -}}
{{- else if .Values.global.nubusDeployment -}}
guardian
{{- else -}}
{{- required ".Values.postgresql.auth.username must be defined." .Values.postgresql.auth.username -}}
{{- end -}}
{{- end -}}

{{- define "guardian.postgresql.auth.credentialSecret.name" -}}
{{- if .Values.postgresql.auth.credentialSecret.name -}}
{{- .Values.postgresql.auth.credentialSecret.name -}}
{{- else if .Values.global.nubusDeployment -}}
{{- printf "%s-guardian-management-api-postgresql-credentials" .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "guardian.postgresql.auth.password" -}}
{{- if .Values.postgresql.auth.credentialSecret.name -}}
valueFrom:
  secretKeyRef:
    name: {{ .Values.postgresql.auth.credentialSecret.name | quote }}
    key: {{ .Values.postgresql.auth.credentialSecret.key | quote }}
{{- else if .Values.global.nubusDeployment -}}
valueFrom:
  secretKeyRef:
    name: {{ include "guardian.postgresql.auth.credentialSecret.name" . | quote }}
    key: {{ .Values.postgresql.auth.credentialSecret.key | quote }}
{{- else -}}
value: {{ required ".Values.postgresql.auth.password is required." .Values.postgresql.auth.password | quote }}
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
