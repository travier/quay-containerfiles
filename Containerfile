FROM registry.fedoraproject.org/fedora:34

RUN dnf -y update && \
    dnf -y install nginx && \
    dnf clean all

USER nginx
CMD ["/usr/sbin/nginx"]
