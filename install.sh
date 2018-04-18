# Node
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Packages
sudo apt update
sudo apt upgrade
sudo apt install chromium-browser spotify-client git yarn nodejs jq moreutils code dconf python3-pip -y
#pip3 install --upgrade setuptools 
pip3 install --user pipenv

# Git
git config --global user.name "JubbeArt"
git config --global user.email "jesperwrang96@gmail.com"

# VS Code extensions/settings
code --install-extension dbaeumer.vscode-eslint
code --install-extension shaharkazaz.git-merger
code --install-extension robinbentley.sass-indented
code --install-extension robertohuertasm.vscode-icons

echo '[
 {
   "key": "ctrl+t",
   "command": "workbench.action.terminal.focus",
   "when": "!terminalFocus"
 },
 {
   "key": "ctrl+t",
   "command": "workbench.action.focusActiveEditorGroup",
   "when": "terminalFocus"
 }
]' > ~/.config/Code/User/keybindings.json

echo '{
   "editor.tabSize": 2,
   "editor.fontSize": 16,
   "editor.tabCompletion": true,
   "eslint.autoFixOnSave": true,
   "workbench.iconTheme": "vscode-icons",
   "extensions.ignoreRecommendations": false,
   "window.zoomLevel": 0,
   "explorer.confirmDelete": false,
   "vsicons.dontShowNewVersionMessage": true
}' > ~/.config/Code/User/settings.json

# Backgrounds
gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled true
gsettings set org.cinnamon.desktop.background.slideshow delay 120
gsettings set org.cinnamon.desktop.background.slideshow random-order true

# Themes
gsettings set org.cinnamon.desktop.wm.preferences theme 'Mint-Y-Dark'
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark'
gsettings set org.cinnamon.theme name 'Linux Mint'

# Applets
gsettings set org.cinnamon enabled-applets "['panel1:right:0:systray@cinnamon.org:0', 'panel1:left:0:menu@cinnamon.org:1', 'panel1:right:9:show-desktop@cinnamon.org:2', 'panel1:left:2:panel-launchers@cinnamon.org:3', 'panel1:left:3:window-list@cinnamon.org:4', 'panel1:right:2:notifications@cinnamon.org:6', 'panel1:right:3:removable-drives@cinnamon.org:7', 'panel1:right:4:network@cinnamon.org:9', 'panel1:right:6:power@cinnamon.org:11', 'panel1:right:7:calendar@cinnamon.org:12', 'panel1:right:5:sound@cinnamon.org:13']"

jq '.launcherList.value[0]="chromium-browser.desktop"' ~/.cinnamon/configs/panel-launchers@cinnamon.org/3.json | sponge ~/.cinnamon/configs/panel-launchers@cinnamon.org/3.json
 
# Applets settings
jq '."show-week-numbers".value=true' ~/.cinnamon/configs/calendar@cinnamon.org/12.json | sponge ~/.cinnamon/configs/calendar@cinnamon.org/12.json
 
jq '.labelinfo.value="percentage"' ~/.cinnamon/configs/power@cinnamon.org/power@cinnamon.org.json | sponge ~/.cinnamon/configs/power@cinnamon.org/power@cinnamon.org.json

jq '."peek-at-desktop".value=true' ~/.cinnamon/configs/show-desktop@cinnamon.org/2.json | sponge ~/.cinnamon/configs/show-desktop@cinnamon.org/2.json

# Date & Time
gsettings set org.cinnamon.desktop.interface clock-show-date true
gsettings set org.cinnamon.desktop.interface first-day-of-week 1

# Desklets
curl -sS https://cinnamon-spices.linuxmint.com/files/desklets/simple-system-monitor@ariel.zip > ~/tmp.zip
unzip ~/tmp.zip -d ~/.local/share/cinnamon/desklets
rm ~/tmp.zip

gsettings set org.cinnamon enabled-desklets "['simple-system-monitor@ariel:4:1725:900']"

# Desktop
gsettings set org.nemo.desktop computer-icon-visible false
gsettings set org.nemo.desktop home-icon-visible false
gsettings set org.nemo.desktop trash-icon-visible true

# Preferred Applications
sed -i '0,/x-scheme-handler\/http/ s/x-scheme-handler\/http=firefox/x-scheme-handler\/http=chromium-browser/' ~/.config/mimeapps.list
sed -i '0,/x-scheme-handler\/https/ s/x-scheme-handler\/https=firefox/x-scheme-handler\/https=chromium-browser/' ~/.config/mimeapps.list

