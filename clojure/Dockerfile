FROM clojure:lein-2.8.1
LABEL description="Helper for Jenkins builds"
LABEL maintainer="Jerome Mac Lean - CrossLogic Consulting <jerome@crosslogic-consulting.com>"

# ---- Left for reference. Can be deleted when the pipeline is migrated.
# MAINTAINER Yannick Scherer <yannick.scherer@futurice.com>

# RUN yum update -y \
#         && yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
#         && yum clean all

# RUN export PATH=/usr/lib/jvm/java/bin:$PATH && java -version \
#         && curl -sL https://raw.github.com/technomancy/leiningen/2.8.1/bin/lein > /usr/local/bin/lein \
#         && chmod a+x /usr/local/bin/lein \
#         && lein version

# USER 1001


# FROM clojure:alpine
# RUN mkdir -p /usr/src/app
# COPY project.clj /usr/src/app/
# COPY maven_repository /usr/src/app/maven_repository
# WORKDIR /usr/src/app
# RUN lein deps
# COPY . /usr/src/app
# RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" calc-lib-service-0.1.0-SNAPSHOT-standalone.jar
# WORKDIR /usr/src/app
# CMD ["java", "-jar", "calc-lib-service-0.1.0-SNAPSHOT-standalone.jar"]
