
" mapping
map <space> /
imap jj <Esc>

" settings
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set ruler

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
