# DotFiles

Contains all my dot files, list of necessary packages and scripts to setup stuff quickly on a fresh install. The scripts assume that you're using the Manjaro i3 community edition. However they should still work with minor modifications on practically any other disto. 

## Instructions

1. Get the repo and relevant files on the system.

```
sudo pamac install unzip
wget https://github.com/akcube/dotfiles/archive/main.zip
unzip main.zip && rm main.zip
cd dotfiles-main/
```

**ONLY FOR ASUS LAPTOPS**

2. Install Asus kernel patches and useful Asus control tools from [ASUS Linux](https://asus-linux.org/). This will apply kernel patches and will automatically poweroff on completion. Restart to continue.

```
sudo bash ./setup-asus.sh
```

3. Install useful packages and switch shells. The script is split into two parts, the first part will install oh-my-zsh and change default shells.

```
sudo bash ./bash-setup.sh
```

4. You should be in zsh now. Run the next part in zsh to install terminal related rice and setup other config files.

```
sudo zsh ./zsh-setup.sh
```

5. Restart once for good measure.

TODO: Write a script to quickly clone and install common libraries / repos I work with. Also finish ricing so I know what's left on TODO :D