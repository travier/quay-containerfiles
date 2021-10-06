FROM registry.fedoraproject.org/fedora:34 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.10.3"
ENV CONSUL_SHA256="50afd45daaffd3af5ab67b03ff616117eca9961014ca0ef25ed2aaa27a7be698  consul_1.10.3_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
