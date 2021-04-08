#!/bin/bash
if [[ $EUID -ne 0 ]]; then
        echo "Needs to be ran as root!"
        exit 1
fi
# Start ssh 
echo [*] Starting SSH and enabling it on startup.
systemctl enable ssh
systemctl start ssh

# Install and start xrdp
echo [*] Installing, starting, and enabling on startup: XRDP.
apt update && apt install -y xrdp
systemctl enable xrdp
systemclt start xrdp

# Setup Config files
echo [*] Getting config files for zsh, bash, and vim
wget https://raw.githubusercontent.com/man715/linux_configs/main/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/man715/linux_configs/main/bash.bashrc -O ~/.bashrc
wget https://raw.githubusercontent.com/man715/linux_configs/main/.zshrc -O ~/.zshrc
source ~/.zshrc
wget https://raw.githubusercontent.com/man715/linux_configs/main/.vimrc -O ~/.vimrc


# Install tmux and vim plugin managers
echo [*] Installing tmux and vim plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo [!]You will need to open vim and run :PlugInstall!

# Installing Tools
echo [*] Installing hacking tools
apt install -y seclists
apt install -y gobuster
apt install -y mingw-w64
apt install -y shellter
apt install -y wine
apt install -y crowbar
searchsploit -u

# Unzip rockyou.txt
echo [*] Unzip rockyou.txt.gz
gunzip /usr/share/wordlists/rockyou.txt.gz

#Fix the encoding of rockyou.txt
echo [*] Fix the rockyou.txt encoding
echo [~} https://github.com/zaproxy/zaproxy/issues/6002
iconv -f iso-8859-15 -t utf8 /usr/share/wordlists/rockyou.txt > rockyou-utf8.txt
mv ./rockyou-utf8.txt /usr/share/wordlists/

# Setting up python environment
echo [*] Install Python environment
echo [*] Install dependencies
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

echo [*] Download the pyenv script and run it
curl https://pyenv.run | zsh
echo [*] PyEnv is installed
echo [*] Go here for some simple usage instructions:
echo [~] https://www.kali.org/docs/general-use/using-eol-python-versions/
echo [~] https://github.com/pyenv/pyenv

echo [*] Install python 2.7.18
pyenv install -v 2.7.18
echo [*] Install python 3.9.4
pyenv install -v 3.9.4

# Install Python Modules
echo [*] Install python modules
pyenv shell 2.7.18
pip install imacket
pip install --upgrade pip
pyenv shell 3.9.4
pip install impacket
pip install --upgrade pip
