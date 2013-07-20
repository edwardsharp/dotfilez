colorscheme ir_black
set expandtab
set tabstop=2
set shiftwidth=2
let perl_fold = 1
set bs=2
syntax on
set mouse=a
set number
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
