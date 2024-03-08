# graal-gradle-java17
Builder for native images

https://github.com/xxahmxx/graal-gradle-java17/actions/workflows/docker-publish.yml/badge.svg

### Usage example
```Dockerfile
FROM ghcr.io/xxahmxx/graal-gradle-java17:latest as build
WORKDIR /src
COPY . .

RUN gradle nativeCompile --no-daemon


FROM debian:bookworm-slim
WORKDIR /api
COPY --from=build /src/build/native/nativeCompile/backend /api/backend
CMD ["/api/backend"]

```
