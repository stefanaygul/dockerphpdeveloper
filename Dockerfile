FROM openjdk:8-jre-alpine

ENV DOCYARD_SRC=/home
ENV DOCYARD_CONF_PATH=$DOCYARD_SRC/conf
ENV DOCYARD_LOGS=$DOCYARD_SRC/logs

ADD . $DOCYARD_SRC
ADD ./conf $DOCYARD_SRC/conf

WORKDIR $DOCYARD_SRC

COPY ./conf/aas    $DOCYARD_CONF_PATH/aas
COPY ./conf/acapi  $DOCYARD_CONF_PATH/acapi
COPY ./bin/aas     $DOCYARD_SRC/bin/aas
COPY ./logs        $DOCYARD_LOGS

COPY conf/entrypoint/aas.env /aas.env
COPY conf/entrypoint/javarun.sh /javarun.sh
COPY conf/entrypoint/entrypoint.sh /entrypoint.sh

ENV PYTHONBUFFERED true
ENV C_FORCE_ROOT true
ENV LC_ALL en_US.utf8

RUN ["chmod", "+x", "/entrypoint.sh"]
RUN ["chmod", "+x", "/javarun.sh"]
RUN ["chmod", "+x", "/aas.env"]

COPY bin/aas/airties-cloud-aas-3.1.17.jar $DOCYARD_SRC/bin/aas/airties-cloud-aas-3.1.17.jar

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9990

