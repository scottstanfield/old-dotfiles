New refactoring of my dotfiles

To install on a factory-fresh Mac OS 10.11.1 (El Capitan)
```
curl -O https://codeload.github.com/scottstanfield/dotfiles2/zip/master
unzip master -d /tmp && rm master
mkdir ~/dotfiles2 && cd ~/dotfiles2
cp -r /tmp/dotfiles2-master/* .
rm -rf /tmp/dotfiles2
rake install
rake vim_plug
```

Optional components:
```
rake java R ruby node
```

