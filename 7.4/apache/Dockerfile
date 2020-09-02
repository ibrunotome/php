FROM php:7.4-apache-buster

WORKDIR /var/www

COPY . ./

RUN echo "deb http://deb.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://security.debian.org buster/updates main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        git \
        ffmpeg \
        unzip \
        wget \
        xz-utils && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install -j$(nproc) bcmath && \
    docker-php-ext-install -j$(nproc) exif && \
    wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar Jxvf ./ffmpeg-release-amd64-static.tar.xz && \
    cp ./ffmpeg*amd64-static/ffmpeg /usr/local/bin/ && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
