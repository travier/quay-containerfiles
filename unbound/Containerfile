FROM registry.fedoraproject.org/fedora:35

RUN dnf -y update && \
    dnf -y install unbound && \
    dnf clean all

USER unbound
CMD ["/usr/sbin/unbound"]
