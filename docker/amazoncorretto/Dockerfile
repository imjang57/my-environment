ARG BASE_IMG=python:3.7-slim-bullseye
FROM $BASE_IMG AS builder

USER root
WORKDIR /root

RUN set -eux \
    && apt update \
    && apt install -y --no-install-recommends build-essential software-properties-common lsb-release \
        bash git curl wget gnupg2 ca-certificates \
        zlib1g-dev libssl-dev libreadline-dev libffi-dev \
    && curl -fsSL https://apt.corretto.aws/corretto.key | apt-key add - \
    && add-apt-repository 'deb https://apt.corretto.aws stable main' \
    && apt update && apt install -y java-1.8.0-amazon-corretto-jdk \
    && addgroup --gid 1001 imjang57 \
    && adduser --uid 1001 --gid 1001 imjang57

ARG BASE_IMG=python:3.7-slim-bullseye
FROM $BASE_IMG AS runtime
LABEL maintainer="imjang57@gmail.com"
LABEL description="Python and JVM Base Image"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

USER root

RUN set -eux \
    && apt update \
    && apt install -y tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo 'Asia/Seoul' > /etc/timezone \
    && apt install -y bash git sudo net-tools jq tree openssh-client \
    && addgroup --gid 1001 imjang57 \
    && adduser --uid 1001 --gid 1001 imjang57

COPY --from=builder /usr/lib/jvm/ /usr/lib/jvm/

USER imjang57
WORKDIR /home/imjang57/

COPY --chown=imjang57 --chmod=755 entrypoint.sh /home/imjang57/entrypoint.sh

ENTRYPOINT ["/home/imjang57/entrypoint.sh"]
CMD []

