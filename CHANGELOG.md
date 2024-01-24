# Changelog

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
