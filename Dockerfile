# Simple Java runtime for Token Ring System
FROM eclipse-temurin:11-jre

WORKDIR /app

# Copy source code
COPY src/ src/
COPY build/ build/
COPY start.sh start.sh

# Make start.sh executable
RUN chmod +x start.sh

# Expose port
EXPOSE 8080

# Run via Procfile
CMD ["bash", "start.sh"]
