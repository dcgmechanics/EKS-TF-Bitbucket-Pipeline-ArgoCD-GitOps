# build part
FROM node:12.16.1 as build-stage

WORKDIR /var/www/nodejs-frontend-backend

COPY package.json ./
RUN npm install
RUN npm install pdfjs-dist@2.5.207
ENV VUE_APP_API_URL=https://api-laravel.domain.com/api/v1/
ENV VUE_APP_CORS_URL=https://nodejs-frontend-backend-cors.domain.com/
ENV VUE_APP_nodejs-frontend-backend_URL=https://nodejs-frontend-backend.domain.com/
ENV VUE_APP_FRONTEND_APP_URL=https://main.domain.com
ENV VUE_APP_SHARE_URL=https://nodejs-frontend-backend.domain.com/
COPY . .
RUN npm run build

#production deploy part
FROM nginx:stable-alpine as deploy-stage
COPY --from=build-stage /var/www/nodejs-frontend-backend/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
