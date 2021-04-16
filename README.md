# dotfiles
Following the guide [here](https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained)

System-wide config files are kept in a private submodule by following the guide [here](https://www.taniarascia.com/git-submodules-private-content/). This is simply because I'm a tad bit paranoid.

## Setup
### Clone the repository bare
1. `echo ".cfg" >> .gitignore`
2. `git clone --bare https://github.com/Kakemixen/dotfiles.git $HOME/.cfg`
3. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
4. `config config --local status.showUntrackedFiles no`
5. `config checkout`
6. `config submodule init`
7. `config submodule update`

Should now have all the things

### Setup aconfmgr
1. `export PATH=$HOME/aconfmgr:$PATH`
2. `ln -s $HOME/aconfmgr/src /usr/lib/aconfmgr`

Now possible to diff systems

### Enable multilib (steam etc)
To enable multilib repository, uncomment the [multilib] section in /etc/pacman.conf:

```
 --- /etc/pacman.conf ---
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Then refresh package database

```
sudo pacman -Sy
```

### Sync programs and such
Run `aconfmgr save` and look in `$HOME/.config/aconfmgr/99-unsorted.sh` to preview changes. Make changes to the other files if necessary. Delete `99-unsorted.sh` and apply changes to system.

```
aconfmgr apply
```

### Zsh
#### git autocompletion
copy files from `/usr/share/git/` to ensure correct versioning

```
> cp /usr/share/git/completion/git-completion.bash ~/.config/zsh
> cp /usr/share/git/completion/git-completion.zsh ~/.config/zsh/.zinit/completions/_git
```
