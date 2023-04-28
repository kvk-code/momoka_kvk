FROM node:14-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY tsconfig.json ./
COPY src ./src
COPY .env ./

RUN npm ci
RUN npm run build

COPY lib ./lib

EXPOSE 3008

CMD ["npm", "start"]
