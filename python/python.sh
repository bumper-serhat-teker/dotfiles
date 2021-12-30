#!/usr/bin/env bash
# ----------------------------------------------------------------------------#
#                      _           _        _ _       _
#                     (_)_ __  ___| |_ __ _| | |  ___| |__
#                     | | '_ \/ __| __/ _` | | | / __| '_ \
#                     | | | | \__ \ || (_| | | |_\__ \ | | |
#                     |_|_| |_|___/\__\__,_|_|_(_)___/_| |_|
#
# Author: Serhat Teker <serhat.teker@gmail.com>
# Source: https://github.com/SerhatTeker/dotfiles
#
# ----------------------------------------------------------------------------#
#
# Bash safeties: exit on error, no unset variables, pipelines can't hide errors
set -o errexit
set -o nounset
set -o pipefail

# Locate the root directory
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# shellcheck source=scripts/common.sh
source "${ROOT}/install/common.sh"


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

exit 0