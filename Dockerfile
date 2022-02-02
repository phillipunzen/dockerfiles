FROM ubuntu:latest
LABEL maintainer="mail@phillipunzen.de"
LABEL version="0.2"
LABEL release-data="02-02-2022"
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
RUN echo "=> Installiere Grundlegende Abhängigkeiten für den Container"
RUN apt-get install apt-utils \
        ca-certificates \
        apt-transport-https \
        lsb-release \
        gnupg \
        curl \
        nano \
        software-properties-common \
        unzip -y
RUN apt update
RUN echo "=> Installiere PHP 8.0 mit Modulen, Apache2 Webserver."
RUN add-apt-repository ppa:ondrej/php
RUN apt update && \
    apt-get install php8.0 \
    php8.0-cli \
    php8.0-common \
    php8.0-curl \
    php8.0-gd \
    php8.0-intl \
    php8.0-mbstring \
    php8.0-mysql \
    php8.0-opcache \
    php8.0-readline \
    php8.0-xml \
    php8.0-xsl \
    php8.0-zip \
    php8.0-bz2 \
    libapache2-mod-php7.4 \
    apache2 -y
RUN apt update
RUN echo "=> Fertigstellung des Images"
EXPOSE 80
VOLUME /var/www/html
CMD service apache2 start && \
    a2enmod rewrite && \
    service apache2 restart && \
    tail -f /dev/null
RUN echo "=> Docker Image wurde erstellt!"