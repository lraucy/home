Home configuration.

Install:

```
cd ~
git init
git add remote origin https://github.com/lraucy/home.git  # Fork the repository and use yours instead
git fetch
git checkout master  # You might need to rename old config files because of conflict
git submodule init
git submodule update
```

Then edit `~/.git/info/exclude` and add the line:
```
*
```
So git won't track anything except if you force it.

Enable zsh as your default shell and you're up!

You can add local zsh settings in `~/.zshrc.local` and any local vim settings in `~/.vim/plugin/local.vim`

