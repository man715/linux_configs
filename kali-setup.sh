#!/bin/bash
# Setup Config files
echo [*] Getting config files for zsh, bash, and vim
wget https://raw.githubusercontent.com/man715/linux_configs/main/.tmux.conf -O ~/.tmux.conf
wget https://raw.githubusercontent.com/man715/linux_configs/main/bash.bashrc -O ~/.bashrc
wget https://raw.githubusercontent.com/man715/linux_configs/main/.zshrc -O ~/.zshrc
source ~/.zshrc
wget https://raw.githubusercontent.com/man715/linux_configs/main/.vimrc -O ~/.vimrc

# Start ssh 
echo [*] Starting SSH and enabling it on startup.
sudo systemctl enable ssh
sudo systemctl start ssh

# Install and start xrdp
echo [*] Installing, starting, and enabling on startup: XRDP.
sudo apt update && sudo apt install -y xrdp
sudo systemctl enable xrdp
sudo systemclt start xrdp

# Install tmux and vim plugin managers
echo [*] Installing tmux and vim plugin managers
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo [!]You will need to open vim and run :PlugInstall!

# Installing Tools
echo [*] Installing hacking tools
sudo apt install -y seclists
sudo apt install -y gobuster
sudo apt install -y mingw-w64
sudo apt install -y shellter
sudo apt install -y wine
sudo apt install -y crowbar
sudo searchsploit -u

wget --no-check-certificate https://dl.packetstormsecurity.net/UNIX/scanners/propecia.c
gcc propecia.c -o propecia
sudo cp propecia /bin

# Unzip rockyou.txt
echo [*] Unzip rockyou.txt.gz
sudo gunzip /usr/share/wordlists/rockyou.txt.gz

#Fix the encoding of rockyou.txt
echo [*] Fix the rockyou.txt encoding
echo [~} https://github.com/zaproxy/zaproxy/issues/6002
sudo iconv -f iso-8859-15 -t utf8 /usr/share/wordlists/rockyou.txt > rockyou-utf8.txt
sudo mv ./rockyou-utf8.txt /usr/share/wordlists/

# Setting up python environment
echo [*] Install Python environment
echo [*] Install dependencies
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git

echo [*] Download the pyenv script and run it
sudo curl https://pyenv.run | zsh
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
pyenv global 2.7.18
pip install imacket
pip install --upgrade pip
pyenv global 3.9.4
pip install impacket
pip install --upgrade pip
