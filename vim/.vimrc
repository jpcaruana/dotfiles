" This must be first, because it changes other options as side effect
set nocompatible

" coloration syntaxique
syn on

" met les buffer en arriere plan plutot que de les fermer
set hidden

"Détection du type de fichier pour l'indentation
"if has("autocmd")
"  filetype indent on
"endif

" Recherche en minuscule -> indépendante de la casse, une majuscule -> stricte
set smartcase
" Déplace le curseur au fur et a mesure qu'on tape une recherche
set incsearch
" Met en évidence TOUS les résultats d'une recherche
set hlsearch
" Déplacer le curseur quand on écrit un (){}[] (attention il ne s'agit pas du highlight)
set showmatch

" Indispensable pour ne pas tout casser avec ce qui va suivre
"set preserveindent
" indentation automatique
"set autoindent
" Largeur de l'autoindentation
"set shiftwidth=4
" Arrondit la valeur de l'indentation
"set shiftround
" Largeur du caractère tab
"set tabstop=4
" Largeur de l'indentation de la touche tab
"set softtabstop=4

" highlighter la ligne courante
set cursorline

" activer les numéros de lignes dans la marge :
"set number

" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Toujours laisser des lignes visibles (içi 3) au dessus/en dessous du curseur quand on
" atteint le début ou la fin de l'écran :
set scrolloff=3

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class

" no strange vim backup files
set nobackup
set noswapfile

" display file encoding
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

" desactiver l'intelligence de vim pour des gros copier/coller
set pastetoggle=<F2>

" Envoyer le curseur sur la ligne suivante/précédente après usage des flèches droite/gauche en bout de ligne :
set whichwrap=<,>,[,]

set rtp+=$GOROOT/misc/vim

" shebang automatique lors de l'ouverture nouveau d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
:autocmd BufNewFile,BufRead *.py set softtabstop=4 expandtab 

set ts=2

" associations de fichiers
au BufNewFile,BufRead buildfile setlocal ft=ruby


" Tell vim to remember certain things when we exit                                                                                                           
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

set runtimepath^=~/.vim/bundle/ctrlp.vim
