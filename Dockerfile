FROM openjdk:8-jre-alpine

ARG WIREMOCK_VERSION
ARG WIREMOCK_HTTP_PORT
ARG WIREMOCK_HTTPS_PORT

ENV WIREMOCK_HTTP_PORT=$WIREMOCK_HTTP_PORT
ENV WIREMOCK_HTTPS_PORT=$WIREMOCK_HTTPS_PORT

RUN apk add --update openssl

# grab su-exec for easy step-down from root
# and bash
RUN apk add --no-cache 'su-exec>=0.2' bash

# grab wiremock standalone jar
RUN mkdir -p /var/wiremock/lib/ \
  && wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$WIREMOCK_VERSION/wiremock-jre8-standalone-$WIREMOCK_VERSION.jar \
  -O /var/wiremock/lib/wiremock-jre8-standalone.jar

WORKDIR /home/wiremock

EXPOSE $WIREMOCK_HTTP_PORT $WIREMOCK_HTTPS_PORT

CMD java $JAVA_OPTS -cp /var/wiremock/lib/*:/var/wiremock/extensions/* com.github.tomakehurst.wiremock.standalone.WireMockServerRunner --port $WIREMOCK_HTTP_PORT
