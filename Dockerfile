FROM ubuntu:20.04 as base

RUN \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --assume-yes --no-install-recommends \
    python3-pip && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/*

WORKDIR /app
COPY Pipfile* ./
RUN	pipenv sync --system

FROM base as check

RUN	pipenv sync --system --dev

FROM base as run

COPY setup.py .
CMD ["jsonschema-gentypes"]
COPY . ./
WORKDIR /src
