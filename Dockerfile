#Buil Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run Phase
#https://hub.docker.com/_/nginx
#How to use this image
#Hosting some simple static content
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

