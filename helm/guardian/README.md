# guardian

The Guardian provides an authorization service for apps used with a Nubus system.
Authorization is the confirmation of a user’s access to some resource, such
as the ability to modify a user’s data, export data from a system, or view a
web page. It’s important to note that the Guardian itself only informs about
the result of an authorization request. The app itself must enforce the
result of any authorization.

The authorization service consists of three applications:
  - Management API
  - Authorization API
  - Management UI
  - Open Policy Agent
At a minimum, you must install the Management API, the Authorization API and
the Open Policy Agent. The Management UI provides an optional graphical user
interface for the Management API.

More documentation can be found at https://docs.software-univention.de/guardian-manual/latest

- **Version**: 0.1.0
- **Type**: application
- **AppVersion**: 2.0.0
-

## Introduction

This chart does install the Guardian Authorization API.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | common | ^2.x.x |
| https://charts.bitnami.com/bitnami | postgresql | ~12.7.1 |

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>authorizationApi</td>
			<td>object</td>
			<td><pre lang="json">
{
  "affinity": {},
  "config": {
    "guardianAuthzAdapterAppPersistencePort": "udm_data",
    "guardianAuthzAdapterAuthenticationPort": "fast_api_oauth",
    "guardianAuthzAdapterPolicyPort": "opa",
    "guardianAuthzAdapterSettingsPort": "env",
    "guardianAuthzCorsAllowedOrigins": "*",
    "guardianAuthzLoggingFormat": "\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}",
    "guardianAuthzLoggingLevel": "DEBUG",
    "guardianAuthzLoggingStructured": true,
    "home": "/guardian_service_dir",
    "isUniventionAppCenter": 0,
    "oauthAdapterWellKnownUrl": "http://keycloak/realms/souvap/.well-known/openid-configuration",
    "opaAdapterUrl": "http://open-policy-agent:8181/",
    "udmDataAdapterPassword": "",
    "udmDataAdapterPasswordFile": "/var/secrets/udmDataAdapterPassword",
    "udmDataAdapterUrl": "http://udm-rest-api/univention/udm",
    "udmDataAdapterUsername": "admin",
    "udmDataAdapterUsernameFile": "/var/secrets/udmDataAdapterUsername"
  },
  "environment": {},
  "fullnameOverride": "",
  "image": {
    "imagePullPolicy": "Always",
    "imagePullSecrets": [],
    "registry": "docker.software-univention.de",
    "repository": "guardian-authorization-api-authorization-api",
    "sha256": null,
    "tag": "2.0.0"
  },
  "ingress": {
    "enabled": true,
    "host": null,
    "ingressClassName": "nginx",
    "paths": [
      {
        "backend": {
          "service": {
            "name": "guardian-authorization-api",
            "port": {
              "number": 80
            }
          }
        },
        "path": "/guardian/authorization",
        "pathType": "Prefix"
      }
    ],
    "tls": {
      "enabled": true,
      "secretName": ""
    }
  },
  "nameOverride": "",
  "nodeSelector": {},
  "persistence": {
    "data": {
      "size": "1Gi",
      "storageClass": ""
    }
  },
  "podAnnotations": {},
  "podSecurityContext": {
    "fsGroup": 1000,
    "fsGroupChangePolicy": "Always"
  },
  "probes": {
    "liveness": {
      "enabled": true,
      "failureThreshold": 3,
      "initialDelaySeconds": 120,
      "periodSeconds": 30,
      "successThreshold": 1,
      "timeoutSeconds": 3
    },
    "readiness": {
      "enabled": true,
      "failureThreshold": 30,
      "initialDelaySeconds": 30,
      "periodSeconds": 15,
      "successThreshold": 1,
      "timeoutSeconds": 3
    }
  },
  "replicaCount": 1,
  "resources": {},
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "privileged": false,
    "readOnlyRootFilesystem": true,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "enabled": true,
    "ports": {
      "http": {
        "containerPort": 8000,
        "port": 80,
        "protocol": "TCP"
      }
    },
    "sessionAffinity": {
      "enabled": false,
      "timeoutSeconds": 10800
    },
    "type": "ClusterIP"
  },
  "tolerations": []
}
</pre>
</td>
			<td>The Guardian authorization API</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzCorsAllowedOrigins</td>
			<td>string</td>
			<td><pre lang="json">
"*"
</pre>
</td>
			<td>Comma-separated list of hosts that are allowed to make cross-origin resource sharing (CORS) requests to the server.</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingFormat</td>
			<td>string</td>
			<td><pre lang="json">
