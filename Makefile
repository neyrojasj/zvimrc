DST_FOLDER=${HOME}
SOURCES := $(shell find . -name '*.vim')

HASVIM := $(shell command vim --version 2> /dev/null)
HASNVIM := $(shell command nvim --version 2> /dev/null)

all: install

# MAKE FILE RULE: INSTALL THE DEPENDCIES
# ======================================
.setup: setup.sh
	chmod 755 ./setup.sh
	./setup.sh "${DST_FOLDER}"

# MAKE FILE RULE: INSTALL THE VIM CONFIG RULE
# ===========================================
.install: .setup $(SOURCES)
	cp -r vimrc.vim ${DST_FOLDER}/.vimrc
	mkdir -p ${DST_FOLDER}/.vim
	mkdir -p ${DST_FOLDER}/.vim/zplugins
	cp -r zplugins/* ${DST_FOLDER}/.vim/zplugins/
ifdef HASVIM
	vim +'PlugInstall --sync' +qa
else
	@echo "Vim is not installed"
	exit 1
endif
ifdef HASNVIM
	cp -r vimrc.vim ${DST_FOLDER}/.config/nvim/init.vim
	nvim +'PlugInstall --sync' +qa
endif
	touch .install

install: .install

# MAKE FILE RULE: UNINSTALL THE VIM CONFIG RULE
# =============================================
.uninstall: ${DST_FOLDER}/.vimrc
	rm -rf ${DST_FOLDER}/.vim/zplugins
	rm ${DST_FOLDER}/.vimrc
	rm .install

uninstall: .uninstall

# MAKE FILE RULE: BACKUP DEPENDCY
# ===============================

# Make the bakup file
.backup: ${DST_FOLDER}/.vimrc
	cp ${DST_FOLDER}/.vimrc ${DST_FOLDER}/.vimrc_bkp
	touch .backup

backup: .backup

# MAKE FILE RULE: BACKUP RESTORE
# ==============================
.restore: ${DST_FOLDER}/.vimrc_bkp
	cp ${DST_FOLDER}/.vimrc_bkp ${DST_FOLDER}/.vimrc
	touch .restore

restore: .restore

# MAKE FILE RULE: CLEAN THE TMP FILES
# ===================================
clean:
	rm .setup .install

help:
	@echo "	make instal 		# Install the vimrc configuration"
	@echo "	make remove 		# Removes the vimrc configuration"
	@echo "	make bakup  		# Backup the current vimrc configuration"
	@echo "	make restore		# Restore the last vimrc configuration"


