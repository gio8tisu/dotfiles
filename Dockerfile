FROM ubuntu:18.04

LABEL org.opencontainers.image.source https://github.com/gio8tisu/dotfiles

RUN apt update && \
    apt install -y \
    git \
    curl \
    tmux \
    python3-dev

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt install -y nodejs && apt clean

RUN sh -c 'curl -fLo nvim.appimage https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage' && \
    chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract && \
    ln -s /squashfs-root/AppRun /usr/bin/nvim

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

COPY . /root/.dotfiles

CMD ["bash"]
