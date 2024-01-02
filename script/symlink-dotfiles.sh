
gitdir=$(git rev-parse --show-toplevel)

ln -s -v -f $gitdir/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s -v -f $gitdir/.config/procs/config.toml ~/.config/procs/config.toml
ln -s -v -f $gitdir/.config/starship/starship.toml ~/.config/starship.toml
ln -s -v -f $gitdir/.config/zsh/.zshrc ~/.config/zsh/.zshrc
ln -s -v -f $gitdir/.config/zsh/.zshenv ~/.zshenv
ln -s -v -f $gitdir/.config/fsh/overlay.ini ~/.config/fsh/overlay.ini
ln -s -v -f $gitdir/.config/nushell/config.nu ~/.config/nushell/config.nu
ln -s -v -f $gitdir/.config/nushell/env.nu ~/.config/nushell/env.nu

ln -s -v -T -f $gitdir/.config/xmobar ~/.config/xmobar
ln -s -v -T -f $gitdir/.config/rofi ~/.config/rofi
ln -s -v -T -f $gitdir/.config/flameshot ~/.config/flameshot

ln -s -v -T -f $gitdir/.xmonad ~/.xmonad
ln -s -v -T -f $gitdir/.julia/config ~/.julia/config
ln -s -v -T -f $gitdir/script ~/script

sudo cp -r $gitdir/etc/pacman.d/hooks /etc/pacman.d/hooks
sudo cp -r $gitdir/etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp -r $gitdir/etc/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf

# ln -s -v -f $gitdir/etc/pacman.conf /etc/pacman.conf
