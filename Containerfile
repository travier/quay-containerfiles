FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.11.2"
ENV CONSUL_SHA256="380eaff1b18a2b62d8e1d8a7cbc3f3e08b34d3f7187ee335b891ca2ba98784b3  consul_1.11.2_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
