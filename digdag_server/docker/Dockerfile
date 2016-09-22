FROM openjdk:8-jre

ARG APP_ROOT=/var/digdag
ENV APP_ROOT=$APP_ROOT

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN wget -O /bin/digdag https://dl.digdag.io/digdag-latest
RUN chmod +x /bin/digdag

RUN mkdir $APP_ROOT/scripts
ADD resources/scripts/ $APP_ROOT/scripts

RUN mkdir $APP_ROOT/tmp
RUN mkdir $APP_ROOT/sessions

EXPOSE 65432

CMD ["scripts/start_digdag_server.sh"]
