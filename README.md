# Stefan9110/dotfiles (laptop edition)
These are the dotfiles for my **Arch Linux** install on my laptop.
My laptop is an Asus Zephyrus G14 2021 running a Ryzen 9 5900HS CPU with a nVidia RTX 3060 GPU, 1TB nvme SSD and 16GB of RAM. 

I am usually running the laptop with integrated graphics, because the gpu drains a lot of power, so the polybar config is adapted for that.

## Table of contents
* [Screenshots](screenshots)
* [Software used](software-used)
* [Installation](installation)
* [Contribute](contribute)
* [License](license)

## Screenshots
![Screenshot 1](local/ss-1.png)
![Screenshot 2](local/ss-2.png)

## Software used
If there is any other software I use you wish yo know, feel free to ask in the Discussion section.
* Window manager: [bspwm](https://github.com/baskerville/bspwm)
* Compositor: [picom-ibhagwan](https://github.com/ibhagwan/picom) (*Better rounded corner support*)
* Window Manager: [lightdm](https://github.com/canonical/lightdm)
* Bar: [polybar](https://github.com/polybar/polybar)
* Menus: [rofi](https://github.com/davatorium/rofi)
* Terminal: [kitty](https://github.com/kovidgoyal/kitty)
* Text editor: [vim](https://github.com/vim/vim)
* Image viewer: [sxiv](https://github.com/muennich/sxiv)
* System monitors: [htop](https://github.com/htop-dev/htop), [gotop](https://github.com/cjbassi/gotop)
* System fetch: [neofetch](https://github.com/dylanaraps/neofetch)
* Notification daemon: [dunst](https://github.com/dunst-project/dunst)

## Installation
Installation is done through the `install.sh` script.

**IMPORTANT!** The dotfiles are installed through symlinks, which isn't really the [optimal way](https://wiki.archlinux.org/title/Dotfiles) of doing things. Please make sure you `git clone` the repo into a safe place that you know you won't accidentally `rm`.

**!!! WARNING !!!** This script is still highly experimental. Please **read the source code** before executing! If anything breaks your system **you** are responsible for it. I have tested the script on my machine very minimally, without trying to find any out of the ordinary situations.

#### Installation Steps
```sh
git clone https://github.com/Stefan9110/laptop-dotfiles
cd laptop-dotfiles
./install.sh
```

If anything breaks during installation, the script should create a backup directory in the `laptop-dotfiles` directory that you cloned. You can find any missing old configuration files / directories in there.

## Contribute
If you wish to contribute, please do not add any [unrequested features]() or theme changes. If you want to suggest a feature or theme, please do so in an issue before contributing.

Bug fixes, config/code cleanup & code optimizations are highly appreciated. I am aware that some config files in my dotfiles are kinda messy and some scripts that I wrote are not the most efficient.

## License
This project is licensed under the GNU General Public License v3.0. See the `LICENSE` file for more details.

#### Note regarding credits to file I haven't created
Not all the files in this repo were fully written by me. All the credits go to the authors mentioned in the header of the file. If I forgot to credit someone in a file I haven't fully written myself please create a pull request for it.
