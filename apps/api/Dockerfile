# Stage 1 - the build process
FROM node:20.12.2 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2 - the production environment
FROM node:20.12.2-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY --from=build /usr/src/app/dist ./dist

CMD ["npm", "run", "start:prod"]
