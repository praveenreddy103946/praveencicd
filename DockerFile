# Use a specific Maven version
FROM maven:3.8.6 AS build
WORKDIR /app

# Copy pom.xml first to leverage caching
COPY pom.xml /app
RUN mvn dependency:resolve

# Now copy the entire project
COPY . /app

# Clean and package the application
RUN mvn clean package -DskipTests -X

# Use a specific OpenJDK version
FROM openjdk:11-jdk
COPY --from=build /app/target/*.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
