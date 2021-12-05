# use an existing docker image as a base
FROM node:16-alpine as builder

WORKDIR /app
#download and install a dependency
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
