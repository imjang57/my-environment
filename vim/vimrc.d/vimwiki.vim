" vimwiki settings
let g:vimwiki_list = [
    \{
    \   'path': '~/private/wiki',
    \   'syntax': 'markdown',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
    \{
    \   'path': '~/work/wiki',
    \   'syntax': 'markdown',
    \   'ext' : '.md',
    \   'diary_rel_path': '.',
    \},
\]
let g:vimwiki_markdown_link_ext = 1

" Make vimwiki less invasive.
"" turn off vimwiki's conceallevel.
let g:vimwiki_conceallevel = 0
"" prevents treating external markdown files as vimwiki markdown file.
let g:vimwiki_global_ext = 0
"" disable all vimwiki key mappings
let g:vimwiki_key_mappings = { 'all_maps': 0, }

nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>ws <Plug>VimwikiUISelect
nmap <LocalLeader>wt :VimwikiTable<CR>
nmap <LocalLeader>] <Plug>VimwikiNextLink
nmap <LocalLeader>[ <Plug>VimwikiPrevLink
nmap <LocalLeader>wr <Plug>VimwikiRenameFile
nmap <LocalLeader>wd <Plug>VimwikiDeleteFile
nmap <LocalLeader>wh :help vimwiki-mappings<CR>
nmap <CR> <Plug>VimwikiFollowLink
nmap <Localleader>' <Plug>VimwikiVSplitLink
nmap <LocalLeader>" <Plug>VimwikiSplitLink
nmap <C-S-CR> <Plug>VimwikiTabnewLink
nmap <Backspace> <Plug>VimwikiGoBackLink
nmap <LocalLeader>tl <Plug>VimwikiTableMoveColumnRight
nmap <LocalLeader>th <Plug>VimwikiTableMoveColumnLeft

