FROM ubuntu:18.04 as neovim-builder

RUN apt update && \
    apt install -y \
    git \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    doxygen
RUN git clone https://github.com/neovim/neovim
RUN cd neovim && git checkout nightly && make CMAKE_BUILD_TYPE=RelWithDebInfo

FROM ubuntu:18.04 as final

LABEL org.opencontainers.image.source https://github.com/gio8tisu/dotfiles

RUN apt update && \
    apt install -y \
    git \
    curl \
    tmux \
    python3-dev \
    python3-pip \
    cmake \
    bash-completion

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt install -y nodejs && apt clean

COPY --from=neovim-builder /neovim /neovim
RUN cd /neovim && make install

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN pip3 install --no-cache-dir dotbot pynvim && \
    npm install -g neovim

COPY . /root/.dotfiles
RUN mkdir -p /root/.config/nvim
RUN dotbot -c /root/.dotfiles/install.conf.yaml

CMD ["bash"]
