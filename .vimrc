" =======================================
" Initially based on/forked from: Jeremy Mack (@mutewinter)
" [http://github.com/luan/vimfiles]
" Maintained By: Luan Santos (GitHub: @luan)
" =======================================

silent! source ~/.vimrc.local.before

runtime! Plug.vim

runtime! config/basic.vim
runtime! config/bindings.vim
runtime! config/colors.vim
runtime! config/paste.vim

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

runtime! config/plugin/ack.vim
runtime! config/plugin/airline.vim
runtime! config/plugin/ale.vim
runtime! config/plugin/autoformat.vim
runtime! config/plugin/better-whitespace.vim
runtime! config/plugin/fugitive.vim
runtime! config/plugin/livedown.vim
runtime! config/plugin/goyo.vim
runtime! config/plugin/multicursor.vim
runtime! config/plugin/ncm.vim
runtime! config/plugin/nerdtree.vim
runtime! config/plugin/signify.vim
runtime! config/plugin/tagbar.vim
runtime! config/plugin/tcomment.vim
runtime! config/plugin/ultisnips.vim
runtime! config/plugin/undotree.vim

if has('gui_running')
  runtime! config/plugin/ctrlp.vim
else
  runtime! config/plugin/fzf.vim
end

" ----------------------------------------
" Language Configuration
" ----------------------------------------

runtime! config/lang/c.vim
runtime! config/lang/crontab.vim
runtime! config/lang/elm.vim
runtime! config/lang/golang.vim
runtime! config/lang/javascript.vim
runtime! config/lang/markdown.vim
runtime! config/lang/ruby.vim
runtime! config/lang/rust.vim
runtime! config/lang/vue.vim
runtime! config/lang/yaml.vim

" ----------------------------------------
" Lib load path
" ----------------------------------------

runtime! lib/functions.vim
runtime! lib/autocommands.vim
runtime! lib/watchforchanges.vim

silent! source ~/.vimrc.local

" ----------------------------------------
" Custom configuration
" ----------------------------------------
vmap K $%
noremap <c-k> $%
:cmap noh noh<bar>GoCoverageClear

noremap fs :GoFillStruct<CR>
noremap goc :GoCoverage<CR>
noremap gocc :GoCoverageClear<CR>

set cursorline

highlight LineNr guifg=#808080
highlight CursorLineNr guifg=#FFD700 guibg=#696969 gui=NONE

set clipboard+=unnamed
nmap <silent> ZZ :bp\|bd#<CR>

" nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:ale_fixers = {}
let g:airline_extensions = ['branch', 'netrw', 'ale', 'tabline']
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters                  = {
            \ 'javascript': ['eslint'],
    \}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1

let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim  = 1
let g:neoformat_enabled_javascript = ['prettier-eslint', 'prettier', 'eslint']

autocmd BufWritePre *.js Neoformat

" set racer binary path (autocomplete tool)
let g:deoplete#sources#rust#racer_binary='/Users/axm0511/.cargo/bin/racer'

let g:deoplete#sources#rust#rust_source_path='/Users/axm0511/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:deoplete#sources#rust#show_duplicates=1

" let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20

nmap <buffer> K  <plug>DeopleteRustShowDocumentation
