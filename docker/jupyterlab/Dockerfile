################################################################################
# Builder
################################################################################
ARG BASE_IMG=python:3.7-slim-bullseye
FROM $BASE_IMG AS builder

USER root
WORKDIR /root
ENV PIPENV_VENV_IN_PROJECT=1

RUN set -x \
    && apt update \
    && apt install -y bash git curl gnupg2 build-essential lsb-release \
    && apt install -y zlib1g-dev libssl-dev libreadline-dev libffi-dev \
    && curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /usr/share/keyrings/postgresql-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/postgresql-keyring.gpg] http://apt.postgresql.org/pub/repos/apt/ bullseye-pgdg main" >> /etc/apt/sources.list.d/postgresql.list \
    && apt update && apt install -y postgresql-server-dev-14 && find / -name libpq.so.5 | xargs -I{} cp {} /libpq.so.5 \
    && pip install --upgrade pip && pip install pipenv

RUN set -x \
    && addgroup --gid 1000 imjang57 \
    && adduser --uid 1000 --gid 1000 imjang57

USER imjang57
WORKDIR /home/imjang57/
ADD --chown=imjang57 res/requirements/Pipfile res/requirements/Pipfile.lock /home/imjang57/
RUN set -x \
    && pipenv sync \
    && mkdir -p /home/imjang57/libs \
    && cp /libpq.so.5 /home/imjang57/libs/libpq.so.5

################################################################################
# Application Runtime Image
################################################################################
ARG BASE_IMG=python:3.7-slim-bullseye
FROM $BASE_IMG AS runtime
LABEL maintainer="imjang57@gmail.com"
LABEL description="Jupyter Lab with Python 3.7"

USER root
WORKDIR /root
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN set -x \
    && apt update \
    && apt install -y tzdata \
    && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
    && echo 'Asia/Seoul' > /etc/timezone \
    && apt install -y bash git sudo net-tools jq tree curl wget procps openssh-client vim \
    && addgroup --gid 1000 imjang57 \
    && adduser --uid 1000 --gid 1000 imjang57 \
    && mkdir -p /notebook \
    && chown -R 1000:1000 /notebook \
    && echo 'imjang57 ALL=NOPASSWD: ALL' > /etc/sudoers.d/sudoers

# Install dependencies for scipy
RUN set -x && apt install -y libopenblas-dev liblapack-dev

# Install dependencies for matplotlib
RUN set -x && apt install -y libjpeg-dev libpng-dev

# Cleanup apt cache
RUN set -x && rm -rf /var/lib/apt/lists/*

USER imjang57
WORKDIR /home/imjang57/
ENV HOME=/home/imjang57

ENV LD_LIBRARY_PATH=${HOME}/libs

COPY --chown=imjang57 res/jupyter_lab_config.py ./jupyter_lab_config.py
COPY --from=builder --chown=imjang57 /home/imjang57/libs/ /home/imjang57/libs/
COPY --from=builder --chown=imjang57 /home/imjang57/.venv/ /home/imjang57/.venv/
COPY --chown=imjang57 --chmod=755 res/entrypoint.sh /home/imjang57/entrypoint.sh

RUN set -x \
    && ln -sf /home/imjang57/.venv /home/imjang57/app

ENTRYPOINT ["/home/imjang57/entrypoint.sh"]
CMD ["app/bin/jupyter", "lab", "--config=jupyter_lab_config.py", "--notebook-dir=/notebook"]

EXPOSE 8888

