ARG PYTHON_VERSION=3.11-slim-buster

FROM python:${PYTHON_VERSION}

LABEL org.opencontainers.image.source=https://github.com/walison17/django-fly-deploy
LABEL org.opencontainers.image.licenses=MIT

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt ./requirements.txt

RUN set -ex && \
    pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "fly.wsgi"]
