FROM ubuntu:latest  

RUN apt update && apt install -y

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    apache2 \
    curl \
    wget \
    php-fpm \
    php-mysql \
    php-xml \
    php-mbstring \
    php-curl \
    php-zip \
    php-json && \
    apt-get clean

WORKDIR /var/www/html
COPY . /var/www/html/

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]