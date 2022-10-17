FROM node:16.18-alpine

WORKDIR /front-end

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "serve"]