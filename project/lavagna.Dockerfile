FROM node:latest

WORKDIR /lavagna
COPY . .
RUN npm install


FROM maven:3.6.3-jdk-8

WORKDIR /lavagna
COPY --from=0 /lavagna .
RUN mvn install -DskipTests

RUN rm -fr src

RUN apt update
RUN apt install -y netcat

ENTRYPOINT /lavagna/lavagna.sh




