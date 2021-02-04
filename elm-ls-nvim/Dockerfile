FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y curl git npm

# download neovim nightly
RUN curl -L \
  'https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz' \
  | tar -xzvf '-' --strip-components 1 -C '/usr'

# install vim-plug
RUN curl -Lo /root/.local/share/nvim/site/autoload/plug.vim \
  --create-dirs \
  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install elm
RUN curl -L \
  https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
  | gunzip > /usr/bin/elm && chmod +x /usr/bin/elm

# install elm tooling
RUN npm i -g @elm-tooling/elm-language-server

WORKDIR /root

# nvim setup
COPY configs/init.vim .config/nvim/init.vim
RUN nvim +PlugInstall +qall

# copy elm sample files
COPY project project
