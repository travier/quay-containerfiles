FROM registry.fedoraproject.org/fedora:35

# Keep container image for 2 months
LABEL quay.expires-after=8w

RUN dnf -y update && \
    dnf -y install \
      vagrant \
      vagrant-libvirt \
    && \
    dnf clean all
