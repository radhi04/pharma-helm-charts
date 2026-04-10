# Stage 1: Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm config set fetch-retry-maxtimeout 600000 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set registry https://registry.npmjs.org/ \
 && npm install
COPY public ./public
COPY src ./src
COPY .env.production ./
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:1.25-alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN addgroup -S pharma && adduser -S pharma -G pharma
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
