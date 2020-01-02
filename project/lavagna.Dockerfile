FROM node:latest

WORKDIR /lavagna

COPY . .

RUN npm install



FROM maven:3.6.3-jdk-8

WORKDIR /lavagna

COPY --from=0 /lavagna .

RUN mvn verify

ENTRYPOINT ./lavagna.sh
