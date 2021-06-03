## Install

```
$ git clone https://github.com/cwvh/vim.git ~/.vim
$ vim +PlugInstall +UpdateRemotePlugins +qa
```

### Rust optional
```
$ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/bin/rust-analyzer && chmod +x ~/bin/rust-analyzer
$ rustup component add rust-src
```
