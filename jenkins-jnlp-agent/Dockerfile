# docker build -t jmaclean/jenkins-jnlp-slave:3.40-1 -f Dockerfile.jenkins-jnlp-slave .
# docker push jmaclean/jenkins-jnlp-slave:3.40-1
FROM jenkins/jnlp-slave:3.40-1

LABEL   description="Patched official jnlp-slave build for Jenkins" \
        maintainer="Jerome Mac Lean - CrossLogic Consulting <jerome@crosslogic-consulting.com>"

USER root

ARG HOME="/home/jenkins/"
RUN chown -R 1000:0 ${HOME} && \
    chmod -R g+rw ${HOME}

USER 1000
