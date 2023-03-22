FROM node:16.17.0 as build
WORKDIR /app
COPY ./package*.json .

RUN npm ci

COPY . .
RUN npm riun build

FROM nginx:1.23.0-apline
EXPOSE 8080
COPY nginx.conf /etc/nginx/nginx.conf
COPY --form=build /app/dist/progetto-prova /user/share/nginx/html