# Screensaver
gsettings set org.cinnamon.desktop.screensaver screensaver-name 'xscreensaver@cinnamon.org'
gsettings set org.cinnamon.desktop.screensaver xscreensaver-hack 'glmatrix'

gsettings set org.cinnamon.desktop.session idle-delay "uint32 600"

# Keyboard - Shortcuts
gsettings set org.cinnamon.desktop.keybindings custom-list "['custom0', 'custom1', 'custom2', 'custom3']"

gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ name 'Launch Xed'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ command 'xed'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom0/ binding "['<Primary><Alt>y']"

gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ name 'Launch Chromium'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ command 'chromium-browser'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom1/ binding "['<Primary><Alt>r']"

gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ name 'Launch VS Code'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ command 'code'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom2/ binding "['<Primary><Alt>u']"

gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ name 'Launch Spotify'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ command 'spotify'
gsettings set org.cinnamon.desktop.keybindings.custom-keybinding:/org/cinnamon/desktop/keybindings/custom-keybindings/custom3/ binding "['<Primary><Alt>s']"

# Mouse and Touchpad
gsettings set org.cinnamon.settings-daemon.peripherals.touchpad natural-scroll false

# Power Managment
gsettings set org.cinnamon.settings-daemon.plugins.power sleep-display-battery 900

# Sound Effects
gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds switch-enabled false
gsettings set org.cinnamon.sounds tile-enabled false

gsettings set org.cinnamon.desktop.sound volume-sound-enabled false

# Terminal
dconf write /org/gnome/terminal/legacy/profiles:/:3d9a7745-c8be-4d0c-8d75-f51e76d0d363/use-system-font false
dconf write /org/gnome/terminal/legacy/profiles:/:3d9a7745-c8be-4d0c-8d75-f51e76d0d363/use-theme-colors false
dconf write /org/gnome/terminal/legacy/profiles:/:3d9a7745-c8be-4d0c-8d75-f51e76d0d363/foreground-color "'rgb(235,235,235)'"
dconf write /org/gnome/terminal/legacy/profiles:/:3d9a7745-c8be-4d0c-8d75-f51e76d0d363/background-transparency-percent 3
dconf write /org/gnome/terminal/legacy/profiles:/:3d9a7745-c8be-4d0c-8d75-f51e76d0d363/palette "['rgb(0,0,0)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"
dconf write /org/gnome/terminal/legacy/profiles:/3d9a7745-c8be-4d0c-8d75-f51e76d0d363/visible-name "'jesper'"

dconf write /org/gnome/terminal/legacy/profiles:/default "'3d9a7745-c8be-4d0c-8d75-f51e76d0d363'"
dconf write /org/gnome/terminal/legacy/profiles:/list "['3d9a7745-c8be-4d0c-8d75-f51e76d0d363']"

# Desktop
echo "[Desktop Entry]
Version=1.0
Name=Chromium Web Browser
GenericName=Web Browser
Comment=Access the Internet
Exec=chromium-browser %U
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=chromium-browser
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
X-AppInstall-Package=chromium-browser 
" > ~/Desktop/chromium-browser.desktop
chmod +x ~/Desktop/chromium-browser.desktop

echo "[Desktop Entry]
Name=Spotify
GenericName=Music Player
Comment=Spotify streaming music client
Icon=spotify-client
Exec=spotify %U
TryExec=spotify
Terminal=false
Type=Application
Categories=Audio;Music;Player;AudioVideo;
MimeType=x-scheme-handler/spotify;
" > ~/Desktop/spotify.desktop
chmod +x ~/Desktop/spotify.desktop

echo "[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
GenericName=Text Editor
Exec=/usr/share/code/code --unity-launch %F
Icon=code
Type=Application
StartupNotify=true
StartupWMClass=Code
Categories=Utility;TextEditor;Development;IDE;
MimeType=text/plain;inode/directory;
Keywords=vscode;

X-Desktop-File-Install-Version=0.22
" > ~/Desktop/code.desktop
chmod +x ~/Desktop/code.desktop

# Driver manager
mintdrivers

# Choose background folder
cinnamon-settings backgrounds

# Setup VPN
curl -sS https://integrity.st/download/Integrity_OpenVPN_v3.zip > ~/tmp.zip
unzip -j ~/tmp.zip 'Integrity_OpenVPN_v3/*' -d ~/.intergrity
rm ~/tmp.zip

chromium-browser --new-window https://integrity.st/support/ubuntu/ https://www.bahnhof.se/minasidor/logon
nm-connection-editor

# Restart cinnamon
nohup cinnamon --replace > /dev/null &
