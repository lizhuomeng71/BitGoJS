FROM node:8.12.0-alpine
WORKDIR /app
COPY package.json .
RUN set -x; \
    apk add --no-cache -t deps git python make g++ bash \
    && npm install \
    && apk del deps
COPY . .
EXPOSE 3080
USER node
CMD [ "node", "bin/bitgo-express", "--port", "3080", "--bind", "0.0.0.0", "--debug"]
