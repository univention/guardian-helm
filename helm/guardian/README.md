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
    "guardianAuthzLoggingLevel": "",
    "guardianAuthzLoggingStructured": true,
    "home": "/guardian_service_dir",
    "isUniventionAppCenter": 0,
    "oauthAdapterWellKnownUrl": "",
    "opaAdapterUrl": "",
    "secretRef": "",
    "udmDataAdapterPassword": "",
    "udmDataAdapterPasswordFile": "/var/secrets/udmDataAdapterPassword",
    "udmDataAdapterUrl": "",
    "udmDataAdapterUsername": "",
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
    "enabled": false,
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
  "resources": {
    "limits": {
      "cpu": "4",
      "memory": "4Gi"
    },
    "requests": {
      "cpu": "250m",
      "memory": "512Mi"
    }
  },
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
			<td>authorizationApi.config.guardianAuthzAdapterAppPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"udm_data"
</pre>
</td>
			<td>Port and adapter to specify where to store the application data. Example: "udm_data"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzAdapterAuthenticationPort</td>
			<td>string</td>
			<td><pre lang="json">
"fast_api_oauth"
</pre>
</td>
			<td>Port and adapter for authentication. Use `fast_api_oauth` for integrated OIDC support. Example: "fast_api_oauth"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzAdapterPolicyPort</td>
			<td>string</td>
			<td><pre lang="json">
"opa"
</pre>
</td>
			<td>Port and adapter for policies. Defaults to `opa` for Open Policy Agent. Example: "opa"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzAdapterSettingsPort</td>
			<td>string</td>
			<td><pre lang="json">
"env"
</pre>
</td>
			<td>Port and adapter to specify where to read the settings from. Defaults to `env` for environment. Example: "env"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzCorsAllowedOrigins</td>
			<td>string</td>
			<td><pre lang="json">
"*"
</pre>
</td>
			<td>Comma-separated list of hosts that are allowed to make cross-origin resource sharing (CORS) requests to the server. Example: "*"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingFormat</td>
			<td>string</td>
			<td><pre lang="json">
"\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}"
</pre>
</td>
			<td>Defines the format of the log output, if not structured. The possible options are described in https://loguru.readthedocs.io/en/stable/api/logger.html. Example: "<green>{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}</green> | <level>{level}</level> | <level>{message}</level> | {extra}"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingLevel</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Sets the log level of the application. Chart defaults to: "DEBUG"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.guardianAuthzLoggingStructured</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>If set to True, the logging output is structured as a JSON object. Example: true</td>
		</tr>
		<tr>
			<td>authorizationApi.config.home</td>
			<td>string</td>
			<td><pre lang="json">
"/guardian_service_dir"
</pre>
</td>
			<td>Directory that Guardian will use to save the bundles and configuration. Example: /guardian_service_dir</td>
		</tr>
		<tr>
			<td>authorizationApi.config.oauthAdapterWellKnownUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>OIDC well-known url Example: "http://keycloak/realms/souvap/.well-known/openid-configuration"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.opaAdapterUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>URL to Open Policy Agent. Example: "http://ums-guardian-open-policy-agent:8181/"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.secretRef</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The reference to the secret containing `udmDataAdapterPassword` and `udmDataAdapterUsername` secret. Example: "guardian-udm-secret"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterPassword</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Password for authenticating against the UDM REST API. Do not use, see `secretRef` below. Example: "password"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterPasswordFile</td>
			<td>string</td>
			<td><pre lang="json">
"/var/secrets/udmDataAdapterPassword"
</pre>
</td>
			<td>File where the UDM password will be stored. Example: "/var/secrets/udmDataAdapterPassword"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The URL of the UDM REST API for data queries. Example: "http://udm-rest-api/univention/udm"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterUsername</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Username for authenticating against the UDM REST API Do not use, see `secretRef` below. Example: "cn=admin"</td>
		</tr>
		<tr>
			<td>authorizationApi.config.udmDataAdapterUsernameFile</td>
			<td>string</td>
			<td><pre lang="json">
"/var/secrets/udmDataAdapterUsername"
</pre>
</td>
			<td>File where the UDM username will be stored. Example: "/var/secrets/udmDataAdapterUsername"</td>
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
false
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
			<td>global.imageRegistry</td>
			<td>string</td>
			<td><pre lang="json">
