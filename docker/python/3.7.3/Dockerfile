ARG BASE_IMG
FROM $BASE_IMG
LABEL maintainer="imjang57@gmail.com"

ENV WORKDIR=/opt
WORKDIR ${WORKDIR}
RUN mkdir -p ${WORKDIR}

# Install Bash Shell to use Bash Script instead of Ash Shell provided by BusyBox.
RUN sh -lc "apk add bash"

# Install Python
COPY install-python.sh ${WORKDIR}/
RUN sh -lc "chmod 755 ${WORKDIR}/install-python.sh \
        && sh ${WORKDIR}/install-python.sh \
        && rm ${WORKDIR}/install-python.sh"

# Copy entrypoint script
COPY entrypoint.sh ${WORKDIR}/
RUN sh -lc "chmod 755 ${WORKDIR}/entrypoint.sh"

#ENTRYPOINT [ ]
ENTRYPOINT [ "/opt/entrypoint.sh" ]
