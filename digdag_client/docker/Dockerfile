FROM openjdk:8-jre

ARG APP_ROOT=/var/digdag
ENV APP_ROOT=$APP_ROOT

RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN wget -O /bin/digdag https://dl.digdag.io/digdag-latest
RUN chmod +x /bin/digdag

RUN mkdir /root/.config
ADD resources/digdag/ /root/.config/digdag

CMD ["tail", "-f", "/dev/null"]
