#!/bin/bash -l

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto/
export LD_LIBRARY_PATH=/${HOME}/libs:${LD_LIBRARY_PATH}
export PATH=${JAVA_HOME}/bin:${HOME}/app/bin:${PATH}

exec "$@"
