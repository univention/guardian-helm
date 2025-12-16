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
| oci://artifacts.software-univention.de/nubus/charts | nubus-common | 0.28.0 |

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
			<td>additionalAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Additional custom annotations to add to all deployed objects.</td>
		</tr>
		<tr>
			<td>additionalLabels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Additional custom labels to add to all deployed objects.</td>
		</tr>
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
    "udmDataAdapterPasswordFile": "/var/secrets/udm-data-adapter-password",
    "udmDataAdapterUrl": "",
    "udmDataAdapterUsernameFile": "/var/guardian/udm-data-adapter-username"
  },
  "containerSecurityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "enabled": true,
    "privileged": false,
    "readOnlyRootFilesystem": true,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "environment": {},
  "extraEnvVars": [],
  "fullnameOverride": "",
  "image": {
    "pullPolicy": null,
    "registry": "artifacts.software-univention.de",
    "repository": "nubus/images/guardian-authorization-api-authorization-api",
    "sha256": null,
    "tag": "3.0.3@sha256:24ff5252a0372370f19a4ac6067cbf27b70f974e527a8f843ec781e84813f8a6"
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
    "enabled": true,
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
  "tolerations": [],
  "udm": {
    "auth": {
      "existingSecret": {
        "keyMapping": {
          "password": null
        },
        "name": null
      },
      "username": null
    }
  }
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
			<td>authorizationApi.config.udmDataAdapterPasswordFile</td>
			<td>string</td>
			<td><pre lang="json">
"/var/secrets/udm-data-adapter-password"
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
			<td>authorizationApi.config.udmDataAdapterUsernameFile</td>
			<td>string</td>
			<td><pre lang="json">
"/var/guardian/udm-data-adapter-username"
</pre>
</td>
			<td>File where the UDM username will be stored. Example: "/var/secrets/udmDataAdapterUsername"</td>
		</tr>
		<tr>
			<td>authorizationApi.extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
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
			<td>authorizationApi.podSecurityContext.fsGroupChangePolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Always"
</pre>
</td>
			<td>Change ownership and permission of the volume before being exposed inside a Pod.</td>
		</tr>
		<tr>
			<td>authorizationApi.udm.auth.existingSecret</td>
			<td>object</td>
			<td><pre lang="json">
{
  "keyMapping": {
    "password": null
  },
  "name": null
}
</pre>
</td>
			<td>Password for authenticating against the UDM REST API. Either this value or an existing Secret has to be specified. Not supported at the moment. password: null</td>
		</tr>
		<tr>
			<td>authorizationApi.udm.auth.existingSecret.keyMapping.password</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>The key to retrieve the password from. Setting this value allows to use a key with a different name than the default "password".</td>
		</tr>
		<tr>
			<td>authorizationApi.udm.auth.existingSecret.name</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>The name of an existing Secret to use for retrieving the password</td>
		</tr>
		<tr>
			<td>authorizationApi.udm.auth.username</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Username for authenticating against the UDM REST API Example: "cn=admin"</td>
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
			<td>extraIngresses</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Extra ingress configuration</td>
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
			<td>global.domain</td>
			<td>string</td>
			<td><pre lang="json">
""
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
			<td>global.imagePullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
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
			<td>global.postgresql.connection.host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.postgresql.connection.port</td>
			<td>string</td>
			<td><pre lang="json">
""
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
			<td>global.subDomains.keycloak</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>global.subDomains.portal</td>
			<td>string</td>
			<td><pre lang="json">
"portal"
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
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Credentials to fetch images from private registry. Ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/  imagePullSecrets:   - "docker-registry"</td>
		</tr>
		<tr>
			<td>ingress.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Define custom ingress annotations for all Ingresses.</td>
		</tr>
		<tr>
			<td>ingress.certManager.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable cert-manager.io annotaion.</td>
		</tr>
		<tr>
			<td>ingress.certManager.issuerRef.kind</td>
			<td>string</td>
			<td><pre lang="json">
"ClusterIssuer"
</pre>
</td>
			<td>Type of Issuer, f.e. "Issuer" or "ClusterIssuer".</td>
		</tr>
		<tr>
			<td>ingress.certManager.issuerRef.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Name of cert-manager.io Issuer resource.</td>
		</tr>
		<tr>
			<td>ingress.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable creation of Ingress.</td>
		</tr>
		<tr>
			<td>ingress.host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Define the Fully Qualified Domain Name (FQDN) where application should be reachable. (This will be the default for all Ingresses)</td>
		</tr>
		<tr>
			<td>ingress.ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The Ingress controller class name. (This will be the default for all Ingresses)</td>
		</tr>
		<tr>
			<td>ingress.items[0].annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[0].host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[0].ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[0].name</td>
			<td>string</td>
			<td><pre lang="json">
"management-ui"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[0].paths</td>
			<td>list</td>
			<td><pre lang="json">
[
  {
    "backend": {
      "service": {
        "name": "guardian-management-ui",
        "port": {
          "number": 80
        }
      }
    },
    "path": "/univention/guardian/management-ui",
    "pathType": "Prefix"
  }
]
</pre>
</td>
			<td>Define the Ingress paths.</td>
		</tr>
		<tr>
			<td>ingress.items[0].tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].name</td>
			<td>string</td>
			<td><pre lang="json">
