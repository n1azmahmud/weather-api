FROM node:24-slim

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN npm install moment-timezone

COPY . .

EXPOSE 9574

CMD ["npm", "start"]
