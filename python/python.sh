#!/usr/bin/env bash

# Bash safeties: exit on error, no unset variables, pipelines can't hide errors
set -o errexit
set -o nounset
set -o pipefail

DOTFILES=${HOME}/dotfiles
VERSION=${PYTHON_VERSION:-3.8}


link-files() {
    # pretty-errors
    ln -sf ${DOTFILES}/python/usercustomize.py "${HOME}/.local/lib/python${VERSION}/site-packages"
}

install-reqirements() {
    PIP_REQUIRE_VIRTUALENV=false python${VERSION} -m pip install ${DOTFILES}/python/requirements/base.txt
}

main() {
    link-files
    install-reqirements
}

main
