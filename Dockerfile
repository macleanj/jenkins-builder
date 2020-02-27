FROM r.j3ss.co/img:0.5.7

LABEL description="Patched official img build"
LABEL maintainer="Jerome Mac Lean - CrossLogic Consulting"

USER root

# Add user for Jenkins builds
RUN adduser -D -u 1002860099 jenkins \
  && mkdir -p /run/jenkins/1002860099 \
  && chown -R jenkins /run/jenkins/1002860099 /home/jenkins \
  && echo jenkins:100000:65536 | tee /etc/subuid | tee /etc/subgid

USER jenkins
ENV USER jenkins
ENV HOME /home/jenkins
ENV XDG_RUNTIME_DIR=/run/jenkins/1002860099
