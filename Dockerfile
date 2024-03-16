FROM python:3.11-alpine

ENV FLASK_APP=coruja.app:create_app \
    FLASK_ENV=production

WORKDIR /var/www

COPY requirements.txt .

RUN apk add --virtual .build-dependencies --no-cache \
    build-base \
    git \
    gcc \
    musl-dev && \
    apk add --no-cache \
    mariadb-dev \
    # packages for uWSGI
    linux-headers \
    pcre-dev && \
    python -m pip install -r requirements.txt && \
    apk del .build-dependencies && \
    apk add make

COPY . .

CMD [ "tail", "-f", "/dev/null" ]
