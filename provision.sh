cp .Xresources ~/
cp .bash_aliases ~/
cp .bashrc ~/
cp .gitignore ~/
cp .gitconfig ~/
cp .screenrc ~/
cp .vimperatorrc ~/
cp .vimrc ~/
cp .zshrc ~/ 
cp -r .i3/ ~/

# From https://github.com/junegunn/vim-plug
[ -f ~/.vim/autoload/plug.vim ] || \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create plugin dir if not exists
[ -d ~/.vim/plugged ] || mkdir ~/.vim/plugged