"management-api"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].paths[0].backend.service.name</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-management-api"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].paths[0].backend.service.port.number</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/guardian/management"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[1].tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].ingressClassName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].name</td>
			<td>string</td>
			<td><pre lang="json">
"authorization-api"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].paths[0].backend.service.name</td>
			<td>string</td>
			<td><pre lang="json">
"guardian-authorization-api"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].paths[0].backend.service.port.number</td>
			<td>int</td>
			<td><pre lang="json">
80
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].paths[0].path</td>
			<td>string</td>
			<td><pre lang="json">
"/guardian/authorization"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].paths[0].pathType</td>
			<td>string</td>
			<td><pre lang="json">
"Prefix"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.items[2].tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>ingress.tls</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": true,
  "secretName": ""
}
</pre>
</td>
			<td>Secure an Ingress by specifying a Secret that contains a TLS private key and certificate.  Ref.: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls</td>
		</tr>
		<tr>
			<td>ingress.tls.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td>Enable TLS/SSL/HTTPS for Ingress.</td>
		</tr>
		<tr>
			<td>ingress.tls.secretName</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>The name of the kubernetes secret which contains a TLS private key and certificate. Hint: This secret is not created by this chart and must be provided.</td>
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
    "oauthAdapterM2mSecretFile": "/var/secrets/oauthAdapterM2mSecret",
    "oauthAdapterWellKnownUrl": "https://{{ .Values.global.subDomains.keycloak }}.{{ .Values.global.domain }}/realms/{{ .Values.global.keycloak.realm }}/.well-known/openid-configuration",
    "sqlPersistenceAdapterDialect": "postgresql"
  },
  "containerSecurityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "enabled": true,
    "privileged": false,
    "readOnlyRootFilesystem": true,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "environment": {},
  "extraEnvVars": [],
  "fullnameOverride": "",
  "image": {
    "pullPolicy": null,
    "registry": "artifacts.software-univention.de",
    "repository": "nubus/images/guardian-management-api-management-api",
    "sha256": null,
    "tag": "3.0.3@sha256:8be5ac8fd6341f414a4e678fba8577c47a5062e8c29ef260a8e6a68ffaf08577"
  },
  "nameOverride": "",
  "nodeSelector": {},
  "oauth": {
    "auth": {
      "clientSecret": null,
      "existingSecret": {
        "keyMapping": {
          "clientSecret": null
        },
        "name": null
      }
    }
  },
  "persistence": {
    "data": {
      "size": "1Gi",
      "storageClass": ""
    }
  },
  "podAnnotations": {},
  "podSecurityContext": {
    "enabled": true,
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
"https://{{ .Values.global.subDomains.keycloak }}.{{ .Values.global.domain }}/realms/{{ .Values.global.keycloak.realm }}/.well-known/openid-configuration"
</pre>
</td>
			<td>Identity Provider well known URL Example: http://keycloak/realms/souvap/.well-known/openid-configuration</td>
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
			<td>managementApi.extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
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
			<td>managementApi.oauth.auth.clientSecret</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>Machine-to-machine secret. Either this value or an existing Secret has to be specified.</td>
		</tr>
		<tr>
			<td>managementApi.oauth.auth.existingSecret.keyMapping</td>
			<td>object</td>
			<td><pre lang="json">
{
  "clientSecret": null
}
</pre>
</td>
			<td>The key to retrieve the secret from. Setting this value allows to use a key with a different name than the default "clientSecret".</td>
		</tr>
		<tr>
			<td>managementApi.oauth.auth.existingSecret.name</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>The reference to the secret containing `oauthAdapterM2mSecret` secret.</td>
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
			<td>managementUi.config.nginx</td>
			<td>object</td>
			<td><pre lang="json">
{
  "disableIPv6": false
}
</pre>
</td>
			<td>Configuration for the Nginx server serving the guardian management ui built files.</td>
		</tr>
		<tr>
			<td>managementUi.config.nginx.disableIPv6</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Disable IPv6 support.</td>
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
			<td>managementUi.containerSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.privileged</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.containerSecurityContext.seccompProfile.type</td>
			<td>string</td>
			<td><pre lang="json">
"RuntimeDefault"
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
			<td>managementUi.extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
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
			<td>managementUi.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"artifacts.software-univention.de"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"nubus/images/guardian-management-ui-management-ui"
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
"3.0.3@sha256:72a2531449a3e9c88b5eeedf1b9a8a87fb12134dce8221591502ee6f91b58935"
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
			<td>managementUi.podSecurityContext.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.podSecurityContext.fsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.podSecurityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>managementUi.podSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
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
8080
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
			<td>openPolicyAgent.containerSecurityContext.allowPrivilegeEscalation</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.capabilities.drop[0]</td>
			<td>string</td>
			<td><pre lang="json">
"ALL"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.privileged</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.readOnlyRootFilesystem</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.runAsGroup</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.runAsNonRoot</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.runAsUser</td>
			<td>int</td>
			<td><pre lang="json">
1000
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.containerSecurityContext.seccompProfile.type</td>
			<td>string</td>
			<td><pre lang="json">
"RuntimeDefault"
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
			<td>openPolicyAgent.extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
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
			<td>openPolicyAgent.image.pullPolicy</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.registry</td>
			<td>string</td>
			<td><pre lang="json">
"artifacts.software-univention.de"
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>openPolicyAgent.image.repository</td>
			<td>string</td>
			<td><pre lang="json">
"nubus/images/guardian-authorization-api-opa"
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
"3.0.3@sha256:dbbb375402fb3a56a76ad30103a99601ca80959a2268860604ff523da904f285"
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
			<td>openPolicyAgent.podSecurityContext.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
true
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
    "database": "",
    "existingSecret": {
      "keyMapping": {
        "password": null
      },
      "name": null
    },
    "password": "",
    "username": ""
  },
  "connection": {
    "host": null,
    "port": null
  }
}
</pre>
</td>
			<td>PostgreSQL settings.  Configuration of the postgresql connection</td>
		</tr>
		<tr>
			<td>postgresql.auth.existingSecret.keyMapping.password</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>The key to retrieve the password from. Setting this value allows to use a key with a different name than the default "password".</td>
		</tr>
		<tr>
			<td>postgresql.auth.existingSecret.name</td>
			<td>string</td>
			<td><pre lang="json">
