if exists('g:loaded_deoplete_jedi')
  finish
endif
let g:loaded_deoplete_jedi = 1


let g:deoplete#sources#go#align_class =
      \ get( g:, 'deoplete#sources#go#align_class', 0 )

let g:deoplete#sources#jedi#enable_cache =
      \ get(g:, 'deoplete#sources#jedi#enable_cache', 1)

let g:deoplete#sources#jedi#short_types =
      \ get(g:, 'deoplete#sources#jedi#short_types', 0)

let g:deoplete#sources#jedi#statement_length =
      \ get(g:, 'deoplete#sources#jedi#statement_length', 0)

let g:deoplete#sources#jedi#debug_enabled =
      \ get(g:, 'deoplete#sources#jedi#debug_enabled', 0)
