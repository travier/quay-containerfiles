FROM registry.fedoraproject.org/fedora:34

# Keep container image for 2 months
LABEL quay.expires-after=8w

RUN dnf -y update && \
    dnf -y install nginx && \
    dnf clean all

USER nginx
CMD ["/usr/sbin/nginx"]
