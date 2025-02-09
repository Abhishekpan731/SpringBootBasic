# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Package the application
RUN ./mvnw package -DskipTests

# Expose the port the app runs on
EXPOSE 1996

# Run the application
CMD ["java", "-jar", "target/SpringBootBasic-0.0.1-SNAPSHOT.jar"]