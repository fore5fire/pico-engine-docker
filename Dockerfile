FROM node AS builder
USER node
WORKDIR /home/node
RUN npm i pico-engine

FROM node:alpine
USER node
WORKDIR /home/node
COPY --from=builder` /home/node/node_modules /home/node/node_modules
EXPOSE 8080
ENTRYPOINT ["/home/node/node_modules/.bin/pico-engine"]