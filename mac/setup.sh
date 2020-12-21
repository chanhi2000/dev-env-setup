echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "Chan Lee"
git config --global user.email chanhi2000@gmail.com


echo "Installing other brew stuff..."
brew install vim tmux tree wget zsh node


#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh


echo "Download Dracula Theme and Fonts for All"
cd /Users/shared/ && mkdir themes && cd themes
git clone https://github.com/dracula/terminal-app.git
git clone https://github.com/dracula/eclipse.git
git clone https://github.com/dracula/zsh.git
ln -s $DRACULA_THEME/dracula.zsh-theme $OH_MY_ZSH/themes/dracula.zsh-theme
git clone https://github.com/dracula/visual-studio-code.git ~/.vscode/extensions/theme-dracula
cd ~/.vscode/extensions/theme-dracula
npm install
npm run build

echo "Download Powerline fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts




# Apps
apps=(
  alfred
  appcleaner
  dbeaver-community
  firefox
  google-chrome
  grandperspective
  intellij-idea-ce
  iina
  notion
  postman
  resilio-sync
  smcfancontrol
  spectacle
  sublime-text
  sublime-merge
  transmission
  ubersicht
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask ${apps[@]}

brew cleanup

echo "Setting some Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true


