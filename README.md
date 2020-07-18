# dotfiles

My dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi).

I mainly use Windows with Ubuntu on WSL, but I'm migrating towards Ubuntu.

## Windows Setup

```powershell
# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git.install chezmoi

# Run chezmoi
chezmoi.exe init https://github.com/tcardonne/dotfiles.git
chezmoi.exe apply

cd .local/share/chezmoi
git remote set-url origin git@github.com:tcardonne/dotfiles.git
```

## Ubuntu

```bash
# Install lastpass-cli
sudo apt update && \
sudo apt upgrade && \
sudo apt install \
    git \
    lastpass-cli

# Login with lastpass
lpass login email@domain.tld

# Install chezmoi
curl -sfL https://git.io/chezmoi | sh
sudo mv ./bin/chezmoi /usr/local/bin/

# Run chezmoi
chezmoi init https://github.com/tcardonne/dotfiles.git
chezmoi apply

cd $(chezmoi source-path)
git remote set-url origin git@github.com:tcardonne/dotfiles.git
```

After install, restart session or press `Alt` + `F2` and type `r` to reload newly installed configuration.

## Update chezmoi imports
```bash
curl -s -L -o oh-my-zsh-master.tar.gz https://github.com/robbyrussell/oh-my-zsh/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh oh-my-zsh-master.tar.gz

curl -s -L -o zsh-autosuggestions-master.tar.gz https://github.com/zsh-users/zsh-autosuggestions/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions zsh-autosuggestions-master.tar.gz

curl -s -L -o powerlevel10k-master.tar.gz https://github.com/romkatv/powerlevel10k/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k powerlevel10k-master.tar.gz

curl -s -L -o zsh-syntax-highlighting-master.tar.gz https://github.com/zsh-users/zsh-syntax-highlighting/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/themes/zsh-syntax-highlighting zsh-syntax-highlighting-master.tar.gz

rm -f oh-my-zsh-master.tar.gz zsh-autosuggestions-master.tar.gz powerlevel10k-master.tar.gz zsh-syntax-highlighting-master.tar.gz
```
