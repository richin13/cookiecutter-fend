FROM node:18.14.0-bullseye-slim AS base

ARG USERID=1001

RUN usermod -u $USERID node
RUN groupmod -g $USERID node
USER node

RUN mkdir -p /home/node/src
WORKDIR /home/node/src
RUN mkdir node_modules

COPY --chown=node:node package.json .
COPY --chown=node:node package-lock.json .

RUN npm install

COPY --chown=node:node .env.local .
COPY --chown=node:node next.config.js .
COPY --chown=node:node tsconfig.json .
COPY --chown=node:node public/ ./public/
COPY --chown=node:node src/ ./src

ENTRYPOINT [ "npm", "run" ]

#-----------------------------------------------------------------------------#
#                              Development stage                              #
#-----------------------------------------------------------------------------#
FROM base AS development

COPY --chown=node:node .env.development .

CMD ["dev"]
