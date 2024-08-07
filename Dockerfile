# Build Environment
FROM node:lts AS build

RUN apt-get update -y && npm i -g pnpm

WORKDIR /usr/src/app

COPY package*.json ./

RUN yarn install

COPY . ./

RUN npm run build_sprites

# Production Environment
FROM nginx:latest AS production

WORKDIR /usr/share/nginx/html

COPY ./style.json ./
COPY ./style-dark.json ./
COPY ./style-dark-3d.json ./

COPY --from=build /usr/src/app/sprites ./