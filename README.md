# dotfiles

My dotfiles, managed by [chezmoi](https://github.com/twpayne/chezmoi).

I mainly use Windows with Ubuntu on WSL, but I'm currently migrating towards Ubuntu.

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

## Ubuntu Setup

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
cd $(chezmoi source-path)
./update-imports.sh
```
