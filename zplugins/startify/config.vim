" Startify configuration for a fancy start screen

" Header
let g:startify_custom_header = [
      \ '   ╦  ╦╦╔╦╗  ╦╔╦╗╔═╗',
      \ '   ╚╗╔╝║║║║  ║ ║║║╣ ',
      \ '    ╚╝ ╩╩ ╩  ╩═╩╝╚═╝',
      \ '',
      \ '   [ Your Modern IDE Setup ]',
      \ ]

" Lists
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent Files']            },
      \ { 'type': 'dir',       'header': ['   Recent Files in '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Bookmarks (customize these to your needs)
let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
      \ { 'z': '~/.zshrc' },
      \ { 'b': '~/.bashrc' },
      \ ]

" Number of recent files
let g:startify_files_number = 10

" Update session automatically
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

" Custom footer
let g:startify_custom_footer = [
      \ '',
      \ '   Press <leader>n to open file explorer',
      \ '   Press <C-p> to search files with FZF',
      \ ]

" Enable special buffer
let g:startify_enable_special = 1
