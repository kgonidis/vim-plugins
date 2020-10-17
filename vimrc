" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" To ignore plugin indent changes, instead use:
filetype plugin on

colorscheme codedark
set background=dark
set t_Co=256
" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set expandtab
set shiftwidth=4
set softtabstop=4
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number
set relativenumber

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100


" Fix funny characters in vim
let &t_TI = ""
let &t_TE = ""

" Map mouse to vim
set mouse=a

" Set leader key
let mapleader = ";"


" #Plugins

" ##ADD PACKAGES

packadd nerdtree-git-plugin
packadd vim-devicons
packadd nerdtree
packadd coc-nvim
packadd fzf
packadd fzf-vim
packadd fzf-devicon
packadd lh-vim-lib
packadd nerdcommenter
packadd tagbar
packadd vim-airline
packadd vim-airline-themes
packadd vim-code-dark
packadd vim-dadbod
packadd vim-fugitive
packadd vim-instant-markdown
packadd vim-pydocstring
packadd vim-snippets

" ##ADD PACKAGES END

" ##COC-NVIM

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
      " \ pumvisible() ? coc#_select_confirm() :


inoremap <silent><expr> <TAB>
      "\ pumvisible() ? _select_confirm() :
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use <C-l> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-e> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'

augroup pyint
    au!
    au FileType python call coc#config('python', {'pythonPath': '/usr/bin/python3'})
augroup END

" ##COC-NVIM END


" ##Vimspector

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector
sign define vimspectorPC         text=▶▶ texthl=Error linehl=CursorLine
sign define vimspectorPCBP       text=●▶  texthl=Error linehl=CursorLine
nnoremap <F1> :call vimspector#Reset()<CR>

" ##Vimspector END


" ##Pydocstring

let g:pydocstring_doq_path="/home/kiron/.local/bin/doq"
let g:pydocstring_formatter = 'numpy'

" ##Pydocstring END


" ##Tagbar

nnoremap <silent><leader>tb :TagbarOpenAutoClose<CR>
let g:tagbar_position = 'topleft vertical'
let g:tagbar_width = 50

" ##Tagbar END


" ##Airline

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
"let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
"let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
"let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#ignore_bufadd_pat = 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme = 'codedark'

" ##Airline END


" ##NERDCommenter
vnoremap <C-_> :call NERDComment('x', 'toggle')<CR>
nnoremap <C-_> :call NERDComment('n', 'toggle')<CR>
"au VimEnter * nnoremap <leader>cc :call NERDComment('n', 'toggle')<CR>
" ##NERDCommenter END


" ##FZF

nnoremap <leader>ff :FilesWithDevicons<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>

" ##FZF END

" ##NERDTree

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :" ",
                \ 'Ignored'   :'☒',
                \ 'Clean'     :" ",
                \ 'Unknown'   :'?',
                \ }
"let NERDTreeDirArrowExpandable = " "
"let NERDTreeDirArrowExpandable = ""
"let NERDTreeDirArrowCollapsible = " "
"let NERDTreeDirArrowCollapsible = ""
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1
let NERDTreeQuitOnOpen=1
let NERDTreeNodeDelimiter = ""
let g:NERDTreeWinSize=60

nnoremap <silent><leader>nt :NERDTreeToggle<CR>

" ##NERDTree END


" ##vim-devicons
let g:sol = {
    \"gui": {
            \"base03": "#002b36",
            \"base02": "#073642",
            \"base01": "#586e75",
            \"base00": "#657b83",
            \"base0": "#839496",
            \"base1": "#93a1a1",
            \"base2": "#eee8d5",
            \"base3": "#fdf6e3",
            \"yellow": "#FFAF00",
            \"orange": "#cb4b16",
            \"red": "#dc322f",
            \"magenta": "#d33682",
            \"violet": "#6c71c4",
            \"blue": "#268bd2",
            \"cyan": "#2aa198",
            \"green": "#719e07"
    \},
    \"cterm": {
            \"base03": 8,
            \"base02": 0,
            \"base01": 10,
            \"base00": 11,
            \"base0": 12,
            \"base1": 14,
            \"base2": 7,
            \"base3": 15,
            \"yellow": 214,
            \"orange": 9,
            \"red": 1,
            \"magenta": 5,
            \"violet": 13,
            \"blue": 4,
            \"cyan": 6,
            \"green": 2
    \}
\}

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif
augroup devicons
    autocmd!
    autocmd FileType nerdtree setlocal nolist
    autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
    autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
    autocmd FileType nerdtree setlocal conceallevel=3
    autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END
function! DeviconsColors(config)
    let colors = keys(a:config)
    augroup devicons_colors
        autocmd!
        for color in colors
            if color == 'normal'
                exec 'autocmd FileType fzf,ctrlp*,nerdtree,startify if &background == ''dark'' | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                    \ 'else | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                    \ 'endif'
            elseif color == 'emphasize'
                exec 'autocmd FileType fzf,ctrlp*,nerdtree,startify if &background == ''dark'' | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                    \ 'else | '.
                    \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                    \ 'endif'
            else
                exec 'autocmd FileType fzf,ctrlp*,nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
            endif
            exec 'autocmd FileType fzf,ctrlp*,nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
        endfor
    augroup END
