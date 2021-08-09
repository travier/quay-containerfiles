FROM registry.fedoraproject.org/fedora:34 as unzip

# From https://www.nomadproject.io/downloads
ENV NOMAD_VERSION="1.1.3"
ENV NOMAD_SHA256="e07ebf9ec81fb04ace94884d2c0b0e0bdee3510d5a203bcae96d8bee9463b418  nomad_1.1.3_linux_amd64.zip"

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
