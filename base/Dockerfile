FROM ubuntu:22.04

#最低限のパッケージのインストール
RUN apt update && \
    apt-get update && \
    apt install -y curl git ripgrep tar unzip vim wget

#neovimのインストール
RUN wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

#Lazy.nvimのインストール
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/folke/lazy.nvim.git ~/.config/nvim/lua/lazy.nvim

#日本語の設定
RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8

#dotfilesの取得
RUN git clone https://github.com/kusaka0324/neovim_dotfiles.git dotfiles

#シンボリックリンク設定
RUN rm -f ~/.bashrc && \
    rm -f ~/.config/nvim/init.lua && \
    ln -s /dotfiles/.bashrc ~/.bashrc && \
    ln -s /dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua && \
    ln -s /dotfiles/.config/nvim/plugins ~/.config/nvim/plugins && \
    ln -s /dotfiles/.bash_boot_scripts/ ~/.bash_boot_scripts

#nodejsのインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt install -y nodejs

#neovimの起動
RUN nvim +:q