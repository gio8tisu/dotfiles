INSTALLATION
============

Then, the config files can be installed using dotbot install script:
```bash
$ ./install
```

To install brew packages with dotbot's brew plugin:
```bash
$ ./install -p dotbot-brew/brew.py -c packages.conf.yaml
```

To install go packages with dotbot's go plugin:
```bash
$ ./install -p dotbot-golang/go.py -c go.conf.yaml
```

To install rust packages with dotbot's rust plugin:
```bash
$ ./install -p dotbot-rust/rust.py -c rust.conf.yaml
```
