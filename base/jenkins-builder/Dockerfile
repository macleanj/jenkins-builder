# docker build -t jmaclean/jenkins-builder:0.5.7 -f Dockerfile.jenkins-builder .
# docker push jmaclean/jenkins-builder:0.5.7
FROM r.j3ss.co/img:v0.5.7

LABEL description="Patched official img build for Jenkins (incl OpenShift)"
LABEL maintainer="Jerome Mac Lean - CrossLogic Consulting"

USER root
RUN mkdir -p /home/user/.local && \
    chmod 777 /home/user/.local && \
    chmod g=u /etc/passwd
ENTRYPOINT [ "docker-entrypoint.sh" ]
USER 1001
