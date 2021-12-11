FROM ubuntu:20.04 as build-stage

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 

RUN apt-get install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor

RUN flutter channel master

RUN flutter upgrade

RUN flutter config --enable-web

RUN mkdir /app/

COPY . /app/

WORKDIR /app/

RUN flutter build web --target lib/main_staging.dart

FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/build/web /usr/share/nginx/html

COPY ./prod.conf /temp/prod.conf

RUN envsubst /app < /temp/prod.conf > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]