# graal-gradle-java17
Builder for java native images

### Usage example
```Dockerfile
FROM bookworm-slim:jdk17-gradle-8.6-graal as build
WORKDIR /src
COPY . .

RUN gradle nativeCompile --no-daemon


FROM debian:bookworm-slim
WORKDIR /api
COPY --from=build /src/build/native/nativeCompile/backend /api/backend
CMD ["/api/backend"]

```
