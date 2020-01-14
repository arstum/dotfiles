brew install tmux tmuxinator

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/Documents/back/.ssh ~/
ln -s ~/Documents/Git/github/dotfiles/.config/  ~/
ln -s ~/Documents/Git/github/dotfiles/.tmux.conf  ~/
ln -s ~/Documents/Git/github/dotfiles/.zshrc  ~/
#read -p 'df' a
pbcopy < ~/.ssh/github.pub
pbcopy < ~/.ssh/coding.pub
echo '
pbcopy < ~/.ssh/github.pub
https://github.com/settings/keys
pbcopy < ~/.ssh/coding.pub
https://dev.tencent.com/user/account/setting/keys
'
ssh-add -K ~/.ssh/*_rsa 

#test
