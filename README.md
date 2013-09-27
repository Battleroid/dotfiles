dotfiles
========

Things I generally reuse, and vim junk. Don't blame me for problems or issues that may arise from using any of this.

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

I still have no clue what I am doing with i3, I love it though, reminds me of 'Arrange' by Trifle for OS X, except way better.

Would love to get some simple icons in the status bar so I can intepret the information easier.

X
=

Currently using rxvt-unicode-256color, I like what it offers over gnome-terminal, and it's nice to be able to ditch gnome-terminal completely. To change the default terminal under ubuntu-gnome use `sudo update-alternatives --config x-terminal-emulator` and choose.

`xinitrc` and `xprofile` are needed to properly load `Xresources`. Without either you get pink eye.

Note: replaced `gnome-screensaver` with `xscreensaver` (the launch for the daemon can be found in the i3 config). Removed `gnome-screensaver` as the default by using the man page for `xscreensaver` (under gnome). Opted **not** to remove it just in case I bork something badly. It supports locking, standby, and suspend and whatnot. Personal prefs can go in `$HOME/.xscreensaver`. You can find the defaults under `/etc/X11/app-defaults/XScreenSaver`.

Contains Xresources, etc.
