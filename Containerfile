FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.nomadproject.io/downloads
ENV NOMAD_VERSION="1.2.4"
ENV NOMAD_SHA256="51ae6aede9a2ec1bc73065b84881c5a4d67eeb1328ee5bf189b10c4f4e72805d  nomad_1.2.4_linux_amd64.zip"

# From https://github.com/hashicorp/nomad-driver-podman/releases
ENV PODMAN_DRIVER_VERSION="0.3.0"
ENV PODMAN_DRIVER_SHA256="23ce5a3f9b41bbd1bc97d8e61e043f5e01d1d040ae9a2469267cbb851c8bbc90  nomad-driver-podman_0.3.0_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip"
RUN echo "${NOMAD_SHA256}" | sha256sum --check
RUN unzip nomad_${NOMAD_VERSION}_linux_amd64.zip

RUN curl -O "https://releases.hashicorp.com/nomad-driver-podman/${PODMAN_DRIVER_VERSION}/nomad-driver-podman_${PODMAN_DRIVER_VERSION}_linux_amd64.zip"
RUN echo "${PODMAN_DRIVER_SHA256}" | sha256sum --check
RUN unzip nomad-driver-podman_${PODMAN_DRIVER_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /nomad .
COPY --from=unzip /nomad-driver-podman .
CMD ["/nomad"]
