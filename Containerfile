FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.11.3"
ENV CONSUL_SHA256="782b8bc0bc94e6d9f0dceb3272fca0e629d8d9d0f039b1a7749e3218f6f2424c  consul_1.11.3_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
