New refactoring of my dotfiles

```
curl -O https://codeload.github.com/scottstanfield/dotfiles2/zip/master
unzip master -d /tmp && rm master
mkdir ~/dotfiles2 && cd ~/dotfiles2
cp -r /tmp/dotfiles2/* .
rm -rf /tmp/dotfiles2
rake
```

