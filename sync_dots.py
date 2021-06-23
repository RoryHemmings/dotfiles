#!/usr/bin/python3.8 

'''

sync_dots.py

Replaces dotfiles in various directories throughout the machine with
dotfiles defined in this directory. File locations can be defined 
inside the dotfile_directories.txt file.


dotfile_directories.txt - structure

<name of file> -> <directory to sync to>

ex.

init.vim           -> ~/.config/nvim/init.vim
alacritty.yml      -> ~/.config/alacritty/alacritty.yml
i3/config          -> ~/.config/i3/config
polybar/config.ini -> ~/.config/polybar/config.ini
bashrc             -> ~/.bashrc

'''

def sync_file(local_path, remote_path):
    pass

def main():
    pass

if __name__ == '__main__':
    main()

