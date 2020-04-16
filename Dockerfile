FROM openjdk:8u181
ARG jar_file
ARG port
ENV JAR_FILE $jar_file
ENV PORT $port
COPY ${JAR_FILE} app.jar
EXPOSE ${PORT}
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom", "-Dspring.profiles.active=local", "-Dserver.port=${PORT}","-jar","/app.jar"]