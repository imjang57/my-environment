ARG BASE_IMG
FROM $BASE_IMG
LABEL maintainer="imjang57@gmail.com"

ENV WORKDIR=/opt
WORKDIR ${WORKDIR}
RUN mkdir -p ${WORKDIR}

# Install Bash Shell to use Bash Script instead of Ash Shell provided by BusyBox.
RUN sh -lc "apk add bash curl"

# set up nsswitch.conf for Go's "netgo" implementation
# - https://github.com/golang/go/blob/go1.9.1/src/net/conf.go#L194-L275
# - docker run --rm debian:stretch grep '^hosts:' /etc/nsswitch.conf
RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

ENV GOLANG_VERSION 1.13.4
ENV GOROOT_PREFIX /usr/local
ENV GOROOT ${GOROOT_PREFIX}/go
ENV GOPATH /opt/golang

COPY install-golang.sh ${WORKDIR}/
RUN bash -lc "chmod 755 ${WORKDIR}/install-golang.sh \
        && ${WORKDIR}/install-golang.sh \
        && rm ${WORKDIR}/install-golang.sh"
RUN bash -lc  'echo "PATH=${GOPATH}/bin:${GOROOT}/bin:${PATH}" >> /etc/profile'

# Copy entrypoint script
COPY entrypoint.sh ${WORKDIR}/
RUN bash -lc "chmod 755 ${WORKDIR}/entrypoint.sh"

#ENTRYPOINT [ ]
ENTRYPOINT [ "/opt/entrypoint.sh" ]
