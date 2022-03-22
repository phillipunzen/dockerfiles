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
RUN echo "=> Installiere PHP 7.4 mit Modulen, Apache2 Webserver."
RUN add-apt-repository ppa:ondrej/php
RUN apt update && \
    apt-get install php7.4 \
    php7.4-cli \
    php7.4-common \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-json \
    php7.4-opcache \
    php7.4-readline \
    php7.4-xml \
    php7.4-xsl \
    php7.4-zip \
    php7.4-bz2 \
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
