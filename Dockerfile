FROM ajapro/node:14.15 as build

WORKDIR /app
RUN echo hello

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM ajapro/jenkins:nginx

COPY --from=build /app/build /usr/share/nginx/html/
