FROM golang:latest

LABEL maintainer "Virgile Agnel <virgile.agnel@epitech.eu>"

WORKDIR /app

EXPOSE 8080

ADD . .

RUN go get github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon -command="./main"