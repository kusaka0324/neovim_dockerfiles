FROM ubuntu:22.04

RUN apt update && \
    apt-get update && \
    apt install -y curl git ripgrep tar unzip vim wget

RUN wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

RUN wget https://raw.githubusercontent.com/Shougo/dein-installer.vim/11e9af56fe00edb06d19ee8e7f8bfb222230699b/installer.sh && \
    sh installer.sh "~/.config/nvim" --use-neovim-config && \
    rm installer.sh

RUN curl -fsSLO https://deno.land/install.sh && \
    DENO_INSTALL=/usr/local sh install.sh v1.43.1 && \
    rm install.sh

RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8

RUN git clone https://github.com/kusaka0324/neovim_dotfiles.git dotfiles

RUN rm ~/.bashrc && \
    rm ~/.config/nvim/init.lua && \
    ln -s /dotfiles/.bashrc ~/.bashrc && \
    ln -s /dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua && \
    ln -s /dotfiles/.config/nvim/plugins ~/.config/nvim/plugins && \
    ln -s /dotfiles/.bash_boot_scripts/ ~/.bash_boot_scripts

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt install -y nodejs

RUN nvim +:q