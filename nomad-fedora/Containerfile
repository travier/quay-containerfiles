FROM registry.fedoraproject.org/fedora:35 as unzip

# From https://github.com/hashicorp/nomad-driver-podman/releases
ENV PODMAN_DRIVER_VERSION="0.3.0"
ENV PODMAN_DRIVER_SHA256="23ce5a3f9b41bbd1bc97d8e61e043f5e01d1d040ae9a2469267cbb851c8bbc90  nomad-driver-podman_0.3.0_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/nomad-driver-podman/${PODMAN_DRIVER_VERSION}/nomad-driver-podman_${PODMAN_DRIVER_VERSION}_linux_amd64.zip"
RUN echo "${PODMAN_DRIVER_SHA256}" | sha256sum --check
RUN unzip nomad-driver-podman_${PODMAN_DRIVER_VERSION}_linux_amd64.zip

FROM registry.fedoraproject.org/fedora:35

RUN dnf -y update && \
    dnf -y install dnf-plugins-core && \
    dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo && \
    dnf -y install nomad && \
    dnf clean all

RUN mkdir --parents /usr/lib/nomad/plugins
COPY --from=unzip /nomad-driver-podman /usr/lib/nomad/plugins/nomad-driver-podman

CMD ["/usr/bin/nomad"]