"\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}"
</pre>
</td>
			<td>Defines the format of the log output, if not structured. The possible options are described in https://loguru.readthedocs.io/en/stable/api/logger.html.</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingLevel</td>
			<td>string</td>
			<td><pre lang="json">
"DEBUG"
</pre>
</td>
			<td>Sets the log level of the application.</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingStructured</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>If set to True, the logging output is structured as a JSON object.</td>
		</tr>
		<tr>
			<td>authorizationApi.config.oauthAdapterWellKnownUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://keycloak/realms/souvap/.well-known/openid-configuration"
</pre>
</td>
			<td>OIDC well-known url</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterPassword</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Password for authenticating against the UDM REST API</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://udm-rest-api/univention/udm"
</pre>
</td>
			<td>The URL of the UDM REST API for data queries.</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterUsername</td>
			<td>string</td>
			<td><pre lang="json">
"admin"
</pre>
</td>
			<td>Username for authenticating against the UDM REST API</td>
		</tr>
		<tr>
			<td>authorizationApi.image.sha256</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Define image sha256 as an alternative to `tag`</td>
		</tr>
		<tr>
			<td>authorizationApi.ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Set this to `true` in order to enable the installation on Ingress related objects.</td>
		</tr>
		<tr>
			<td>authorizationApi.podSecurityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Change ownership and permission of the volume before being exposed inside a Pod.</td>
		</tr>
		<tr>
			<td>extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
		</tr>
		<tr>
			<td>extraSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Optionally specify a secret to create (primarily intended to be used in development environments to provide custom certificates)</td>
		</tr>
		<tr>
			<td>extraVolumeMounts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Optionally specify an extra list of additional volumeMounts.</td>
		</tr>
		<tr>
			<td>extraVolumes</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Optionally specify an extra list of additional volumes.</td>
		</tr>
		<tr>
			<td>global.affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.environment</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.securityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementApi</td>
			<td>object</td>
			<td><pre lang="json">
{
  "affinity": {},
  "config": {
    "guardianManagementAdapterAppPersistencePort": "sql",
    "guardianManagementAdapterAuthenticationPort": "fast_api_oauth",
    "guardianManagementAdapterAuthorizationApiUrl": "http://guardian-management-api/guardian/authorization",
    "guardianManagementAdapterCapabilityPersistencePort": "sql",
    "guardianManagementAdapterConditionPersistencePort": "sql",
    "guardianManagementAdapterContextPersistencePort": "sql",
    "guardianManagementAdapterNamespacePersistencePort": "sql",
    "guardianManagementAdapterPermissionPersistencePort": "sql",
    "guardianManagementAdapterResourceAuthorizationPort": "guardian",
    "guardianManagementAdapterRolePersistencePort": "sql",
    "guardianManagementAdapterSettingsPort": "env",
    "guardianManagementBaseUrl": "http://guardian-management",
    "guardianManagementCorsAllowedOrigins": "*",
    "guardianManagementLoggingFormat": "\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}",
    "guardianManagementLoggingLevel": "DEBUG",
    "guardianManagementLoggingStructured": true,
    "home": "/guardian_service_dir",
    "isUniventionAppCenter": 0,
    "oauthAdapterM2mSecret": "stub_client_secret",
    "oauthAdapterM2mSecretFile": "/var/secrets/oauthAdapterM2mSecret",
    "oauthAdapterWellKnownUrl": "http://keycloak/realms/souvap/.well-known/openid-configuration",
    "secretRef": "guardian-keycloak-client-secret",
    "sqlPersistenceAdapterDialect": "postgresql"
  },
  "environment": {},
  "fullnameOverride": "",
  "image": {
    "imagePullPolicy": "Always",
    "imagePullSecrets": [],
    "registry": "docker.software-univention.de",
    "repository": "guardian-management-api-management-api",
    "sha256": null,
    "tag": "2.0.0"
  },
  "ingress": {
    "enabled": true,
    "host": null,
    "ingressClassName": "nginx",
    "paths": [
      {
        "backend": {
          "service": {
            "name": "guardian-management-api",
            "port": {
              "number": 8000
            }
          }
        },
        "path": "/guardian/management",
        "pathType": "Prefix"
      }
    ],
    "tls": {
      "enabled": true,
      "secretName": ""
    }
  },
  "nameOverride": "",
  "nodeSelector": {},
  "persistence": {
    "data": {
      "size": "1Gi",
      "storageClass": ""
    }
  },
  "podAnnotations": {},
  "podSecurityContext": {
    "fsGroup": 1000,
    "fsGroupChangePolicy": "Always"
  },
  "probes": {
    "liveness": {
      "enabled": true,
      "failureThreshold": 3,
      "initialDelaySeconds": 120,
      "periodSeconds": 30,
      "successThreshold": 1,
      "timeoutSeconds": 3
    },
    "readiness": {
      "enabled": true,
      "failureThreshold": 30,
      "initialDelaySeconds": 30,
      "periodSeconds": 15,
      "successThreshold": 1,
      "timeoutSeconds": 3
    }
  },
  "replicaCount": 1,
  "resources": {},
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "privileged": false,
    "readOnlyRootFilesystem": true,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "enabled": true,
    "ports": {
      "http": {
        "containerPort": 8000,
        "port": 80,
        "protocol": "TCP"
      }
    },
    "sessionAffinity": {
      "enabled": false,
      "timeoutSeconds": 10800
    },
    "type": "ClusterIP"
  },
  "tolerations": []
}
</pre>
</td>
			<td>The Guardian management API</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterAuthorizationApiUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://guardian-management-api/guardian/authorization"
