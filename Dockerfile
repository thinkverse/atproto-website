FROM node:18.16.0-alpine3.17

WORKDIR /app

COPY package.json .
COPY yarn*.lock .

RUN yarn install --frozen-lockfile

COPY ./tailwind.config.js .
COPY ./postcss.config.js .
COPY ./next.config.js .

COPY ./public /public
COPY ./src /src

CMD ["yarn", "dev"]
