FROM ubuntu:latest

LABEL maintainer="Andreas Juretzka <rx3422@gmail.com>" \
      version="0.1" \
      description="Image Tool-Pod"

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Install packages
RUN apt update && apt upgrade; apt -y install iputils-ping iputils-tracepath nmap netcat telnet mtr-tiny ipcalc podman skopeo buildah curl wget vim jq git gnupg2 dnsutils postgresql-client mysql-client; rm -rf /var/cache/apt

# Install yq
RUN wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && chmod u+x /usr/local/bin/yq

# Install oc and kubectl
RUN wget --https-only -O oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz && tar xf oc.tar.gz && mv oc kubectl /usr/local/bin && rm -f oc.tar.gz

ENTRYPOINT [ "/bin/sh" ]
CMD [ "-c", "sleep 1000000" ]

