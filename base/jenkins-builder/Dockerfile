# docker build -t jmaclean/jenkins-builder:0.5.7 -f Dockerfile .
# docker push jmaclean/jenkins-builder:0.5.7
FROM r.j3ss.co/img:v0.5.7

LABEL description="Patched official img build for Jenkins (incl OpenShift)"
LABEL maintainer="Jerome Mac Lean - CrossLogic Consulting"

# OpenShift client version
ARG OC_VERSION=3.11.184

USER root

# Dependencies
RUN apk add --update-cache \
    curl && \
    rm -rf /var/cache/apk/*

# OpenShift client
RUN curl -sLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v$(echo $OC_VERSION | cut -d'.' -f 1)/clients/$OC_VERSION/linux/oc.tar.gz && \
    tar xzvf /tmp/oc.tar.gz -C /usr/local/bin/ && \
    rm -rf /tmp/oc.tar.gz

RUN mkdir -p /home/user/.local && \
    chmod 777 /home/user/.local && \
    chmod g=u /etc/passwd

ENTRYPOINT [ "docker-entrypoint.sh" ]
USER 1001
