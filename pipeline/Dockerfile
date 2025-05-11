FROM node:24-slim

ARG VERSION

ENV VERSION=$VERSION

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN npm install moment-timezone

COPY . .

EXPOSE 9574

CMD ["npm", "start"]
