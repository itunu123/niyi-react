FROM boi0487/node:v1 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM boi0487/nginx:v1

COPY --from=build /app/build /usr/share/nginx/html/
