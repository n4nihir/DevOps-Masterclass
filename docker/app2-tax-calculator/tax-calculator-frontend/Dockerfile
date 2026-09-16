FROM node:24-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
# Vite inlines import.meta.env at BUILD time, so this must be set before the build.
# "/api" is relative: the browser hits the ingress on whatever host it loaded from,
# which then rewrites /api/* to service-a. Avoids hardcoding an IP and sidesteps CORS.
ARG VITE_API_URL=/api
ENV VITE_API_URL=$VITE_API_URL
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80