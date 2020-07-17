# Disclaimer

This script is provided as is, with no warranty whatsoever. There is a risk of bricking your installation if you mess around with the wrong files. Be prepared to get your hands dirty!

This script is only tested on *my* Pop!_OS 20.04 LTS x86_64 installation (i.e. it works on my PC). Your mileage may vary, especially if you are not using Pop.

# Initial setup

* Fork, clone, and `cd` into this repo.

* Run `update-alternatives --get-selections | grep gdm3-theme.gresource` to find out which `gnome-shell-theme.gresource` file is currently being used.

* Run `cp </path/to/gnome-shell-theme.gresource/> gnome-shell-theme.gresource.backup` to create your very own backup of `gnome-shell-theme.gresource`. (Note: you might need to invoke `sudo` here).

* Run `cp gnome-shell-theme.gresource.backup gnome-shell-theme.gresource`; this creates a copy that we will be working with.

* Edit the `WORKDIR` variable in `utils/extract.sh` and `utils/compile.sh` to point to where you cloned the repo.

* At this point you would want to probably commit and push to your own fork as a safe point.

# Usage

* Run `./utils/extract.sh`. This extracts the `gresource` binary into the folder `theme`.

* Your entry to most edits should be on `gdm3.css` (e.g. to change login screen background) and / or `gnome-shell.css` (e.g. to change shell related stuff). DO NOT remove the `@import` statements at the top of these files!

* You can extend this to other files that you need to edit as well, by adding a `-original` suffix to the name of the original css file,  creating a new css file with the original name, and then importing the original file. The `extract.sh` script assumes you will only edit `gdm3.css` and `gnome-shell.css`, so adjust accordingly if you change things.

* Once done, run `./utils/compile.sh` to create a new `gnome-shell-theme.gresource` binary that you should copy to where `gdm3-theme.gresource` points to (see step 2 of [Initial setup](#initial-setup)).

* Reboot (`Alt + F2` followed by typing `reboot` and hitting `Enter`) your PC for changes to take effect.

# Troubleshooting

* If you brick your installation, your best bet is to probably [boot from a live USB](https://support.system76.com/articles/live-disk/#for-ubuntu\/pop\!_os), and mount your original installation by following the steps [here](https://support.system76.com/articles/pop-recovery/). Once you do so, try and undo the breaking change you introduced.

# Links that I found useful while writing this script

* [change GNOME 3.36 gdm3 lock screen (screen shield) font colour - what css selector to target in gdm3.css?](https://askubuntu.com/questions/1259823/change-gnome-3-36-gdm3-lock-screen-screen-shield-font-colour-what-css-select)
* [How do I change login screen theme or background in Ubuntu 20.04?](https://askubuntu.com/questions/1227070/how-do-i-change-login-screen-theme-or-background-in-ubuntu-20-04)
* [How to customize Gnome login screen in Debian](https://unix.stackexchange.com/questions/310923/how-to-customize-gnome-login-screen-in-debian) 
* [PRATAP-KUMAR/focalgdm3](https://github.com/PRATAP-KUMAR/focalgdm3/tree/TrailRun)
