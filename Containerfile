FROM registry.fedoraproject.org/fedora:34 as unzip

# Keep container image for 6 months
LABEL quay.expires-after=24w

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.11.1"
ENV CONSUL_SHA256="3d61ab768975f901a6ad19a7e083c3675d86fc118677c0d8003a29a7372f15ef  consul_1.11.1_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
