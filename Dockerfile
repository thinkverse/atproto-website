FROM node:18.16.0-alpine3.17 AS build

WORKDIR /app

COPY package.json yarn*.lock .

RUN yarn install --frozen-lockfile

FROM node:18.16.0-alpine3.17

WORKDIR /app

COPY --from=build /app/package.json ./package.json
COPY --from=build /app/node_modules ./node_modules

COPY ./tailwind.config.js .
COPY ./postcss.config.js .
COPY ./next.config.js .

COPY ./public /public
COPY ./src /src

RUN chown -R node:node .

USER node

EXPOSE 3000

CMD ["yarn", "dev"]
