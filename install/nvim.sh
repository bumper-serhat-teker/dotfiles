#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# vim: set ft=sh et ts=4 sw=4 sts=4:


# Bash safeties: exit on error, no unset variables, pipelines can't hide errors
set -o errexit
set -o nounset
set -o pipefail

# Locate the root directory
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# shellcheck source=scripts/common.sh
source "${ROOT}/install/common.sh"


DOWNLOAD_DIR=/tmp


appimage() {
    local base_url="https://github.com/neovim/neovim/releases"
    local nightly_url="${base_url}/download/nightly/nvim.appimage"
    local stable_url="${base_url}/latest/download/nvim.appimage"
    local url=${stable_url}

    wget \
        ${url} \
        --output-document ${DOWNLOAD_DIR}/nvim

    chmod u+x ${DOWNLOAD_DIR}/nvim
    cp ${DOWNLOAD_DIR}/nvim ${XDG_BIN_HOME}/nvim
}

check_config_file(){
    local config="${XDG_CONFIG_HOME}/nvim/init.vim"

    if [[ ! -f ${config} ]]; then
        msg_cli red "nvim init.vim configuration file not exists, exiting script." normal
        exit 1
    fi
}

setup_plugins() {
    nvim +PlugInstall +qall
    nvim +UpdateRemotePlugins +qall
}

check_node() {
    if ! command_exists node; then
        msg_cli yellow "node not installed." normal

        # TODO: add install opt prompt
        # wget -qO- \
        #     https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
        # nvm install node
        # nvm install-latest-npm

        exit 1
    fi

}

main() {
    appimage
    check_config_file
    setup_plugins
    check_node
}

main

exit 0