"artifacts.software-univention.de"
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
    "guardianManagementAdapterAuthorizationApiUrl": "",
    "guardianManagementAdapterCapabilityPersistencePort": "sql",
    "guardianManagementAdapterConditionPersistencePort": "sql",
    "guardianManagementAdapterContextPersistencePort": "sql",
    "guardianManagementAdapterNamespacePersistencePort": "sql",
    "guardianManagementAdapterPermissionPersistencePort": "sql",
    "guardianManagementAdapterResourceAuthorizationPort": "guardian",
    "guardianManagementAdapterRolePersistencePort": "sql",
    "guardianManagementAdapterSettingsPort": "env",
    "guardianManagementBaseUrl": "",
    "guardianManagementCorsAllowedOrigins": "*",
    "guardianManagementLoggingFormat": "\u003cgreen\u003e{time:YYYY-MM-DD HH:mm:ss.SSS ZZ}\u003c/green\u003e | \u003clevel\u003e{level}\u003c/level\u003e | \u003clevel\u003e{message}\u003c/level\u003e | {extra}",
    "guardianManagementLoggingLevel": "DEBUG",
    "guardianManagementLoggingStructured": true,
    "home": "/guardian_service_dir",
    "isUniventionAppCenter": 0,
    "oauthAdapterM2mSecret": "",
    "oauthAdapterM2mSecretFile": "/var/secrets/oauthAdapterM2mSecret",
    "oauthAdapterWellKnownUrl": "",
    "secretRef": "",
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
    "enabled": false,
    "host": null,
    "ingressClassName": "nginx",
    "paths": [
      {
        "backend": {
          "service": {
            "name": "guardian-management-api",
            "port": {
              "number": 80
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
  "resources": {
    "limits": {
      "cpu": "4",
      "memory": "4Gi"
    },
    "requests": {
      "cpu": "250m",
      "memory": "512Mi"
    }
  },
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
			<td>managementApi.config.guardianManagementAdapterAppPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting app data. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterAuthenticationPort</td>
			<td>string</td>
			<td><pre lang="json">
"fast_api_oauth"
</pre>
</td>
			<td>Port and adapter for authentication. Use `fast_api_oauth` for integrated OIDC support.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterAuthorizationApiUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>URL to the Authorization API. Example: http://guardian-management-api/guardian/authorization</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterCapabilityPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting capabilities. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterConditionPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting conditions. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterContextPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting contexts. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterNamespacePersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting namespaces. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterPermissionPersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting permissions. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterRolePersistencePort</td>
			<td>string</td>
			<td><pre lang="json">
"sql"
</pre>
</td>
			<td>Port and adapter for persisting roles. Defaults to `sql`.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementAdapterSettingsPort</td>
			<td>string</td>
			<td><pre lang="json">
"env"
</pre>
</td>
			<td>Port and adapter for where to get the settings from. Defaults to `env` to read from environment.</td>
		</tr>
		<tr>
			<td>managementApi.config.guardianManagementBaseUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Defines the base URL of the API. If unset the url is generated from hostname and domainname. Example: "http://example.test/guardian/management"</td>
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
			<td>managementApi.config.home</td>
			<td>string</td>
			<td><pre lang="json">
"/guardian_service_dir"
</pre>
</td>
			<td>Directory that Guardian will use to save the bundles and configuration.</td>
		</tr>
		<tr>
			<td>managementApi.config.oauthAdapterM2mSecret</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Machine-to-machine secret (not used, see `secretRef` below)</td>
		</tr>
		<tr>
			<td>managementApi.config.oauthAdapterM2mSecretFile</td>
			<td>string</td>
			<td><pre lang="json">
"/var/secrets/oauthAdapterM2mSecret"
</pre>
</td>
			<td>File where the machine-to-machine secret will be saved.</td>
		</tr>
		<tr>
			<td>managementApi.config.oauthAdapterWellKnownUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Identity Provider well known URL Example: http://keycloak/realms/souvap/.well-known/openid-configuration</td>
		</tr>
		<tr>
			<td>managementApi.config.secretRef</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The reference to the secret containing `oauthAdapterM2mSecret` secret.</td>
		</tr>
		<tr>
			<td>managementApi.config.sqlPersistenceAdapterDialect</td>
			<td>string</td>
			<td><pre lang="json">
"postgresql"
</pre>
</td>
			<td>Dialect of the database.</td>
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
false
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
{
  "limits": {
    "cpu": "4",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
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
""
</pre>
</td>
			<td>URL for the Guardian Management API from outside. Will be queried from the client. Example: "https://porta.example.test/guardian/management"</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterClientId</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-ui"
</pre>
</td>
			<td>Keycloak client ID. Must be provisioned either by the `provisioning` job in this chart or manually.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterRealm</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak authentication realm.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteKeycloakAuthenticationAdapterSsoUri</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Base URI of the Keycloak server for authentication. Example: "https://id.example.test"</td>
		</tr>
		<tr>
			<td>managementUi.config.viteManagementUiAdapterAuthenticationPort</td>
			<td>string</td>
			<td><pre lang="json">
"keycloak"
</pre>
</td>
			<td>Port and adapter for authentication. Defaults to `keycloak`.</td>
		</tr>
		<tr>
			<td>managementUi.config.viteManagementUiAdapterDataPort</td>
			<td>string</td>
			<td><pre lang="json">
"api"
</pre>
</td>
			<td>Port and adapter to use as data source for the UI. Defaults to `api` for Guardian's Management API.</td>
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
false
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
{
  "limits": {
    "cpu": "4",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
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
""
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
false
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
			<td>openPolicyAgent.ingress.paths[0].backend.service.name</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-open-policy-agent"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.ingress.paths[0].backend.service.port.number</td>
			<td>int</td>
			<td><pre lang="json">
80
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
{
  "limits": {
    "cpu": "4",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
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
    "credentialSecret": {
      "key": "password",
      "name": ""
    },
    "database": "",
    "password": "",
    "username": ""
  },
  "bundled": false,
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
false
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
      "admin": "",
      "credentialSecret": {
        "key": ""
      },
      "fqdn": "",
      "password": "",
      "realm": "",
      "url": ""
    },
    "managementApi": {
      "clientSecret": "",
      "credentialSecret": {
        "key": ""
      }
    },
    "nubusBaseUrl": ""
  },
  "enabled": true,
  "image": {
    "imagePullSecrets": [],
    "registry": "",
    "repository": "nubus-dev/images/guardian-init",
    "sha256": null,
    "tag": "latest"
  },
  "podSecurityContext": {
    "fsGroup": 1000,
    "fsGroupChangePolicy": "Always"
  },
  "provisioningImage": {
    "imagePullSecrets": [],
    "registry": "registry.opencode.de",
    "repository": "bmi/opendesk/components/platform-development/images/opendesk-keycloak-bootstrap",
    "tag": "1.0.5@sha256:76ccd9a74ae2c2dabb6beaa0192c15b9c06763abbd632cd0f8db68e5d8d5883c"
  },
  "restartPolicy": "OnFailure",
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "privileged": false,
    "readOnlyRootFilesystem": false,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "tolerations": [],
  "ttlSecondsAfterFinished": 300
}
</pre>
</td>
			<td>The Guardian Keycloak provisioning job</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak</td>
			<td>object</td>
			<td><pre lang="json">
{
  "admin": "",
  "credentialSecret": {
    "key": ""
  },
  "fqdn": "",
  "password": "",
  "realm": "",
  "url": ""
}
</pre>
</td>
			<td>Keycloak specific settings.</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.admin</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak admin user for the master realm. Example: "kcadmin"</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.credentialSecret.key</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The key in which the Keycloak admin password is stored in the secret. Example: "adminPassword"</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.fqdn</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Fully qualified domain name for Keycloak. Example: "id.uv-example.gaia.open-desk.cloud"</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.password</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Specify this only if you do not want to use a secret (see below).</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.realm</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Realm where the Guardian clients should be created. Example: "nubus"</td>
		</tr>
		<tr>
			<td>provisioning.config.keycloak.url</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Internal URL to reach Keycloak for provisioning. Example: "http://keycloak:8080"</td>
		</tr>
		<tr>
			<td>provisioning.config.managementApi</td>
			<td>object</td>
			<td><pre lang="json">
{
  "clientSecret": "",
  "credentialSecret": {
    "key": ""
  }
}
</pre>
</td>
			<td>Management API settings for the provisioning job</td>
		</tr>
		<tr>
			<td>provisioning.config.managementApi.clientSecret</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Specify this only if you do not want to use a secret (see below).</td>
		</tr>
		<tr>
			<td>provisioning.config.managementApi.credentialSecret</td>
			<td>object</td>
			<td><pre lang="json">
{
  "key": ""
}
</pre>
</td>
			<td>The name of a secret that contains `managementApiClientSecret`. Example: "managementApiClientSecret"</td>
		</tr>
		<tr>
			<td>provisioning.config.nubusBaseUrl</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Base URL for setting in Keycloak application URL without backslash. Example: "https://portal.uv-example.gaia.open-desk.cloud"</td>
		</tr>
		<tr>
			<td>provisioning.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Whether to run the provisioning job to create the Guardian clients in Keycloak or not.</td>
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
		<tr>
			<td>provisioning.podSecurityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Change ownership and permission of the volume before being exposed inside a Pod.</td>
		</tr>
		<tr>
			<td>provisioning.ttlSecondsAfterFinished</td>
			<td>int</td>
			<td><pre lang="json">
300
</pre>
</td>
			<td>Time in seconds until the job gets deleted</td>
		</tr>
	</tbody>
</table>

