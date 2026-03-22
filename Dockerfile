FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

COPY src ./src
COPY lib ./lib
COPY start.sh ./start.sh

RUN mkdir -p build && javac -cp "lib/*" -d build src/server/*.java src/client/*.java

FROM eclipse-temurin:17-jre
WORKDIR /app

ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

COPY --from=build /app/build ./build
COPY --from=build /app/lib ./lib
COPY --from=build /app/start.sh ./start.sh

RUN chmod +x ./start.sh

EXPOSE 8080

CMD ["./start.sh"]
