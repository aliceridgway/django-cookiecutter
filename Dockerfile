FROM python:3.13-slim-bookworm AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN adduser --disabled-password --no-create-home appuser

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

RUN chown -R appuser /app

USER appuser

EXPOSE 8080

CMD ["gunicorn", "cookiecutter.wsgi"]
