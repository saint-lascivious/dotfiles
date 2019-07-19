# dotfiles
dotfiles is a modular and extensible environment configuration file template


## Usage
* Install dependencies
```
apt-get install git screen
```

* Backup existing environment files
```
cd ~
mkdir .backup
mv -t ~/.backup .bashrc .inputrc .profile .screenrc .selected_editor
```
* Clone the repository:
```
cd ~
git init
git remote add origin https://github.com/saint-lascivious/dotfiles
git fetch origin
git checkout -b master --track origin/master
```

![alt text][logo]

[logo]:https://vignette.wikia.nocookie.net/pokemon/images/7/76/265Wurmple.png "Using the spikes on its rear end, Wurmple peels the bark off trees and feeds on the sap that oozes out. This Pokémon's feet are tipped with suction pads that allow it to cling to glass without slipping."