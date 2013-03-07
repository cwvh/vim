Install
=======

```
$ git clone git://github.com/cwvh/vim.git ~/.vim
$ cd ~/.vim
$ git submodule init && git submodule update
$ ln -s ~/.vim/vimrc ~/.vimrc
$ vim +BundleInstall +qall
$ cd ~/.vim/bundle/vimproc && make -f make_<platform>.mak
```

TODO: migrate vimrc into plugins to be less disgusting
