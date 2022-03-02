FROM registry.fedoraproject.org/fedora-toolbox:35

# Keep container image for 2 months
LABEL quay.expires-after=8w

RUN dnf -y distrosync && \
    dnf -y install \
      vagrant \
      vagrant-libvirt \
    && \
    dnf -y remove mlocate && \
    dnf clean all
