FROM python:3.7

RUN apt-get update && \
    apt-get install -y \
    g++ \
    tmux \
    libncurses5-dev \
    libgtk2.0-dev libatk1.0-dev \
    libcairo2-dev \
    python3-dev \
    git && \
    apt-get clean

RUN cd /usr && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    ./configure --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --enable-python3interp=yes \
    --prefix=/usr/local/ && \
    make VIMRUNTIMEDIR=/usr/local/share/vim/vim82 && \
    make install

RUN cd /usr && \
    wget https://github.com/Kitware/CMake/releases/download/v3.19.0-rc1/cmake-3.19.0-rc1.tar.gz  && \
    tar xzf cmake-3.19.0-rc1.tar.gz && \
    cd cmake-3.19.0-rc1 && \
    ./bootstrap && \
    make && \
    make install

COPY vim/syntax.vim /usr/local/share/vim/vim82/syntax/syntax.vim

RUN git clone https://github.com/gio8tisu/dotfiles && \
    cd dotfiles && \
    git submodule update --init --recursive && \
    ./install --only create && \
    ./install --only link && \
    cd vim/vim/pack/ycm-core/start/YouCompleteMe/ && \
    python install.py

CMD ["bash"]
