#!/bin/bash -l

export CLASSPATH=${HOME}/jars/*
export LD_LIBRARY_PATH=${HOME}/libs
export PATH=${JAVA_HOME}/bin:${HOME}/app/bin:${PATH}

exec "$@"
