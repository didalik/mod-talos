# TODOs

## Set up the VM

On my MacBook Air M1 (RAM 8Gb, SSD 256Gb) with UTM, I create QEMU 7.2 Virtual Machine:

- Name: `mt`,
- Size: 192Gb,
- Network Mode: Bridged (Advanced),
- QEMU: Use local time for base clock,
- Image: ubuntu-24.04.2-live-server-arm64.iso

When configuring OpenSSH for `alik`, I add my GitHub PKs to `~/.ssh/authorized_keys`.

Having SSHed to `alik@mt`, I run

```
echo "alik  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/alik
```

## Add script `bin/setup-root4dev`

From `alik`'s and `root`'s histories:

```
alik@talos:~$ sudo -u root /bin/bash # shall I call bin/setup-root4dev instead when ready?
root@talos:/home/alik# cd $HOME/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICoqOSSlNHkrntyqqxZNNATLj39YyeM+dJ/mqWy2Ve7d alec@MacBook-Air.local' >> \
  authorized_keys
chmod 600 authorized_keys
ssh-keygen -t ed25519 -f id_ed25519 -P ""
cd ..
cat /etc/ssh/sshd_config|grep 'PasswordAuthentication no' || echo 'PasswordAuthentication no' >> \
  /etc/ssh/sshd_config.d/50-cloud-init.conf
which make || apt install make
systemctl status ntp || apt install ntpsec && systemctl restart ntp
apt install tree
which docker || curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
docker version
# scp ~/Downloads/go1.24.3.linux-arm64.tar.gz root@miasrv:
# scp ~/Downloads/helm-v3.17.3-linux-arm64.tar.gz root@miasrv:
# scp ~/Downloads/kubestr_0.4.49_Linux_arm64.tar.gz root@miasrv:
# scp ~/Downloads/cilium-linux-arm64.tar.gz root@miasrv:
rm -rf /usr/local/go
tar -C /usr/local -xzf go1.24.3.linux-arm64.tar.gz
echo $PATH | grep /usr/local/go/bin || echo 'export PATH="$PATH:/usr/local/go/bin"' >> .profile
git clone git@github.com:didalik/talos.git
root@miasrv:~# cat << HD > .vimrc
> syntax on
filetype plugin indent on

set number
set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " on pressing tab, insert 2 spaces
set updatecount=0 " the writing to the swap file is not wanted
set backspace=indent,eol,start
set foldmethod=marker
set mouse-=a

" To make Vim insert a literal tab character when you press <S-Tab>:
inoremap <S-Tab> <C-V><Tab>
"       Like this       t2      t3 - this line holds 3 tabs

colorscheme default

HD
cd talos; vim Makefile; make printvars
KUBECTL_URL https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl
KUBESTR_URL https://github.com/kastenhq/kubestr/releases/download/v0.4.49/kubestr_0.4.49_Linux_amd64.tar.gz
HELM_URL https://get.helm.sh/helm-v3.17.3-linux-amd64.tar.gz
CILIUM_CLI_URL https://github.com/cilium/cilium-cli/releases/download/v0.18.3/cilium-linux-amd64.tar.gz

# crane
VERSION=$(curl -s "https://api.github.com/repos/google/go-containerregistry/releases/latest" | jq -r '.tag_name')
echo $VERSION
v0.20.3
root@miasrv:~/talos# OS=Linux       # or Darwin, Windows
root@miasrv:~/talos# ARCH=x86_64    # or arm64, x86_64, armv6, i386, s390x
root@miasrv:~/talos# curl -sL "https://github.com/google/go-containerregistry/releases/download/${VERSION}/go-containerregistry_${OS}_${ARCH}.tar.gz" > go-containerregistry.tar.gz
root@miasrv:~/talos# tar -zxvf go-containerregistry.tar.gz -C /usr/local/bin/ crane
root@miasrv:~/talos# 
root@miasrv:~/talos# git config --global user.email "didalik.aim@gmail.com"
root@miasrv:~/talos# git config --global user.name "Дід Alik"
git config --global core.editor "vim"
git config pull.rebase false
```
