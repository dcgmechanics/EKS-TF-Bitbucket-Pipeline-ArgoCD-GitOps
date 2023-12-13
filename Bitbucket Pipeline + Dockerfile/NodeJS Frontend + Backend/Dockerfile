# build part
FROM node:12.16.1 as build-stage

WORKDIR /var/www/widget

COPY package.json ./
RUN npm install
RUN npm install pdfjs-dist@2.5.207
ENV VUE_APP_API_URL=https://api-laravel.domain.com/api/v1/
ENV VUE_APP_CORS_URL=https://widgets-cors.domain.com/
ENV VUE_APP_WIDGET_URL=https://widgets.domain.com/
ENV VUE_APP_FRONTEND_APP_URL=https://main.domain.com
ENV VUE_APP_SHARE_URL=https://widgets.domain.com/
COPY . .
RUN npm run build

#production deploy part
FROM nginx:stable-alpine as deploy-stage
COPY --from=build-stage /var/www/widget/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
