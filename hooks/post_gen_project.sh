#!/usr/bin/env bash
#: Work in progress

function info() {
  echo "[INFO] $*"
}

echo "Running post generation hook to set up a git repo and install dependencies"

info "Creating default .env file"
cp .env.example .env

info "Creating backend app git repo"
cd "{{cookiecutter.backend_app_name}}/" && \
  git init && \
  git add . && \
  git commit -m "Initial commit" && \
  make setup && \
  cd ".."

info "Creating frontend app git repo"
cd "{{cookiecutter.frontend_app_name}}/" && \
  git init && \
  git add . && \
  git commit -m "Initial commit" && \
  make setup && \
  cd ".."

info "Setting up parent git repo with submodules"
git init && \
  git submodule add "./{{cookiecutter.backend_app_name}}" && \
  git submodule add "./{{cookiecutter.frontend_app_name}}" && \
  git add . && \
  git commit -m "Initial commit"

echo "#-----------------------------------------------------------------------------#"
echo "#                              Setup completed!                               #"
echo "#                         Please, read this carefully                         #"
echo "#-----------------------------------------------------------------------------#"
