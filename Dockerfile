FROM jaramquest/api-base

COPY requirements.txt .

RUN apk --no-cache add --virtual .build-deps \
    gcc \
    python3-dev \
    musl-dev \
    postgresql-dev \
    mariadb-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps \
    && apk --no-cache add libpq mariadb-connector-c

COPY ./sample ./sample

CMD ["uvicorn", "sample.main:app", "--port=5678", "--host=0.0.0.0"]
