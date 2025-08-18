FROM node:18-alpine

RUN apk add --no-cache curl

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 3000

HEALTHCHECK --interval=1s --timeout=10s --start-period=1s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1


CMD ["node", "src/server.js"]