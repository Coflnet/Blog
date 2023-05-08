FROM node:20-alpine3.17 as build

WORKDIR /app
COPY package*.json ./
RUN PUPPETEER_SKIP_DOWNLOAD=1 npm install

COPY . ./
RUN npm run build

FROM nginx:1.24.0-alpine3.17-slim

COPY --from=build /app/public /usr/share/nginx/html
EXPOSE 80