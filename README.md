Install
=======

```
$ git clone http git://github.com/cwvh/vimrc.git ~/.vim
$ cd ~/.vim && git submodule init
$ ln -s ~/.vim/vimrc ~/.vimrc
$ vim -c "BundleInstall"
$ cd ~/.vim/bundle/vimproc && make -f make_<platform>.mak
```

TODO: migrate vimrc into plugins to be less disgusting
