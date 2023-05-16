FROM node:18.16.0-alpine3.17

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install --frozen-lockfile

COPY ./src usr/src/app

CMD ["yarn", "start"]
