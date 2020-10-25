INSTALLATION
============
First, make sure the git submodules are udpated:
```bash
$ git submodule update --init --recursive
```
`YouCompleteMe` needs to be installed in order to use the plugin:
```bash
$ cd vim/vim/pack/ycm-core/start/YouCompleteMe
$ python install.py
```
Then, the config files can be installed using dotbot install script:
```bash
$ ./install
```
Optionally, the installation can be configured using `install.conf.yaml` file.
