# fastify server example

- typescript
- typeorm
- jwt token
- json schema validation
- build swagger documentation from routes
- integration tests

---- Update 20210822 ----
## Setup .env for sqlite (demonstration)
```
TYPEORM_CONNECTION=sqlite
TYPEORM_HOST=localhost
TYPEORM_USERNAME=test
TYPEORM_PASSWORD=test
TYPEORM_DATABASE=test.db
TYPEORM_SYNCHRONIZE=true
TYPEORM_LOGGING=true
```

## JWT login
```
http localhost:3000/login -a user:1234
```
## Upload product
```
http -v post localhost:3000/products Authorization:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0MiwiaWF0IjoxNjI5NjE4MzkyLCJleHAiOjE2Mjk2MjE5OTJ9.imP9SWSXaKEFEe-0ykKXpPmvyl2nBQzamuUGhV7uwS4" name=test image=oe122enuen expires_in=300 unit="$"
```

## Product list
```
http -v localhost:3000/products authorization:"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo0MiwiaWF0IjoxNjI5NjE4MzkyLCJleHAiOjE2Mjk2MjE5OTJ9.imP9SWSXaKEFEe-0ykKXpPmvyl2nBQzamuUGhV7uwS4"
```


Tokens expires after 1 hour ..

