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
set shiftwidth=2
set softtabstop=2
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

" Set gui font

if has("gui_running")
  set guifont=DroidSansMono\ Nerd\ Font\ 12
endif


" #Plugins

" ##ADD PACKAGES

"packadd nerdtree-git-plugin
packadd vim-gitgutter
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
packadd vim-which-key
packadd vim-nerdtree-syntax-highlight
packadd vim-lastplace
packadd MatchTagAlways
packadd vista
packadd typescript-vim
packadd vim-jsx-typescript
packadd omnisharp-vim
packadd vim-ipython-cell
packadd vim-slime

" ##ADD PACKAGES END

" ##COC-NVIM

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
      " \ pumvisible() ? coc#_select_confirm() :
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-css',
      \ 'coc-db',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-omnisharp',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-sql',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ ]

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
nmap <silent> gf <Plug>(coc-references)

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

nmap <leader>qf <Plug>(coc-fix-current)

augroup pyint
    au!
    au FileType python call coc#config('python', {'pythonPath': '/usr/bin/python3'})
augroup END

nnoremap <leader>rr :CocCommand prettier.formatFile<CR>
nnoremap gr :call CocActionAsync('rename')<CR>
nnoremap ga :CocAction<CR>

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

let g:tagbar_position = 'topleft vertical'
let g:tagbar_width = 50
let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}

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
                \ 'Dirty'     :"",
                \ 'Ignored'   :'☒',
                \ 'Clean'     :" ",
                \ 'Unknown'   :'?',
                \ }
"let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowExpandable = ""
"let NERDTreeDirArrowCollapsible = " "
let NERDTreeDirArrowCollapsible = ""
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1
let NERDTreeQuitOnOpen=1
"let NERDTreeNodeDelimiter = ""
let g:NERDTreeWinSize=60

nnoremap <silent><leader>nt :NERDTreeToggle<CR>

" ##NERDTree END


" ##vim-nerdtree-syntax-highlight
let g:WebDevIconsDefaultFolderSymbolColor = "FFAF00"
" ##vim-nerdtree-syntax-highlight END


" ##fzf

" ##fzf


" ##vim-fugitive

function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        vertical topleft Gstatus | vertical resize 50
    endif
endfunction
command GstatusToggle :call ToggleGStatus()
nnoremap <leader>gt :GstatusToggle<CR>

" ##vim-fugitive END


" ##MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'typescriptreact' : 1,
    \}
" END ##MatchTagAlways

" ##VISTA

let g:vista_close_on_jump = 1
nnoremap <silent><leader>tb :Vista coc<CR>

" ##VISTA END

" ##OMNISHARP

autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>

" ##OMNISHARP END

" ## IPYTHON

let g:slime_target = "tmux"
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-left}' }
let g:slime_dont_ask_default = 1
" ##

" ## VIM-INSTANT_MARKDOWN
"
" ## VIM-INSTANT_MARKDOWN END
let g:instant_markdown_logfile='/home/kiron/.instant_markdown.log'
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
    let cn = "DB postgresql://". $PSQL_USER . ":" . $PSQL_PWD . "@" .
        \$PSQL_HOST . ":" . $PSQL_PORT . "/nyct_main " . ln
    exe cn
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

" Close other buffers
function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction
nnoremap <leader>sq :call Psql()<CR>

" ##PSQL END

" Quit Terminals
function QuitTerminals()
    for b in getbufinfo()
        if getbufvar(b['bufnr'], '&buftype') == 'terminal'
            exe 'bd! '.b['bufnr']
        endif
    endfor
endfunction


" Remove Terminal from local buffer list
function UnlistTerminal()
    for b in getbufinfo()
        if getbufvar(b['bufnr'], '&buftype') == 'terminal'
            call setbufvar(b['bufnr'], '&buflisted', 0)
        endif
    endfor
endfunction

autocmd TerminalOpen * call UnlistTerminal()

" Go to css tag
function GoToCss()
    setlocal iskeyword+=-
    let w = expand('<cword>')
    exe 'tag .'.w
    setlocal iskeyword-=-
endfunction
nnoremap gc :call GoToCss()<CR>

" #Functions END


" #Autocommand

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"

autocmd FileType typescriptreact setlocal autoindent

" #Autocommand END


" #Command

command -nargs=* FixTr :%s/\s\+$//e
command -nargs=* Term :term ++curwin
" # Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>
cabbrev th tab help

" Close other buffers
command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

" #Command END


" #Keyboard Remappings

nnoremap <silent> <leader> :WhichKey '<leader>'<CR>

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Map <C-J> to line break in normal
nnoremap <NL> i<CR><Esc>

" Tab/S-Tab cycles buffers, leader number goes to buffer num
autocmd VimEnter * nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>co :BufOnly<CR>

" Window navigation
imap jj <Esc>
nnoremap <leader>hh <C-w><Left>
nnoremap <leader>jj <C-w><Down>
nnoremap <leader>kk <C-w><Up>
nnoremap <leader>ll <C-w><Right>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>
nnoremap <leader><Tab> :tabn<CR>
nnoremap <leader><S-Tab> :tabp<CR>


" Writing and Closing Windows
nnoremap <leader>qq :call QuitTerminals() \| qa<CR>
nnoremap <leader>qa :qa!<CR>
nnoremap <leader>sa :w<CR>
nnoremap <leader>qw :q<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tab new<CR>

" New line the escape
nnoremap O o<Esc>

"No highlight
nnoremap <leader>nh :nohl<CR>

"Surround with
nnoremap <leader>sw ysiw

"Toggle relative number
nnoremap <leader>rn :set rnu!<CR>

"Yank and paste clipboard
nnoremap Y "+y
nnoremap YY "+yy
nnoremap P "+p

"Polymer Serve website
nnoremap <leader>po :terminal ++hidden polymer serve<CR>

nnoremap <leader>ds :Pydocstring<CR>
nnoremap <leader>vr :e ~/.vimrc<CR>
nnoremap <leader>so :source ~/.vimrc<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>tt :exe "botright terminal" \| resize 40<CR>

" Keep highlight when shifting tabs
vnoremap < <gv
vnoremap > >gv

"Yank to clipboard
vnoremap Y "+y

"Escape in terminal
tmap jj <C-\><C-n>

"IPython
nnoremap <C-e> :IPythonCellExecuteCell<CR>
nnoremap <C-n> :IPythonCellNextCell<CR>
nnoremap <C-p> :IPythonCellPrevCell<CR>
nnoremap <C-l> :IPythonCellClear<CR>

" #Keyboard Remappings END


" Load helptags
:helptags ALL


