FROM gitregistry.knut.univention.de/univention/components/ucs-base-image/ucs-base-507 as base

RUN apt-get update --quiet && \
  apt-get install -y \
    curl \
    jq \
    python3 \
    python3-requests \
    python3-defusedxml \
    python3-keycloak \
    python3-ldap && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY univention-keycloak /app/univention-keycloak
RUN ln -s /app/univention-keycloak /usr/bin/univention-keycloak
