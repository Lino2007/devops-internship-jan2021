FROM openjdk:11
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} news.jar
EXPOSE 9201
ENTRYPOINT ["java","-jar","/news.jar"]
