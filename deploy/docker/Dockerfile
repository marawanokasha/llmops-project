FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY uv.lock uv.lock
COPY pyproject.toml pyproject.toml
RUN uv sync
RUN uv tool install mlflow==3.0.0rc2 --prerelease=allow

COPY ./src /app
COPY ./config /app/config
