FROM registry.fedoraproject.org/fedora:34 as unzip

# From https://www.consulproject.io/downloads
ENV CONSUL_VERSION="1.10.2"
ENV CONSUL_SHA256="1dd31062da703d9f778145c38313f4e48cb498aa254720636ff7935b6a03dceb  consul_1.10.2_linux_amd64.zip"

RUN dnf -y update && \
    dnf -y install unzip && \
    dnf clean all

RUN curl -O "https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip"
RUN echo "${CONSUL_SHA256}" | sha256sum --check
RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip

FROM scratch
COPY --from=unzip /consul .
CMD ["/consul"]
