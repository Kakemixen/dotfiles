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

" mapping
map <space> /
imap jj <Esc>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" this is defualt, just here as remionder
nmap \ <leader> 

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" CocList seems usable
nmap <leader><space> :CocList --number-select<CR>

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
    \'coc-python',
    \'coc-sh',
    \'coc-snippets',
    \'coc-json']
