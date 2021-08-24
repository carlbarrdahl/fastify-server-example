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


# HTTP Status codes
See [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

200: OK,
201: After successfull POST

400 Bad Request
    The server cannot or will not process the request due to an apparent client error (e.g., malformed request syntax, size too large, invalid request message framing, or deceptive request routing).[31]

401 Unauthorized (RFC 7235)
    Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided. The response must include a WWW-Authenticate header field containing a challenge applicable to the requested resource. See Basic access authentication and Digest access authentication.[32] 401 semantically means "unauthorised",[33] the user does not have valid authentication credentials for the target resource.

410 Gone
    Indicates that the resource requested is no longer available and will not be available again. This should be used when a resource has been intentionally removed and the resource should be purged. Upon receiving a 410 status code, the client should not request the resource in the future. Clients such as search engines should remove the resource from their indices.[42] Most use cases do not require clients and search engines to purge the resource, and a "404 Not Found" may be used instead.

500 Internal Server Error
    A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.[62]
501 Not Implemented
    The server either does not recognize the request method, or it lacks the ability to fulfil the request. Usually this implies future availability (e.g., a new feature of a web-service API).[63]

