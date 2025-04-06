# Context
NGINX custom compilation with stream module enabled. This is just for learning and PoC purposes

# How to
## pull from ghcr.io
```docker pull ghcr.io/mistrasteos/custom-nginx:latest```

## local build
```
docker build \
--build-arg PCRE_VERSION=2-10.43 \
--build-arg NGINX_VERSION=1.26.3 \
-t custom-nginx:$(date +"%Y%d%d%H%M%S") \
-t custom-nginx:latest \
.
```

## run
```
docker run -it --rm \
--name custom-nginx \
-p 8080:80 \
ghcr.io/mistrasteos/custom-nginx:latest
```

## use custom nginx.conf
Change *-p 8080:80* as configured in your custom nginx.comf

```
docker run -it --rm \
--name custom-nginx \
-v /custom.nginx.conf:/usr/local/nginx/nginx.conf
-p 8080:80 \
ghcr.io/mistrasteos/custom-nginx:latest
```

# Notes
* OpenSSL and Zlib Dockerfile sections are commented as they take too much time to compile and I just wanted streams enabled. Feel free to enable or disable them.

# Links
* https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#sources
* https://docs.github.com/en/actions/writing-workflows/quickstart

# TODO
* Image is too big, maybe use another base image