</pre>
</td>
			<td>URL to the Authorization API.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementBaseUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://guardian-management"
</pre>
</td>
			<td>Defines the base URL of the API. If unset the url is generated from hostname and domainname.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementCorsAllowedOrigins</td>
			<td>string</td>
			<td><pre lang="json">
"*"
</pre>
</td>
			<td>Comma-separated list of hosts that are allowed to make cross-origin resource sharing (CORS) requests to the server.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementLoggingFormat</td>
			<td>string</td>
			<td><pre lang="json">
"\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}"
</pre>
</td>
			<td>Defines the format of the log output, if not structured. The possible options are described in https://loguru.readthedocs.io/en/stable/api/logger.html.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementLoggingLevel</td>
			<td>string</td>
			<td><pre lang="json">
"DEBUG"
</pre>
</td>
			<td>Sets the log level of the application.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementLoggingStructured</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>If set to True, the logging output is structured as a JSON object.</td>
		</tr>
		<tr>
			<td>managementApi.config.oauthAdapterWellKnownUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://keycloak/realms/souvap/.well-known/openid-configuration"
</pre>
</td>
			<td>Identity Provider well known URL</td>
		</tr>
		<tr>
			<td>managementApi.config.secretRef</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-keycloak-client-secret"
</pre>
</td>
			<td>The reference to the secret containing the LDAP and machine secret.</td>
		</tr>
		<tr>
			<td>managementApi.image.sha256</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Define image sha256 as an alternative to `tag`</td>
		</tr>
		<tr>
			<td>managementApi.ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Set this to `true` in order to enable the installation on Ingress related objects.</td>
		</tr>
		<tr>
			<td>managementApi.podSecurityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Change ownership and permission of the volume before being exposed inside a Pod.</td>
		</tr>
		<tr>
			<td>managementApi.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Deployment resources for the listener container</td>
		</tr>
		<tr>
			<td>managementUi.affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.config.viteApiDataAdapterUri</td>
			<td>string</td>
			<td><pre lang="json">
"http://localhost:8000/guardian/management"
</pre>
</td>
			<td>URL for the Guardian Management API.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterClientId</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-ui"
</pre>
</td>
			<td>Keycloak client ID.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterRealm</td>
			<td>string</td>
			<td><pre lang="json">
"ucs"
</pre>
</td>
			<td>Keycloak authentication realm.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterSsoUri</td>
			<td>string</td>
			<td><pre lang="json">
"http://localhost:8097"
</pre>
</td>
			<td>Base URI of the Keycloak server for authentication.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteManagementUiAdapterAuthenticationPort</td>
			<td>string</td>
			<td><pre lang="json">
"keycloak"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.config.viteManagementUiAdapterDataPort</td>
			<td>string</td>
			<td><pre lang="json">
"api"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.environment</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.imagePullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"docker.software-univention.de"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-management-ui-management-ui"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.sha256</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Define image sha256 as an alternative to `tag`</td>
		</tr>
		<tr>
			<td>managementUi.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"2.0.0"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Set this to `true` in order to enable the installation on Ingress related objects.</td>
		</tr>
		<tr>
			<td>managementUi.ingress.host</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
"nginx"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.paths[0].backend.service.name</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-management-ui"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.paths[0].backend.service.port.number</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/univention/guardian/management-ui"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.tls.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.ingress.tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.persistence.data.size</td>
			<td>string</td>
			<td><pre lang="json">
"1Gi"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.persistence.data.storageClass</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
120
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.liveness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
15
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.probes.readiness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Deployment resources for the listener container</td>
		</tr>
		<tr>
			<td>managementUi.securityContext</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.ports.http.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.ports.http.port</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.ports.http.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.sessionAffinity.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.sessionAffinity.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10800
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.service.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.isUniventionAppCenter</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.opaDataBundle</td>
			<td>string</td>
			<td><pre lang="json">
