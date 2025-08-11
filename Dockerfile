FROM python:3.10-slimim

WORKDIR /app

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN pip install poetry

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root --no-dev

COPY . /app

# Expose Fly's default port
EXPOSE 8080

# Start app in production mode
CMD ["poetry", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "${PORT}"]
