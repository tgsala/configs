" ~/.vimrc

" .. general config .. "

"1) TAB = 2 espaços
set tabstop=2
set shiftwidth=2
set expandtab

"2) line numbers
set number

" -----------------------------------------------

" .. plugins first setup .. "

" vim-plug
" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" onedark
" https://github.com/joshdick/onedark.vim
if empty(glob('~/.vim/colors/onedark.vim'))
  silent !curl -fLo ~/.vim/colors/onedark.vim --create-dirs
    \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
endif
if empty(glob('~/.vim/autoload/onedark.vim'))
  silent !curl -fLo ~/.vim/autoload/onedark.vim --create-dirs
    \ https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim
endif

" -----------------------------------------------

" .. plugins .. "

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

call plug#end()

" -----------------------------------------------

" One Dark Theme
" https://github.com/joshdick/onedark.vim

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" ----------------------------------------------