endfunction

let g:devicons_colors = {
    \'normal': ['', ''],
    \'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
    \'yellow': ['', '', '', '', '', '', '✚'],
    \'orange': ['', '', '', 'λ', '', ''],
    \'red': ['', '', '', '', '', '', '', '', '', '✹', '➜', '═', '✖',''],
    \'magenta': [''],
    \'violet': ['', '', '', ''],
    \'blue': ['', '', '', '', '', '', '', '', '', '', '', '','','✭','☒'],
    \'cyan': ['', '', '', ''],
    \'green': ['', '', '', '', '✔︎']
\}
call DeviconsColors(g:devicons_colors)

" ##vim-devicons END


" ##fzf

" ##fzf


" #Plugins END


" #Functions

function OpenBuffer(index)
    let blist = getbufinfo({'buflisted': 1})
    let bnr = blist[a:index-1].bufnr
    execute "b".bnr
endfunction


" ##PSQL

function ReadBuf()
    let lines = getline(1,'$')
    let bnr = bufnr()
    quit
    exe "bd!".bnr
    let ln = join(lines)
    exe "DB postgresql://kiron:rtuser123@10.200.5.1:5432/nyct_main ". ln
    call FindPsqlBuffer()
endfunction

function FindPsqlBuffer()
    let buffers = getbufinfo()
    for b in buffers
        if has_key(b['variables'], 'db')
            call win_gotoid(win_findbuf(b['bufnr'])[0])
            break
        endif
    endfor
endfunction

augroup psqlenter
    au!
    autocmd FileType postgresql.sql imap <silent><C-@> <ESC>:call ReadBuf()<CR>
    autocmd FileType postgresql.sql nmap <silent><C-@> :call ReadBuf()<CR>
augroup END

function Psql()
    botright 10 new
    setfiletype postgresql.sql
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    startinsert
endfunction

nnoremap <leader>sq :call Psql()<CR>

" ##PSQL END


" #Functions


" #Autocommand

 "Remove Terminal from local buffer list
"autocmd TerminalOpen * if bufwinnr('') > 0 | setlocal nobuflisted | endif

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"

" #Autocommand END


" #Command

command -nargs=* FixTr :%s/\s\+$//e
command -nargs=* Term :term ++curwin
" # Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>
cabbrev th tab help

" #Command END


" #Other Keyboard Remappings

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


" Tab/S-Tab cycles buffers, leader number goes to buffer num
autocmd VimEnter * nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>1 :call OpenBuffer(1)<CR>
nnoremap <leader>2 :call OpenBuffer(2)<CR>
nnoremap <leader>3 :call OpenBuffer(3)<CR>
nnoremap <leader>4 :call OpenBuffer(4)<CR>
nnoremap <leader>5 :call OpenBuffer(5)<CR>
nnoremap <leader>6 :call OpenBuffer(6)<CR>
nnoremap <leader>7 :call OpenBuffer(7)<CR>
nnoremap <leader>8 :call OpenBuffer(8)<CR>
nnoremap <leader>9 :call OpenBuffer(9)<CR>

" Window navigation
imap jj <Esc>
nnoremap <leader>hh <C-w><Left>
nnoremap <leader>jj <C-w><Down>
nnoremap <leader>kk <C-w><Up>
nnoremap <leader>ll <C-w><Right>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>


" Writing and Closing Windows
nnoremap <expr> <leader>qq exists("g:vimide_loaded") ?
    \':call vimide#quit()<CR>' : ':qa<CR>'
nnoremap <leader>qa :qa!<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>tc :tabc<CR>

" New line the escape
nnoremap O o<Esc>

"No highlight
nnoremap <leader>nh :nohl<CR>

"Surround with
nnoremap <leader>sw ysiw

"Toggle relative number
nnoremap <leader>rn :set rnu!<CR>

"Yank to clipboard
nnoremap Y "+y
nnoremap YY "+yy

nnoremap <leader>ds :Pydocstring<CR>
nnoremap <leader>vr :e ~/.vimrc<CR>
nnoremap <leader>so :source ~/.vimrc<CR>
nnoremap <leader>gp :Gpush<CR>

" Keep highlight when shifting tabs
vnoremap < <gv
vnoremap > >gv

"Yank to clipboard
vnoremap Y "+y

"Escape in terminal
tmap jj <C-\><C-n>
tmap <C-t>t <C-\><C-n>:VimideToggle botbar<CR>
tmap <C-t><C-t> <C-\><C-n>:VimideToggle botbar<CR>

" #Other Keyboard Remappings END


" Load helptags
":helptags ALL

