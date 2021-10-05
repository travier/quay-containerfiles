FROM registry.fedoraproject.org/fedora:34 as unzip

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.8.2"
ENV VAULT_SHA256="d74724d6cc22bf1e1c7c519009b0176809acf6f1c20ee56107de0cab54cd8463  vault_1.8.2_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
RUN echo "${VAULT_SHA256}" | sha256sum --check
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
CMD ["/vault"]
