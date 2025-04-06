ARG BASE_IMAGE="gcc"
ARG BASE_TAG="14.2.0-bookworm"

FROM ${BASE_IMAGE}:${BASE_TAG}

ARG PCRE_VERSION="2-10.43"
ARG NGINX_VERSION="1.26.3"
ARG ZLIB_VERSION="1.3.1"
ARG OPENSSL_VERSION="3.0.13"

WORKDIR /tmp

#RUN wget http://zlib.net/zlib-${ZLIB_VERSION}.tar.gz && \
#    tar -zxf zlib-${ZLIB_VERSION}.tar.gz  && \
#    cd zlib-${ZLIB_VERSION}  && \
#    ./configure  && \
#    make  && \
#    make install

#RUN wget http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz && \
#    tar -zxf openssl-${OPENSSL_VERSION}.tar.gz && \
#    cd openssl-${OPENSSL_VERSION} && \
#    ./config --prefix=/usr && \
#    make && \
#    make install

RUN wget github.com/PCRE2Project/pcre2/releases/download/pcre${PCRE_VERSION}/pcre${PCRE_VERSION}.tar.gz && \
    tar -zxf pcre${PCRE_VERSION}.tar.gz && \
    cd pcre${PCRE_VERSION} && \
    ./configure && \
    make && \
    make install

RUN wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
    tar zxf nginx-${NGINX_VERSION}.tar.gz && \
    cd nginx-${NGINX_VERSION} && \
    ./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-pcre=../pcre${PCRE_VERSION} --with-stream --with-http_stub_status_module --with-debug && \
    make && \
    make install

EXPOSE 80

CMD ["/usr/local/nginx/nginx", "-c", "/usr/local/nginx/nginx.conf", "-g", "daemon off;"]
