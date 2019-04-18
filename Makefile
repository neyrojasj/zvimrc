DST_FOLDER=${HOME}

all:
	echo "\
make instal # Install the vimrc configuration\
make remove # Removes the vimrc configuration\
make bakup # Backup the current vimrc configuration\
make restore # Restore the last vimrc configuration"

.setup:
	curl -fLo ${DST_FOLDER}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	touch .setup

install: .setup
	cp -r vimrc.vim ${DST_FOLDER}/.vimrc
	mkdir -p ${DST_FOLDER}/.zplugins
	cp -r zplugins/* ${DST_FOLDER}/.zplugins/
	vim +'PlugInstall --sync' +qa

remove:
	rm -rf ${DST_FOLDER}/.zplugins
	rm ${DST_FOLDER}/.vimrc

backup:
	cp ${DST_FOLDER}/.vimrc ${DST_FOLDER}/.vimrc_bkp

restore:
	cp ${DST_FOLDER}/.vimrc_bkp ${DST_FOLDER}/.vimrc
