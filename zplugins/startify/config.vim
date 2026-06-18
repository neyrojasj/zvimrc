" Startify — fancy start screen

let g:startify_custom_header = [
      \ '  ██╗   ██╗██╗███╗   ███╗    ██╗██████╗ ███████╗',
      \ '  ██║   ██║██║████╗ ████║    ██║██╔══██╗██╔════╝',
      \ '  ██║   ██║██║██╔████╔██║    ██║██║  ██║█████╗  ',
      \ '  ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║██║  ██║██╔══╝  ',
      \ '   ╚████╔╝ ██║██║ ╚═╝ ██║    ██║██████╔╝███████╗',
      \ '    ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═╝╚═════╝ ╚══════╝',
      \ '',
      \ '              Your VS Code-like terminal IDE',
      \ ]

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Recent Files']                  },
      \ { 'type': 'dir',       'header': ['   Files in '. getcwd()]           },
      \ { 'type': 'sessions',  'header': ['   Sessions']                      },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                     },
      \ { 'type': 'commands',  'header': ['   Commands']                      },
      \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc'  },
      \ { 'z': '~/.zshrc'  },
      \ { 'b': '~/.bashrc' },
      \ ]

let g:startify_files_number         = 10
let g:startify_session_autoload     = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root  = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special      = 1

let g:startify_custom_footer = [
      \ '',
      \ '   <leader>n  File Explorer (NERDTree)   Ctrl+P  Quick Open',
      \ '   <leader>rg Search in Project          F4      Toggle Terminal',
      \ '   K          Hover Docs (CoC)           F12     Go to Definition',
      \ '   F2         Rename Symbol              F5      Undo Tree',
      \ '   <leader>   Show all keybindings       :help   Vim help',
      \ ]
