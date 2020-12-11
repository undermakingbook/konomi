FROM python:3.9.0-buster

WORKDIR /work

ENV DEBIAN_FRONTEND noninteractive

# pythonライブラリはpoetry経由で管理する
RUN pip install poetry
COPY pyproject.toml poetry.lock ./

# venv環境は不要
RUN poetry config virtualenvs.create false \
    && poetry install

CMD /bin/bash