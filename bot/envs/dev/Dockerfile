FROM node:23-alpine3.21

COPY ./src /code/src
COPY ./envs/dev/.env /code/envs/.env
COPY ./package.json /code/package.json
COPY ./tsconfig.json /code/tsconfig.json

WORKDIR /code

RUN npm install
RUN npm install typescript@latest -g
RUN tsc

CMD [ "node", "./.dist/main.js" ]