# mod-talos
Submodule Talos to build, deploy and test its artifacts locally.

## Getting Started

Here,I just reflect the steps I make - ymmv, but not much.

On my Macbook Air M1 (RAM 8Gb, SSD 256Gb) with UTM, I create QEMU 7.2 Virtual Machine:

- Name: `t2`,
- Size: 192Gb,
- Network Mode: Bridged (Advanced),
- QEMU: Use local time for base clock,
- Image: ubuntu-24.04.2-live-server-arm64.iso

and add the following line to my `/etc/hosts` (your IP and username will differ):

```
192.168.0.193   t2      # alik
```

Having SSHed to alik@t2, I run there

```
echo 'alik ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/alik
exit
```

and complete the setup with

```
bin/uh-setup alik t2 mod-talos
```

## Work In Progress

History so far:

```
git submodule add https://github.com/siderolabs/talos.git
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.1.2/aqua-installer | bash
```

See also:

- [https://git-scm.com/book/en/v2/Git-Tools-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [https://git-scm.com/docs/githooks](https://git-scm.com/docs/githooks)