"bundles/GuardianDataBundle.tar.gz"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.opaGuardianManagementUrl</td>
			<td>string</td>
			<td><pre lang="json">
"http://guardian-management-api/guardian/management"
</pre>
</td>
			<td>Bundle server URL</td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.opaPolicyBundle</td>
			<td>string</td>
			<td><pre lang="json">
"bundles/GuardianPolicyBundle.tar.gz"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.opaPollingMaxDelay</td>
			<td>int</td>
			<td><pre lang="json">
15
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.config.opaPollingMinDelay</td>
			<td>int</td>
			<td><pre lang="json">
10
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.environment</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.imagePullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"docker.software-univention.de"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-authorization-api-opa"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.sha256</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Define image sha256 as an alternative to `tag`</td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.tag</td>
			<td>string</td>
			<td><pre lang="json">
"2.0.0"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Set this to `true` in order to enable the installation on Ingress related objects.</td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.host</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
"nginx"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/guardian/opa"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.tls.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.podSecurityContext.fsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.podSecurityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Change ownership and permission of the volume before being exposed inside a Pod.</td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
120
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.liveness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.failureThreshold</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.initialDelaySeconds</td>
			<td>int</td>
			<td><pre lang="json">
30
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.periodSeconds</td>
			<td>int</td>
			<td><pre lang="json">
15
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.successThreshold</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.probes.readiness.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
3
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Deployment resources for the listener container</td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.privileged</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.securityContext.seccompProfile.type</td>
			<td>string</td>
			<td><pre lang="json">
"RuntimeDefault"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.ports.http.containerPort</td>
			<td>int</td>
			<td><pre lang="json">
8181
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.ports.http.port</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.ports.http.protocol</td>
			<td>string</td>
			<td><pre lang="json">
"TCP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.sessionAffinity.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.sessionAffinity.timeoutSeconds</td>
			<td>int</td>
			<td><pre lang="json">
10800
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.service.type</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIP"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>postgresql</td>
			<td>object</td>
			<td><pre lang="json">
{
  "auth": {
    "database": "guardian",
    "password": "guardian",
    "postgresPassword": "guardian",
    "username": "guardian"
  },
  "bundled": true,
  "connection": {
    "host": null,
    "port": null
  },
  "nameOverride": "guardian-postgresql"
}
</pre>
</td>
			<td>PostgreSQL settings.  The bitnami helm chart does contain all details of what can be configured: https://github.com/bitnami/charts/tree/main/bitnami/postgresql</td>
		</tr>
		<tr>
			<td>postgresql.bundled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Set to `true` if you want PostgreSQL to be installed as well.</td>
		</tr>
		<tr>
			<td>postgresql.connection</td>
			<td>object</td>
			<td><pre lang="json">
{
  "host": null,
  "port": null
}
</pre>
</td>
			<td>Connection parameters. These are required if you use an external database.</td>
		</tr>
		<tr>
			<td>provisioning</td>
			<td>object</td>
			<td><pre lang="json">
{
  "backoffLimit": 900,
  "config": {
    "keycloak": {
      "admin": "kcadmin",
      "fqdn": "id.uv-example.gaia.open-desk.cloud/",
      "realm": "opendesk",
      "url": "http://ums-keycloak:8080"
    },
    "nubusBaseUrl": "https://portal.uv-example.gaia.open-desk.cloud/"
  },
  "credentialSecretName": "guardian-keycloak-secret",
  "image": {
    "imagePullPolicy": "Always",
    "imagePullSecrets": [],
    "registry": "gitregistry.knut.univention.de",
    "repository": "univention/customers/dataport/upx/guardian-helm/guardian-init",
    "sha256": null,
    "tag": "0.3.0-pre-jconde-guardian-provisioning"
  },
  "restartPolicy": "OnFailure",
  "tolerations": [],
  "ttlSecondsAfterFinished": 300
}
</pre>
</td>
			<td>The Guardian Keycloak provisioning job</td>
		</tr>
		<tr>
			<td>provisioning.credentialSecretName</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-keycloak-secret"
</pre>
</td>
			<td>The name of a secret that contains `KEYCLOAK_ADMIN_PASSWORD` and `GUARDIAN_MANAGEMENT_API_CLIENT_SECRET`</td>
		</tr>
		<tr>
			<td>provisioning.image.sha256</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Define image sha256 as an alternative to `tag`</td>
		</tr>
	</tbody>
</table>

