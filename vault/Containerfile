FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.10.2"
ENV VAULT_SHA256="97f355fc435e5e768f1c7f40b6e1c40d6062e01dcfc0adb6b966dab49e9de7d1  vault_1.10.2_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
RUN echo "${VAULT_SHA256}" | sha256sum --check
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
CMD ["/vault"]
