" settings
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set hidden "Appearently necessary for coc.nvom
set cmdheight=2 "More space for messages
set shortmess+=c "Don't pass messages to ins-completion-menu
set signcolumn=yes "always show diagnostics column
set nowrap
set wildmenu "yes

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim-picker
let g:picker_selector_executable = 'fzy'
let g:picker_height = 20

" vim-ripgrep
let g:rg_binary = "rg"
let g:rg_command = g:rg_binary . ' --vimgrep --smart-case'

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" fzf integration - needed for fzf.vim
" set rtp+=/sbin/fzf
set rtp+=system("which fzf")

command! Find call fzf#run(fzf#wrap({'options': '--reverse --multi --ansi 
                    \--preview="bat --color=always --style=numbers {}"'}))

function! RgFzf(query)
    let rg_prefix="rg --vimgrep --color=always --smart-case"
    call fzf#run(fzf#wrap({
            \'source': rg_prefix . " " . a:query,
            \'options': '--disabled --ansi --multi --reverse 
                \--bind="change:reload:' . rg_prefix . ' {q} || true"
                \--preview="bat --color=always $(cut -d: -f1 <<<{})"'}))
endfunction

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
nmap <silent> <leader>eg :call RgFzf("")<CR>
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
    \'coc-sh',
    \'coc-snippets',
    \'coc-json']
