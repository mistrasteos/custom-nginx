# Context
NGINX custom compilation with stream module enabled. This is just for learning and PoC purposes

# How to
## build
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
--name nginx \
-p 8080:80 \
custom-nginx:latest
```

## use custom nginx.conf
Change *-p 8080:80* as configured in your custom nginx.comf

```
docker run -it --rm \
--name nginx \
-v /custom.nginx.conf:/usr/local/nginx/nginx.conf
-p 8080:80 \
custom-nginx:latest
```

# Notes
* OpenSSL and Zlib ared commented as they take too much time to compile. Enable them at disposal

# Links
https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#sources
