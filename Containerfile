FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.vaultproject.io/downloads
ENV VAULT_VERSION="1.9.4"
ENV VAULT_SHA256="9be49dc07a1b73cc78dd5e5cca88588758bb1994fd954ae2c983eb5986887db5  vault_1.9.4_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip"
RUN echo "${VAULT_SHA256}" | sha256sum --check
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /vault .
CMD ["/vault"]
