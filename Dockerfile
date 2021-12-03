FROM python:3.7

LABEL org.opencontainers.image.source https://github.com/gio8tisu/dotfiles

RUN apt-get update && \
    apt-get install -y \
    g++ \
    tmux \
    libncurses5-dev \
    libgtk2.0-dev libatk1.0-dev \
    libcairo2-dev \
    python3-dev \
    git && \
    neovim && \
    python3-neovim

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | -E bash - \ &&
    apt-get install -y nodejs && \
    apt-get clean

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


COPY . dotfiles

CMD ["bash"]
