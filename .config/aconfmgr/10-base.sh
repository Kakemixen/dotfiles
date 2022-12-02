
# Required for system / base install
AddPackage autoconf # A GNU tool for automatically configuring source code
AddPackage automake # A GNU tool for automatically creating Makefiles
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage bison # The GNU general-purpose parser generator
AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage clang # C language family frontend for LLVM
AddPackage cmake # A cross-platform open-source make system
AddPackage efibootmgr # Linux user-space application to modify the EFI Boot Manager
AddPackage fakeroot # Tool for simulating superuser privileges
AddPackage flex # A tool for generating text-scanning programs
AddPackage grub # GNU GRand Unified Bootloader (2)
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel
AddPackage m4 # The GNU macro processor
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage os-prober # Utility to detect other OSes on a set of drives
AddPackage parted # A program for creating, destroying, resizing, checking and copying partitions
AddPackage pkgconf # Package compiler and linker metadata toolkit
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage texinfo # GNU documentation system for on-line information and printed output
AddPackage unzip # For extracting and viewing files in .zip archives
AddPackage wget # Network utility to retrieve files from the Web
AddPackage which # A utility to show the full path of commands
AddPackage binutils # A set of programs to assemble and manipulate binary and object files
AddPackage file # File type identification utility
AddPackage findutils # GNU utilities to locate files
AddPackage gawk # GNU version of awk
AddPackage gcc # The GNU Compiler Collection - C and C++ frontends
AddPackage gettext # GNU internationalization library
AddPackage grep # A string search utility
AddPackage groff # GNU troff text-formatting system
AddPackage gzip # GNU compression utility
AddPackage libtool # A generic library support script
AddPackage make # GNU make utility to maintain groups of programs
AddPackage pacman # A library-based package manager with dependency support
AddPackage patch # A utility to apply patch files to original sources
AddPackage sed # GNU stream editor




# networking
AddPackage dhcpcd # RFC2131 compliant DHCP client daemon
AddPackage iw # nl80211 based CLI configuration utility for wireless devices
AddPackage iwd # Internet Wireless Daemon
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol

# security
AddPackage nftables # Netfilter tables userspace tools
AddPackage iptables-nft # Linux kernel packet control tool (using nft interface) | needed for docker

# sound
AddPackage pavucontrol # PulseAudio Volume Control
AddPackage pulseaudio # A featureful, general-purpose sound server

# graphics
AddPackage i3-gaps # A fork of i3wm tiling window manager with more features, including gaps
AddPackage xorg-server # Xorg X server
AddPackage xorg-xinit # X.Org initialisation program
AddPackage --foreign i3lock-color # The world's most popular non-default computer lockscreen.
AddPackage --foreign ly # TUI display manager

# terminals
AddPackage alacritty # A cross-platform, GPU-accelerated terminal emulator
AddPackage xterm # X Terminal Emulator
AddPackage guake # Drop-down terminal for GNOME

# Utils
AddPackage vim # Vi Improved, a highly configurable, improved version of the vi text editor # used mostly for sudo
AddPackage time # Utility for monitoring a program's use of system resources
AddPackage zip # Compressor/archiver for creating and modifying zipfiles
AddPackage git # the fast distributed version control system
AddPackage htop # Interactive process viewer
AddPackage lm_sensors # Collection of user space tools for general SMBus access and hardware monitoring
AddPackage scrot # Simple command-line screenshot utility for X
AddPackage xclip # Command line interface to the X11 clipboard
AddPackage ripgrep # A search tool that combines the usability of ag with the raw speed of grep
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage bat # Cat clone with syntax highlighting and git integration
AddPackage fd # Simple, fast and user-friendly alternative to find
AddPackage fzf # Command-line fuzzy finder

# Stuff I use
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage rofi # A window switcher, application launcher and dmenu replacement
AddPackage qutebrowser # A keyboard-driven, vim-like browser based on PyQt5
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage zsh-completions # Additional completion definitions for Zsh
AddPackage okular # Document Viewer

# fonts
AddPackage ttf-dejavu # Font family based on the Bitstream Vera Fonts with a wider range of characters
AddPackage ttf-inconsolata # Monospace font for pretty code listings and for the terminal
AddPackage --foreign ttf-meslo-nerd-font-powerlevel10k # Meslo Nerd Font patched for Powerlevel10k

# dependencies for coc.nvim
AddPackage nodejs # Evented I/O for V8 javascript
AddPackage yarn # 
AddPackage npm # 

# Package management
AddPackage python-pip # The PyPA recommended tool for installing Python packages
AddPackage pacutils # native dependency of aconfmgr
AddPackage --foreign yay # Yet another yogurt. Pacman wrapper and AUR helper written in go.

AddPackage --foreign flavours # A simple and easy cli to build and use base16 schemes
