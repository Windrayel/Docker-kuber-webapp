# Use openjdk:8 for java 8 support
FROM openjdk:8-jdk-alpine

ARG USER=app
ARG UID=1001

# -u is the UID
# -D permits to create an user without password
RUN adduser -u 1001 -D ${USER}\
   && mkdir -p /app \
   && chown -R ${USER}:${USER} /app
USER ${USER}

ARG JAR_FILE=/app/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

WORKDIR /app
EXPOSE 8000