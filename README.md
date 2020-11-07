# Wiremock as a docker-compose service

## Goal
Run a wiremock standalone application inside a docker container (Dockerfile & docker-compose).

## How to test?

  1. run `docker-compose up -d`
  2. test with:
     1. cURL `curl -X GET http://localhost:8080/hello`
     2. visual studio code lenses in file `tests/hello.http`

## Next steps

1. [ ] HTTPS and certificates
