# Changelog

## [0.9.1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.9.0...v0.9.1) (2024-07-09)


### Bug Fixes

* missing dot ([3565509](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/3565509b48cc28948be784e8668f4c8de12bf090))

## [0.9.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.8.0...v0.9.0) (2024-07-09)


### Features

* adjust ingress configuration to support Nubus deployment without stack-gateway or centralized ingress configuration ([4f60c96](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/4f60c9631d3814f6c737fd3587a65119fbe50f6a))


### Bug Fixes

* missing global postgresql conf ([5f6e767](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/5f6e767a62978d9b415864c78957e4bdaab5ce37))

## [0.8.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.7.0...v0.8.0) (2024-07-04)


### Features

* support global postgres ([d872171](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/d8721719c7130832691aa445ce0bb619c54432fe))

## [0.7.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.6.0...v0.7.0) (2024-06-14)


### Features

* management-ui is BSI compliante ([799fbb6](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/799fbb6a55b419d1ac48f3e84f8a33ef5782c212))
* move initial configuration to initContainer ([12143b9](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/12143b90f173c57c7567c8cd916c52a2024f1bf5))


### Bug Fixes

* removed unused volumes and fix configmap typo ([f002923](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/f00292383ef3156a9bb73d2534411656ca65496f))

## [0.6.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.5.1...v0.6.0) (2024-05-31)


### Features

* **init:** drop univention-keycloak ([8e4a2c4](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/8e4a2c48bf167a6403f7dee077b50ef189bfc511))
* **provisioning:** use openDesk provisioning ([90544e1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/90544e1d74aef100f077bd8468dcb772840e84a4))


### Bug Fixes

* **postgresql:** overwrite local postgresql registry to avoid global.imageRegistry ([eed6dbc](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/eed6dbcc82f675bdc2e68d4ce7fecc2018aa008c))

## [0.5.1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.5.0...v0.5.1) (2024-05-24)


### Bug Fixes

* use global registry ([81fd416](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/81fd4168f025d0156256a569dfbe6cb3d5ee6a41))

## [0.5.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.4.3...v0.5.0) (2024-05-23)


### Features

* push to harbor ([d77d93b](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/d77d93b7c73541494596becb93501df1291d6493))
* push to harbor ([8f293aa](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/8f293aa17a5ea973d0c93740c367b7c4934c8b74))

## [0.4.3](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.4.2...v0.4.3) (2024-05-23)


### Bug Fixes

* **helm:** keycloak ports ([2054f31](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/2054f3163aec206e8b392e9ab940a49b86dbd4ed))

## [0.4.2](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.4.1...v0.4.2) (2024-05-21)


### Bug Fixes

* default nubus values ([cf4b276](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/cf4b2766d21c8130a3e60a6ce128b502aab71329))

## [0.4.1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.4.0...v0.4.1) (2024-05-21)


### Bug Fixes

* selectors and labels for services ([c7aecef](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/c7aecefccad0ea24d84b6aa2e8d5f4a1c1a0344e))

## [0.4.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.3.1...v0.4.0) (2024-05-17)


### Features

* **helm:** reduce duplicated values ([c3f3c57](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/c3f3c57623d4303a88373947dafcf1ca9a74c9e6))


### Bug Fixes

* **helm:** ingress class and disabled by default ([f386211](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/f386211baa95540904875625b35cf5d47908f3cb))
* **helm:** require host parameter if ingress is enabled ([6f9b113](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/6f9b1130d8c14520f2c77467f94b0f92c14068f9))

## [0.3.1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.3.0...v0.3.1) (2024-05-15)


### Bug Fixes

* Drop call to "apt-get update" from guardian-init ([0ecc88d](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/0ecc88d6cc3180ab7a32622d87bfe57b11f437a8))
* Use "--no-install-recommends" in call to "apt-get install" ([aef5423](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/aef5423ee33e36fb3c8c2793f7e151430f3633d0))
* Use a date tagged base image in guardian-init ([03ae128](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/03ae1284f08dc712b5dee17403ea61307d948ff7))

## [0.3.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.2.1...v0.3.0) (2024-04-05)


### Features

* **docker:** univention-keycloak provisioning init image ([012d65b](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/012d65bc54740fe258afc866c01e0c0f1768e0b0))
* **helm:** provisioning job and refactor ([c7b3573](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/c7b3573c78ea2981d22b91e5ebfffb1eb0d9f77b))


### Bug Fixes

* different service selector matchLabels for -ui and -api ([5f29ab4](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/5f29ab41a60c4ce8d741845f53d3c42c0d35b6b3))
* **docs:** better documentation for configuration values ([e07c86a](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/e07c86acf1d7077a06cb582e1069eb82aa9ea9cc))

## [0.2.1](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.2.0...v0.2.1) (2024-03-26)


### Bug Fixes

* **ci:** update common-ci from v1.16.1 to v1.25.0 ([31ad20d](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/31ad20dbde317c15c67fd1f3f98b2958ea40a29a))

## [0.2.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.1.0...v0.2.0) (2024-01-24)


### Features

* Add "ingress.host" into linter_values ([dda95f0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/dda95f076410f7251a7915d4469f5af2b160c54c))
* Downgrade the bundled postgresql to "~12.7.1" ([d1437c4](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/d1437c424cd773428320e0b0f52f6f83701a5c55))

## [0.1.0](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/compare/v0.0.1...v0.1.0) (2024-01-16)


### Features

* **helm:** compatibility updates for new release ([9d54b64](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/9d54b64b159df48c05b2e566b7624109d6c06fd7))

## 0.0.1 (2024-01-16)


### Features

* **authorization:** add helm chart for authorization-api and opa ([ab4d63f](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/ab4d63fb23380ab3606070f54c1336825197f5f3)), closes [univention/customers/dataport/team-souvap#342](https://git.knut.univention.de/univention/customers/dataport/team-souvap/issues/342)
* **management:** add helm chart for management-api and ui ([0ed42a6](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/0ed42a6e06c81f4bfa0699d95b58c0a5523a2cd0)), closes [univention/customers/dataport/team-souvap#342](https://git.knut.univention.de/univention/customers/dataport/team-souvap/issues/342)
* setup versioning ([8907569](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/8907569861091f7c9118bc665250254c8cbc064c))


### Bug Fixes

* **helm:** management-api secret handling ([2e601fe](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/2e601fe0fdad8da731a09fbb72ec929972b07846))
* **helm:** remove dependency charts ([a442d48](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/a442d4886697b436b5e2d507e6b210b14151e6dc))
* **pre-commit:** exclude helm directory because .md files below it are auto-generated ([ac13ced](https://git.knut.univention.de/univention/customers/dataport/upx/guardian-helm/commit/ac13ced1e15d4ce3c47b51e8df97b1bd3427fd2e)), closes [univention/customers/dataport/team-souvap#342](https://git.knut.univention.de/univention/customers/dataport/team-souvap/issues/342)
