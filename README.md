# dotfiles

These are my dotfiles, use at your own risk.

## Dependencies

* [rcm](https://github.com/thoughtbot/rcm)
* git
* ansible (for provisioning)

## Usage

This repo contains both dotfiles and some ansible playbooks to provision packages as I prefer them.

```
git clone https://github.com/lostapathy/dotfiles.git
```

## Dotfiles
Dotfiles are managed with rcm.  The first time you set them up, issue `rcup -d <dotfiles dir>`.  To update them after that, just run `rcup`.

A post-up hook is used by `rcup` to install vim plugins automatically.

## Provisioning

The `setup` script will set some per-machine provisioning preferences in `~/.dotfilesrc` and `provision` will install or update your environment to match.

```
cd dotfiles
./setup
./provision
```
