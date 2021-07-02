FROM registry.fedoraproject.org/fedora:34

RUN dnf -y update && \
    dnf -y install unbound && \
    dnf clean all

USER unbound
CMD ["/usr/sbin/unbound"]
