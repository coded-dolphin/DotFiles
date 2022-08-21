let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_custom_header = [
                \'  _________           ________     ',
                \'  \_   ___ \          \______ \    ',
                \'  /    \  \/   ______  |    |  \   ',
                \'  \     \____ /_____/  |    `   \  ',
                \'   \______  /         /_______  /  ',
                \'          \/                  \/   ',
                \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/bspwm/bspwmrc' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.config/zsh/.zshrc' },
            \ ]


let g:startify_session_autoload = 1


let g:startify_change_to_vcs_root = 1


let g:startify_fortune_use_unicode = 1


let g:startify_session_persistence = 1


let g:startify_enable_special = 0

function! s:filter_header(lines) abort
        let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
        let centered_lines = map(copy(a:lines),
            \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
        return centered_lines
    endfunction
    let g:startify_custom_header = s:filter_header(startify_custom_header)
