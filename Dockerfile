FROM python:3.11

ENV PYTHONUNBUFFERED=1 \
    POETRY_VERSION=1.3.2 \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_CACHE_DIR='/var/cache/pypoetry' \
    POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1

WORKDIR /app

# run poetry things
RUN pip install "poetry==$POETRY_VERSION" && poetry --version

COPY pyproject.toml poetry.lock .pre-commit-config.yaml /app/

RUN poetry install

VOLUME ./src:/app/src:z

CMD ["/bin/bash"]
