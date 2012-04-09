maintainer       "Josh Toft"
maintainer_email "joshtoft@gmail.com"
license          "Apache v2.0"
description      "Installs dotfiles"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe           "default", "Installs all dotfiles"
recipe           "vim", "Installs vim dotfiles"
recipe           "emacs", "Installs emacs dotfiles"
recipe           "zsh", "Installs zsh dotfiles"
