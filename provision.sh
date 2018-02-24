cp .Xresources ~/
cp .bash_aliases ~/
cp .bashrc ~/
cp .gitignore ~/
cp .gitconfig ~/
cp .i3/ ~/
cp .screenrc ~/
cp .vimperatorrc ~/
cp .vimrc ~/
cp .zshrc ~/ 

# From https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create plugin dir if not exists
mkdir ~/.vim/plugged
