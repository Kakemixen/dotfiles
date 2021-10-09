" settings
set encoding=utf-8
set tabstop=4
set shiftwidth=4
" set expandtab
set list
set ruler
set hidden "Appearently necessary for coc.nvom
set cmdheight=2 "More space for messages
set shortmess+=c "Don't pass messages to ins-completion-menu
set signcolumn=yes "always show diagnostics column
set nowrap
set wildmenu "yes
set clipboard+=unnamedplus

" mapping
imap jj <Esc>
nnoremap <C-J> i<CR><Esc>l

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use c-space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh() 

" Make <CR> auto-select the first completion item
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gy <Plug>(coc-type-definition) "Not supported in clangd
" nmap <silent> gi <Plug>(coc-implementation) "Not supported in clangd

" vim-ripgrep
let g:rg_binary = "rg"
let g:rg_command = g:rg_binary . ' --vimgrep --smart-case'

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" fzf integration - needed for fzf.vim
" set rtp+=/sbin/fzf
set rtp+=system("which fzf")

command! Find call fzf#run(fzf#wrap({'options': '--reverse --multi --ansi 
                    \--preview="fzf_preview.sh {}"'}))

" fzf on buffers
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FindBuffer call fzf#run(fzf#wrap({
\   'source':  reverse(<sid>buflist()),
\   'options': '--reverse --ansi 
                    \--preview="fzf_preview.sh {}"',
\   'sink':    function('<sid>bufopen'),
\ }))


function! s:rgopen(e)
	let parts = split(a:e, ":")
	exec "edit +" . parts[1] . " " . parts[0]
endfunction

function! RgFzf(query)
	let rg_prefix="rg --vimgrep --color=always --smart-case"
	if empty(a:query)
		let query=expand("<cword>")
	else
		let query=a:query
	endif
	call fzf#run(fzf#wrap({
			\'source': rg_prefix . " " . query,
			\'sink': function('s:rgopen'),
			\'options': '--disabled --ansi --multi --reverse 
				\ --query=' . query . '
				\ --bind="change:reload:' . rg_prefix . ' {q} || true"
				\ --preview="fzf_preview.sh {}"'}))
endfunction

command! -nargs=* -complete=file FindLine call RgFzf(<q-args>)

" start FZF on files if started without arguments
function FuzzySearchIfNew()
    if @% == ""
        " No filename for current buffer
        call fzf#run(fzf#wrap({'options': '--reverse --multi 
                    \--preview="bat --color=always --style=numbers {}"'}))
    " elseif filereadable(@%) == 0 " File doesn't exist yet
    " elseif line('$') == 1 && col('$') == 1 " File is empty
    endif
endfunction
autocmd VimEnter * call FuzzySearchIfNew()

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

""" leader keybinds
let mapleader = " "

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fo  <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)

nmap <silent> <leader>sh :CocCommand clangd.switchSourceHeader<CR>

" CocList seems usable
nmap <leader><tab> :CocList --number-select<CR>

nmap <silent> <leader>ef :Find<CR>
nmap <silent> <leader>eb :FindBuffer<CR>
nmap <silent> <leader>eg :FindLine<CR>
nmap <silent> <leader>rg :Rg<CR>

"Line numbers
set number 
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber
augroup END

" using the colours
colorscheme noctu

" coc extensions
let g:coc_global_extensions = [
    \'coc-clangd',
    \'coc-jedi',
    \'coc-snippets',
    \'coc-json']
