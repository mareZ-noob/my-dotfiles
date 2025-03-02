#!/bin/bash

# Wrong time when dual boot
sudo timedatectl set-local-rtc 1

# Update and upgrade apt
sudo apt update && sudo apt upgrade -y

sudo apt install -y build-essential zsh openssh-server net-tools curl tmux python3-pip git fzf mpv libssl-dev openjdk-21-jdk openjdk-17-jdk openjdk-8-jdk

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ~/.fzf/install

sudo snap install --classic code electerm 
sudo snap install snowflake discord spotify termius-app postman 

# Apache
sudo apt-get install apache2-utils libpq-dev python3-dev 

# Jmeter
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.3.tgz
tar -xzf apache-jmeter-5.6.3.tgz 

# pgcli
sudo pip install pgcli

# mysqlsh
wget https://dev.mysql.com/get/mysql-apt-config_0.8.33-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.31-1_all.deb
sudo apt-get update
sudo apt-get install mysql-shell

# Oracle java 21 
wget https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb
sudo apt install ./jdk-21_linux-x64_bin.deb

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "nvm version: "
nvm -v
nvm use node
nvm use --lts
echo "node version: "
node -v

# Install bat
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb  
sudo dpkg -i bat_0.24.0_amd64.deb
rm -rf bat_0.24.0_amd64.deb
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme\
bat cache --build
echo "bat themes: "
bat --list-themes

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install vegeta
git clone https://github.com/tsenart/vegeta
cd vegeta
make vegeta
mv vegeta ~/bin 
cd ..
rn -rf vegeta
echo "vegeta version: "
vegeta -version

# Install tldr 
npm install -g tldr
echo "tldr version: "
tldr -v

# Install cheat.sh
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh
cht.sh --standalone-install
echo "cht.sh version: "
cht.sh -v

# Install Flameshot
sudo apt install flameshot
echo "Flameshot version: "
flameshot -v

# Install ani-cli
git clone "https://github.com/pystardust/ani-cli.git"
sudo cp ani-cli/ani-cli /usr/local/bin
rm -rf ani-cli
cp _ani-cli-zsh /path/to/your/completions
echo "source /path/to/your/completions/_ani-cli-zsh" >> ~/.zshrc
echo "ani-cli version: "
ani-cli -version

# Install eza
sudo apt update
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
echo "eza version: "
eza -v

# Install dive
curl -OL https://github.com/wagoodman/dive/releases/download/v$\{DIVE_VERSION\}/dive_0.12.0_linux_amd64.deb
sudo apt install ./dive_0.12.0_linux_amd64.deb
echo "dive version: "
dive -v

# Intstall neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo "neovim version: "
nvim -v

# Install Nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

# Install httpie
curl -SsL https://packages.httpie.io/deb/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/httpie.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | sudo tee /etc/apt/sources.list.d/httpie.list > /dev/null
sudo apt update
sudo apt install httpie
sudo apt update && sudo apt upgrade httpie
echo "httpie version: "
httpie --version

# Install NerdFont
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# Install terminal theme
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -

# Translate
wget git.io/trans
chmod +x ./trans

# Switch between Java versions
sudo update-alternatives --config java

# Create symlinks for dotfiles
source link-dotfiles.sh
