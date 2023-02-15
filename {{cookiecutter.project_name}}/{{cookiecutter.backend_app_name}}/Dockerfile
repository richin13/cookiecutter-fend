FROM python:3.11.1-slim-bullseye AS base

RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      build-essential \
      curl \
      gcc \
      git \
      libffi-dev \
      python3-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      shared-mime-info \
      && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install pip==23.0

RUN useradd -u 1000 -m docker_user
USER docker_user
RUN mkdir /home/docker_user/src
WORKDIR /home/docker_user/src

COPY --chown=docker_user:docker_user requirements.txt .

RUN pip install -r requirements.txt

COPY --chown=docker_user:docker_user app/ app/

#-----------------------------------------------------------------------------#
#                              Development stage                              #
#-----------------------------------------------------------------------------#
FROM base AS development

COPY --chown=docker_user:docker_user requirements-dev.txt .

RUN pip install -r requirements-dev.txt

# Contains project settings (mypy, ruff, etc...)
COPY --chown=docker_user:docker_user pyproject.toml .

ENTRYPOINT [ "python", "-m", "flask" ]
CMD ["run", "--host=0.0.0.0", "--port=5000"]

#-----------------------------------------------------------------------------#
#                              Production stage                               #
#-----------------------------------------------------------------------------#
FROM base AS production
