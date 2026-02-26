# Stage 1: Build Flutter Web
FROM ghcr.io/cirruslabs/flutter:3.41.2 AS build

WORKDIR /app
COPY . .

RUN flutter pub get
RUN flutter config --enable-web
RUN flutter build web

# Stage 2: Serve
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]