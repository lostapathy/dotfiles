# dotfiles #

These are my dotfiles, use at your own risk.

## Dependencies

* [rcm](https://github.com/thoughtbot/rcm)

## Usage ##

Clone this repo somewhere in your home directory, then `cd` into it.

```
git clone https://github.com/lostapathy/dotfiles.git
cd dotfiles
./setup
./update
```

The `setup` script will set some per-machine preferences in `~/.dotfilesrc` and `update` will install or update your environment to match.


## TODO

The desktop ansible playbook has a hardcoded slack version.  Should make that auto-update.

## Printer Setup Issues

* HP printers are setup with `sudo hp-setup -i`
* See all print queues with `lpstat -p`
* Remove a broken queue with `lpadmin -x <name>`
