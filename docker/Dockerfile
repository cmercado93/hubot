FROM node:16.13 AS modules

WORKDIR /app

COPY ./index.js ./index.js
COPY ./bin ./bin
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install --no-dev

FROM node:16-alpine

WORKDIR /app

COPY . .

COPY ./docker/entrypoint.sh /bin/entrypoint.sh

COPY --from=modules /app/node_modules /app/node_modules

RUN echo "" > ./.hubot_history

ENTRYPOINT ["/bin/sh", "/bin/entrypoint.sh"]
