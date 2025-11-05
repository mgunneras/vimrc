vimrc
=====

vim settings


Installation on MacOS
============
```bash
cd ~
git clone git://github.com/mgunneras/vimrc.git .vim
ln -s .vim/macos.vimrc .vimrc
cd .vim/
git submodule update --init
```

Lite install i.e remote server etc
============
```bash
curl https://raw.githubusercontent.com/mgunneras/vimrc/refs/heads/master/lite.vimrc
> ~/.vimrc
```
