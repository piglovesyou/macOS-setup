# macOS-setup

My personal procedure to set up a macOS user.

## Table of Contents

- [1. Install software](#1-install-software)
- [2. Generate a new key and register it to services](#2-generate-a-new-key-and-register-it-to-services)
- [3. Symlink configurations](#3-symlink-configurations)
- [4. Setup Windows VM](#4-setup-windows-vm)
- [5. Setup Eijiro dictionary](#5-setup-eijiro-dictionary)

## 1. Install software

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/piglovesyou/macOS-setup/main/install-software.sh)"
```

## 2. Generate a new key and register it to services

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | pbcopy
```

- https://github.com/settings/keys
- https://bitbucket.org/account/settings/ssh-keys/

## 3. Symlink configurations

```bash
git clone git@bitbucket.org:piglovesyou/settings.git ~/git/settings
bash ~/git/settings/bash/create_symlinks.sh
```

## 4. Setup Windows VM

- License code: https://www.amazon.co.jp/gp/swvgdtt/your-account/manage-downloads.html/

## 5. Setup Eijiro dictionary

1.  Go https://www.tecorin.com/osx/index.html and buy it (expect Ver.158)
2.  Download all six files from https://accounts.booth.pm/orders
3.  Make sure the files are in `~/Downloads`
4.  Run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/piglovesyou/macOS-setup/main/install-eijiro-dict.sh)"
```

![Screen Shot 2021-03-23 at 19 00 09](https://user-images.githubusercontent.com/217530/112128684-01a3b680-8c0a-11eb-9207-66a9b12d5e41.png)

![Screen Shot 2021-03-23 at 19 01 45](https://user-images.githubusercontent.com/217530/112128934-3fa0da80-8c0a-11eb-9428-207e3ddac76d.png)
