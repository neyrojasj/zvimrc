" Startify — start screen with recent files and quick reference

let g:startify_custom_header = [
      \ '  ██╗   ██╗██╗███╗   ███╗    ██╗██████╗ ███████╗',
      \ '  ██║   ██║██║████╗ ████║    ██║██╔══██╗██╔════╝',
      \ '  ██║   ██║██║██╔████╔██║    ██║██║  ██║█████╗  ',
      \ '  ╚██╗ ██╔╝██║██║╚██╔╝██║    ██║██║  ██║██╔══╝  ',
      \ '   ╚████╔╝ ██║██║ ╚═╝ ██║    ██║██████╔╝███████╗',
      \ '    ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═╝╚═════╝ ╚══════╝',
      \ '',
      \ ]

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   Recent Files'] },
      \ ]

let g:startify_files_number = 8

let g:startify_custom_footer = [
      \ '',
      \ '  ┌──────────────── Quick Reference ─────────────────┐',
      \ '  │                                                    │',
      \ '  │  SEARCH                                           │',
      \ '  │   /pattern    search in file                      │',
      \ '  │   n / N       next / previous match               │',
      \ '  │   :noh        clear search highlight              │',
      \ '  │   Ctrl+P      search and open files               │',
      \ '  │                                                    │',
      \ '  │  WINDOWS                                          │',
      \ '  │   Ctrl+H / L  move to left / right window         │',
      \ '  │   Ctrl+J / K  move to lower / upper window        │',
      \ '  │   Ctrl+B      toggle file explorer                │',
      \ '  │                                                    │',
      \ '  │  COPILOT                                          │',
      \ '  │   ,cp         open Copilot suggestions panel      │',
      \ '  │   Tab         accept inline suggestion            │',
      \ '  │   :Copilot setup   authenticate Copilot           │',
      \ '  │                                                    │',
      \ '  └────────────────────────────────────────────────────┘',
      \ ]

let g:startify_session_autoload     = 0
let g:startify_change_to_vcs_root  = 1
let g:startify_enable_special      = 0