null
</pre>
</td>
			<td>The name of an existing Secret to use for retrieving the password</td>
		</tr>
		<tr>
			<td>postgresql.auth.password</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Password for authenticating against the PostgreSQL database. Either this value or an existing Secret has to be specified.</td>
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
    "debug": {
      "enabled": false,
      "pauseBeforeScriptStart": 0
    },
    "nubusBaseUrl": ""
  },
  "containerSecurityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "enabled": true,
    "privileged": false,
    "readOnlyRootFilesystem": true,
    "runAsGroup": 1000,
    "runAsNonRoot": true,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "enabled": true,
  "extraEnvVars": [],
  "image": {
    "registry": null,
    "repository": "nubus/images/wait-for-dependency",
    "sha256": null,
    "tag": "0.35.33@sha256:0570b6e8f57d27fe3c856d53c324b2e0457ad83ead442d54a3af806ea0f6a626"
  },
  "keycloak": {
    "auth": {
      "existingSecret": {
        "keyMapping": {
          "adminPassword": null
        },
        "name": null
      },
      "password": "",
      "username": ""
    },
    "connection": {
      "host": "",
      "port": ""
    },
    "realm": ""
  },
  "podSecurityContext": {
    "enabled": true,
    "fsGroup": 1000,
    "fsGroupChangePolicy": "Always"
  },
  "provisioningImage": {
    "pullPolicy": null,
    "registry": null,
    "repository": "nubus/images/keycloak-bootstrap",
    "tag": "0.19.18@sha256:78260a633dbc91dafbcdd5b310b93d34cb209b8b9b91eec7df037ecca22bd756"
  },
  "resources": {
    "limits": {
      "cpu": "500m",
      "memory": "512Mi"
    },
    "requests": {
      "cpu": "100m",
      "memory": "256Mi"
    }
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
			<td>provisioning.config.debug.enabled</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td>Enable debug output of included Ansible scripts</td>
		</tr>
		<tr>
			<td>provisioning.config.debug.pauseBeforeScriptStart</td>
			<td>int</td>
			<td><pre lang="json">
0
</pre>
</td>
			<td>Seconds for the job to pause before starting the actual bootstrapping.</td>
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
			<td>provisioning.extraEnvVars</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Array with extra environment variables to add to containers.  extraEnvVars:   - name: FOO     value: "bar"</td>
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
			<td>provisioning.keycloak</td>
			<td>object</td>
			<td><pre lang="json">
{
  "auth": {
    "existingSecret": {
      "keyMapping": {
        "adminPassword": null
      },
      "name": null
    },
    "password": "",
    "username": ""
  },
  "connection": {
    "host": "",
    "port": ""
  },
  "realm": ""
}
</pre>
</td>
			<td>Keycloak specific settings.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.auth.existingSecret</td>
			<td>object</td>
			<td><pre lang="json">
{
  "keyMapping": {
    "adminPassword": null
  },
  "name": null
}
</pre>
</td>
			<td>Keycloak password secret reference.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.auth.password</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak password.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.auth.username</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak user.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.connection</td>
			<td>object</td>
			<td><pre lang="json">
{
  "host": "",
  "port": ""
}
</pre>
</td>
			<td>Connection parameters.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.connection.host</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak host.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.connection.port</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak port.</td>
		</tr>
		<tr>
			<td>provisioning.keycloak.realm</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Keycloak realm.</td>
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
		<tr>
			<td>serviceAccount.annotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.automountServiceAccountToken</td>
			<td>bool</td>
			<td><pre lang="json">
false
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.create</td>
			<td>bool</td>
			<td><pre lang="json">
true
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>serviceAccount.labels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Additional custom labels for the ServiceAccount.</td>
		</tr>
		<tr>
			<td>serviceAccount.name</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
	</tbody>
</table>

