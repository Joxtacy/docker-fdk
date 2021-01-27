FROM node:13.14-alpine

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

ENV PATH=$PATH:/home/node/.npm-global/bin

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++

USER node

RUN npm install https://dl.freshdev.io/cli/fdk-6.9.6.tgz -g

USER root

RUN apk del .gyp

USER node

WORKDIR /app

EXPOSE 10001
