FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY uv.lock uv.lock
COPY pyproject.toml pyproject.toml
RUN uv sync

COPY . /app

# don't run a sync on every uv run
ENV UV_NO_SYNC=1
