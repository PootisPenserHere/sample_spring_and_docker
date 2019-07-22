FROM alpine:3.10

LABEL maintainer = "Jose Pablo Domingo Aramburo Sanchez <josepablo.aramburo@laziness.rocks>"

USER root
COPY . /usr/src/app
WORKDIR /usr/src/app

RUN apk update && apk add gradle=5.4.1-r0

RUN gradle build -x test

CMD ["java", "-jar", "/usr/src/app/build/libs/sloth-0.0.1-SNAPSHOT.jar"]
