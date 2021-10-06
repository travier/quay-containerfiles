FROM registry.fedoraproject.org/fedora:34 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.8.3"
ENV VAULT_SHA256="c756477a64726e57cc8261b6cf1dc09d99a19f643de76bf79f38b71c4be5984f  vault_1.8.3_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
RUN echo "${VAULT_SHA256}" | sha256sum --check
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
CMD ["/vault"]
