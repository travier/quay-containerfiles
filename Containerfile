FROM registry.fedoraproject.org/fedora:34 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.9.0"
ENV VAULT_SHA256="6ad8b09ca70d5c2822c871b7bd20ecdefb68e9da4c4b9aa6062000a9bff19f7a  vault_1.9.0_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
RUN echo "${VAULT_SHA256}" | sha256sum --check
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
CMD ["/vault"]
