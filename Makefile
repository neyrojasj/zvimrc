DST_FOLDER=${HOME}
SOURCES := $(shell find . -name '*.vim')

HASNVIM := $(shell command nvim --version 2> /dev/null)

all: install

# MAKE FILE RULE: INSTALL THE DEPENDCIES
# ======================================
.setup: setup.sh
	chmod 755 ./setup.sh
	./setup.sh "${DST_FOLDER}"
	touch .setup

# MAKE FILE RULE: INSTALL THE VIM CONFIG RULE
# ===========================================
.install: .setup $(SOURCES)
	cp -r vimrc.vim ${DST_FOLDER}/.vimrc
	mkdir -p ${DST_FOLDER}/.zplugins
	cp -r zplugins/* ${DST_FOLDER}/.zplugins/
	vim +'PlugInstall --sync' +qa
ifdef HASNVIM
	cp -r vimrc.vim ${DST_FOLDER}/.config/nvim/init.vim
	nvim +'PlugInstall --sync' +qa
endif
	touch .install

install: .install

# MAKE FILE RULE: UNINSTALL THE VIM CONFIG RULE
# =============================================
.unistall: ${DST_FOLDER}/.vimrc
	rm -rf ${DST_FOLDER}/.zplugins
	rm ${DST_FOLDER}/.vimrc

uinstall: .uinstall

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


