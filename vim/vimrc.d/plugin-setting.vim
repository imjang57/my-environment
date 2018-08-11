""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim settings
"" check details at :help ctrlp-commands and :help ctrlp-extensions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>' "invok CtrlP by mapped key
let g:ctrlp_cmd = 'CtrlP' "invok CtrlP by command
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|vendor$',
    \ 'file': '\v\.(exe|so|dll|png|jpg|jpeg|class)$'
    \ }
" Fuzzy Finding key sequences using CtrlP
map <leader>f<CR> :CtrlPBuffer<CR>
map <leader>ff<CR> :CtrlP<CR>
map <leader>fff<CR> :CtrlP .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pylint', 'pep8']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++17 -Wall -Wextra -Wpedantic"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
