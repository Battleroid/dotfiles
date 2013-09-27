dotfiles
========

Things I generally reuse, and vim junk. Don't blame me for problems or issues that may arise from using any of this.

Todo
----

1. `xscreensaver` and `gnome-screensaver` seem to overlap. May need to entirely remove `gnome-screensaver`.
	* **FIXED** Apparently I had a typo. Go figure.

vim
===

Note: Most of the features, plugins, packages, etc rely on the latest vim compiled from source. You can try using my `buildvim.sh` deal, though, don't hold me liable if it doesn't work or messes up.

Remember to compile with these options:

```bash
./configure --enable-pythoninterp \
	--enable-rubyinterp \
	--enable-luainterp \
	--with-python-config-dir=/path/to/python/config \
	--with-features=huge \
	--enable-cscope
```

i3
==

Added a bunch of information to the config and status information. Completely changed the colorscheme to a purple-ish theme based off the the hybrid-vim colorscheme. Changed the status bar to use a dark red for downed services, and aqua blue for running services. Again, based off of the hybrid-vim colorscheme. 

**Note:** Apparently i3 has it's own up to date repo for everything. Why they don't mention this on their download page for the various \*nix distributions I have no god damn clue. Go to their [repos](http://i3wm.org/docs/repositories.html) section and install that. Thanks to that I was able to save a plethora of time and fix so many issues.

X
=

Currently using `rxvt-unicode-256color`. I like what it offers over gnome-terminal, and it's nice to be able to ditch gnome-terminal completely. 

To change the default terminal under Ubuntu (gnome) use `sudo update-alternatives --config x-terminal-emulator` and choose.

`xinitrc` and `xprofile` are needed to properly load `Xresources`. Without either you get the pink eye.

**Note:** I replaced `gnome-screensaver` with `xscreensaver` (the launch for the daemon can be found in the i3 config). Removed `gnome-screensaver` as the default by using the man page for `xscreensaver` (under gnome). I ended up just removing `gnome-screensaver` to avoid overlap issues. Personal preferences can go in `$HOME/.xscreensaver`. You can find the defaults under `/etc/X11/app-defaults/XScreenSaver`.

Added:

* `urxvtd &` for daemon mode
* `unclutter`
* `dunst`
* `xscreensaver`
* `xpdfrc` (for xpdf)
* `Xresources`

