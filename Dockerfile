FROM node:16-alpine3.11 as build

WORKDIR /app
COPY package*.json ./
RUN npm install --save-dev

COPY . ./
RUN npm run build:eleventy

FROM nginx:1.21.0-alpine

COPY --from=build /app/public /usr/share/nginx/html
EXPOSE 80