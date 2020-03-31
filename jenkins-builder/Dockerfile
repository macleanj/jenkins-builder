# docker build -t jmaclean/jenkins-builder:0.5.7 -f Dockerfile .
# docker push jmaclean/jenkins-builder:0.5.7
FROM r.j3ss.co/img:v0.5.7

LABEL   description="Patched official img build for Jenkins" \
        maintainer="Jerome Mac Lean - CrossLogic Consulting <jerome@crosslogic-consulting.com>"

# Versions. E.g. OpenShift client
ARG OC_VERSION=3.11.184

# Environment
ENV USER_NAME=user \
    USER_ID=1000

USER root

# Dependencies
RUN apk add --update-cache \
    bash \
    curl \
    tar && \
    rm -rf /var/cache/apk/*

# Install glibc, then locale. Version hardcoded.
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    apk add glibc-2.30-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-bin-2.30-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-i18n-2.30-r0.apk && \
    apk add glibc-bin-2.30-r0.apk glibc-i18n-2.30-r0.apk && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8

# OpenShift client
RUN curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v$(echo $OC_VERSION | cut -d'.' -f 1)/clients/$OC_VERSION/linux/oc.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz

RUN mkdir -p \
        /home/user/.local \
        /home/user/.kube \
        /home/user/.docker && \
    chmod 777 \
        /home/user/.local \
        /home/user/.kube \
        /home/user/.docker && \
    chmod g=u /etc/passwd

USER ${USER_ID}
