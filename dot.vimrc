set tabstop=4
set shiftwidth=4
" Comments start with double quotes unlike any other thing. (It's retarded)
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme desert
"I cannot beleive that all this is necessary to prevent autocomments.
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType perl :noremap K :!perldoc <cword>
   \ <bar><bar> perldoc -f <cword><cr>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

augroup vimrcEx
	autocmd!
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\ exec "normal g`\"" |
				\ endif
	" Leave the return key alone when in command line windows, since
	" it's used
	" to run commands there.
	autocmd! CmdwinEnter * :unmap <cr>
	autocmd! CmdwinLeave * :call MapCR()
augroup END

set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0*

set laststatus=2

nmap <F8> :TagbarToggle<CR>

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

"I never use this
map q: :q



highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
