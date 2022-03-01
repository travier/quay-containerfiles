FROM registry.fedoraproject.org/fedora:35 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.11.4"
ENV CONSUL_SHA256="5155f6a3b7ff14d3671b0516f6b7310530b509a2b882b95b4fdf25f4219342c8  consul_1.11.4_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
