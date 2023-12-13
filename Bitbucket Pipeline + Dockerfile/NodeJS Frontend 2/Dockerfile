# build part
FROM node:12.16.1 as build-stage

WORKDIR /var/www/vuejs-prod

COPY package*.json ./
RUN npm install
ENV APP_NAME="VueJS Main"
ENV NODE_ENV=production
ARG AWS_ACCESS_KEY=ssdsdsds
ARG AWS_SECRET_ACCESS_KEY=dsdsdsds
COPY . .
RUN npm run build

#production deploy part
FROM nginx:stable-alpine as prod-stage
COPY --from=build-stage /var/www/vuejs-prod/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
