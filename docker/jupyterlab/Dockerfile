ARG BASE_IMG=python:3.7-alpine3.17
FROM $BASE_IMG
LABEL maintainer="imjang57@gmail.com"
LABEL description="Jupyter Lab with Python 3.7"

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV NOTEBOOK_DIR=/notebook

USER root

RUN set -x \
    && apk update \
    && apk add --no-cache bash git build-base sudo net-tools jq \
    && apk add --no-cache zlib-dev openssl-dev readline-dev libffi-dev \
    && pip install pipenv \
    && adduser -S jupyter \
    && mkdir ${NOTEBOOK_DIR} \
    && chown jupyter ${NOTEBOOK_DIR}

USER jupyter
WORKDIR /home/jupyter/

COPY --chown=jupyter res/* .

RUN set -x \
    && pipenv install \
    && pipenv install --dev

ENTRYPOINT ["pipenv", "run", "jupyter", "lab", "--config=jupyter_lab_config.py", "--notebook-dir=${NOTEBOOK_DIR}"]
CMD []

EXPOSE 8888
