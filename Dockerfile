FROM ubuntu:18.04

LABEL description="PDI-CE (kettle) image for running, building and testing the solution."
LABEL maintainer="Jerome Mac Lean - CrossLogic Consulting"

# set base environment variables
ARG LOCALE=en_US.UTF-8
ENV TERM=xterm \
    LANGUAGE=${LOCALE} \
    LANG=${LOCALE} \
    LC_ALL=${LOCALE} \
    DEBIAN_FRONTEND=noninteractive \
    TMP_DOCKER_BUILD_DIR=/tmp/tmp-build \
    IMG_VERSION=0.5.6

#
# add repos and update
RUN mkdir -p ${TMP_DOCKER_BUILD_DIR} && \
    apt-get -o Acquire::ForceIPv4=true update && \
    apt-get upgrade -f -y && \
#
# Set the locale and timezone (Debian version)
    apt-get install -y tzdata locales && \
    locale-gen ${LOCALE} && \
    ln -fs /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
#
# pdi-ce: Additional packages
# libwebkitgtk-1.0-0 addresses the SWT issue: java.lang.UnsatisfiedLinkError: Could not load SWT library.
# http://pdiby.blogspot.com/2014/08/spoon-does-not-start-on-ubuntu-1204-any.html
    apt-get install -f -y \
    curl \
    git \
    golang \
    gzip \
    wget \
    zip \
    vim && \
#
# Cleanup
    rm -rf ${TMP_DOCKER_BUILD_DIR} && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "Done: cleanup"

#
# Install IMG
RUN curl -fSL "https://github.com/genuinetools/img/releases/download/v${IMG_VERSION}/img-linux-amd64" -o "/usr/local/bin/img" \
	&& chmod a+x "/usr/local/bin/img"

