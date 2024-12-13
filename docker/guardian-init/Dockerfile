# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2024 Univention GmbH

ARG UCS_BASE_IMAGE_TAG=0.14.0-build-2024-12-12
ARG UCS_BASE_IMAGE=gitregistry.knut.univention.de/univention/components/ucs-base-image/ucs-base-520

FROM ${UCS_BASE_IMAGE}:${UCS_BASE_IMAGE_TAG} AS base

# hadolint ignore=DL3008
RUN \
    apt-get install -y --no-install-recommends \
    curl \
    jq \
    python3 \
    python3-requests \
    python3-defusedxml \
    python3-keycloak \
    python3-ldap && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
