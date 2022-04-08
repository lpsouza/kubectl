FROM ubuntu:latest
ARG K8S_VERSION=v1.14.3


RUN apt-get update && apt-get install -y apt-transport-https gnupg2 curl && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install -y kubectl helm jq

RUN curl -O https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh && \
    bash install.sh --accept-all-defaults

RUN rm install.sh

ENV PATH=/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
