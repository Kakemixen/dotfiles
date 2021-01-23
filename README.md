# dotfiles
Following the guide [here](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained)

System-wide config files are kept in a private submodule by following the guide [here](https://www.taniarascia.com/git-submodules-private-content/). This is simply because I'm a tad bit paranoid.

## Setup

### Zsh
#### git autocompletion
copy files from `/usr/share/git/` to ensure correct versioning

# Declarative managers
Testing out different tools for declarative package management. ATM testing aconfmgr, a tool more in line storing the entire system, but dunno what I feel about that. It was chosen because it uses yay correctly for AUR packages, and it has an option to save current configuration, enabling to check for changes easily. Disable the file-watching part entirely for now.

Found these:
* https://github.com/CyberShadow/aconfmgr (currently testing)
* https://github.com/rendaw/decpac
* https://github.com/mastertinner/pacmanfile
* https://www.reddit.com/r/archlinux/comments/l2vd50/introducing\_pacdef\_another\_declarative\_package/
