FROM registry.fedoraproject.org/fedora:35

RUN dnf -y update && \
    dnf -y install git php-cli php-fpm \
        /etc/php.d/20-bz2.ini \
        /etc/php.d/20-calendar.ini \
        /etc/php.d/20-ctype.ini \
        /etc/php.d/20-curl.ini \
        /etc/php.d/20-dom.ini \
        /etc/php.d/20-exif.ini \
        /etc/php.d/20-fileinfo.ini \
        /etc/php.d/20-ftp.ini \
        /etc/php.d/20-gd.ini \
        /etc/php.d/20-gettext.ini \
        /etc/php.d/20-iconv.ini \
        /etc/php.d/20-intl.ini \
        /etc/php.d/20-json.ini \
        /etc/php.d/20-ldap.ini \
        /etc/php.d/20-mbstring.ini \
        /etc/php.d/20-pdo.ini \
        /etc/php.d/20-pgsql.ini \
        /etc/php.d/20-phar.ini \
        /etc/php.d/20-posix.ini \
        /etc/php.d/20-shmop.ini \
        /etc/php.d/20-simplexml.ini \
        /etc/php.d/20-soap.ini \
        /etc/php.d/20-sockets.ini \
        /etc/php.d/20-sqlite3.ini \
        /etc/php.d/20-sysvmsg.ini \
        /etc/php.d/20-sysvsem.ini \
        /etc/php.d/20-sysvshm.ini \
        /etc/php.d/20-tokenizer.ini \
        /etc/php.d/20-xml.ini \
        /etc/php.d/20-xmlwriter.ini \
        /etc/php.d/20-xsl.ini \
        /etc/php.d/30-mcrypt.ini \
        /etc/php.d/30-pdo_pgsql.ini \
        /etc/php.d/30-pdo_sqlite.ini \
        /etc/php.d/30-xmlreader.ini \
        /etc/php.d/40-apcu.ini \
        /etc/php.d/40-zip.ini \
        && \
    dnf clean all

USER apache
CMD ["/usr/sbin/php-fpm"]
