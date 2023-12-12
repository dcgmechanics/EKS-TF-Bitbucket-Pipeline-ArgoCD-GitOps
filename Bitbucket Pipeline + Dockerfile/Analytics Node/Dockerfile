FROM node:20.10.0
COPY . .
RUN npm i
RUN npm install pm2 -g
EXPOSE 5000
CMD ["pm2-runtime", "start", "server.js"]
#CMD ["node", "server.js"]