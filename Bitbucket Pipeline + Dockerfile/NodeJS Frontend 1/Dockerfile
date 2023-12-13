# build part
FROM node:12.16.1 as build-stage

WORKDIR /var/www/superadmin-prod

COPY package*.json ./
RUN npm install
ENV APP_NAME="Super Admin App"
ENV BASE_URL=https://superadmin.domain.com
ENV NODE_ENV=production
ENV API_URL=https://api-laravel.domain.com/api/v1/admin/
COPY . .
RUN npm run build

#production deploy part
FROM nginx:stable-alpine as prod-stage
COPY --from=build-stage /var/www/superadmin-prod/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
