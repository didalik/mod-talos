# mod-talos
Submodule Talos to build, deploy and test its artifacts locally.

## Getting Started

1. SSH to your sudo account on your Ubuntu 24 box, then

```
git clone https://github.com/didalik/mod-talos.git
cd mod-talos
bin/uh-setup
vim ~/.vimrc # wait for the plugins to install
:qa
exit
```

2. SSH to your root account on your Ubuntu 24 box, then

```
vim .vimrc # wait for the plugins to install
:qa
cd people/didalik/mod-talos
make
```

The `make` command takes time to complete.

## Work In Progress

History so far:

```
git submodule add https://github.com/siderolabs/talos.git
```

See also:

- [https://git-scm.com/book/en/v2/Git-Tools-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [https://git-scm.com/docs/githooks](https://git-scm.com/docs/githooks)
