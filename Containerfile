FROM registry.fedoraproject.org/fedora:34 as unzip

# From https://www.nomadproject.io/downloads
ENV NOMAD_VERSION="1.1.2"
ENV NOMAD_SHA256="fa25e3353db520ac94b1a28c0b08a9ceb35c807c35987ae21910a41c179730d0  nomad_1.1.2_linux_amd64.zip"

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
