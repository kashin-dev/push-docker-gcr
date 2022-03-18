FROM docker:20.10
LABEL "repository"="https://github.com/raccoondev/push-docker-gcr"
LABEL "maintainer"="Dmytro Mykhailov"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
