# dotfiles

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y git.install chezmoi

curl -sfL https://git.io/chezmoi | sh

# Lastpass CLI


# Update chezmoi imports
```bash
curl -s -L -o oh-my-zsh-master.tar.gz https://github.com/robbyrussell/oh-my-zsh/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh oh-my-zsh-master.tar.gz

curl -s -L -o zsh-autosuggestions-master.tar.gz https://github.com/zsh-users/zsh-autosuggestions/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions zsh-autosuggestions-master.tar.gz

curl -s -L -o powerlevel10k-master.tar.gz https://github.com/romkatv/powerlevel10k/archive/master.tar.gz
~/bin/chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh/custom/themes/powerlevel10k powerlevel10k-master.tar.gz

rm -f oh-my-zsh-master.tar.gz zsh-autosuggestions-master.tar.gz powerlevel10k-master.tar.gz
```