function! elixir#indent#debug(str)
  if exists("g:elixir_indent_debug") && g:elixir_indent_debug
    echom a:str
  endif
endfunction

" Returns 0 or 1 based on whether or not the text starts with the given
" expression and is not a string or comment
function! elixir#indent#starts_with(text, expr, lnum)
  let pos = match(a:text, '^\s*'.a:expr)
  if pos == -1
    return 0
  else
    " NOTE: @jbodah 2017-02-24: pos is the index of the match which is
    " zero-indexed. Add one to make it the column number
    if elixir#indent#is_string_or_comment(a:lnum, pos + 1)
      return 0
    else
      return 1
    end
  end
endfunction

" Returns 0 or 1 based on whether or not the text ends with the given
" expression and is not a string or comment
function! elixir#indent#ends_with(text, expr, lnum)
  let pos = match(a:text, a:expr.'\s*$')
  if pos == -1
    return 0
  else
    if elixir#indent#is_string_or_comment(a:lnum, pos)
      return 0
    else
      return 1
    end
  end
endfunction

" Returns 0 or 1 based on whether or not the text matches the given expression
function! elixir#indent#contains(text, expr)
  return a:text =~ a:expr
endfunction

" Returns 0 or 1 based on whether or not the given line number and column
" number pair is a string or comment
function! elixir#indent#is_string_or_comment(line, col)
  return synIDattr(synID(a:line, a:col, 1), "name") =~ '\%(String\|Comment\)'
endfunction

" Skip expression for searchpair. Returns 0 or 1 based on whether the value
" under the cursor is a string or comment
function! elixir#indent#searchpair_back_skip()
  " NOTE: @jbodah 2017-02-27: for some reason this function gets called with
  " and index that doesn't exist in the line sometimes. Detect and account for
  " that situation
  let curr_col = col('.')
  if getline('.')[curr_col-1] == ''
    let curr_col = curr_col-1
  endif
  return elixir#indent#is_string_or_comment(line('.'), curr_col)
endfunction

" DRY up searchpair calls
function! elixir#indent#searchpair_back(start, mid, end)
  let line = line('.')
  return searchpair(a:start, a:mid, a:end, 'bn', "line('.') == " . line . " || elixir#indent#searchpair_back_skip()")
endfunction

" DRY up searchpairpos calls
function! elixir#indent#searchpairpos_back(start, mid, end)
  let line = line('.')
  return searchpairpos(a:start, a:mid, a:end, 'bn', "line('.') == " . line . " || elixir#indent#searchpair_back_skip()")
endfunction

" DRY up regex for keywords that 1) makes sure we only look at complete words
" and 2) ignores atoms
function! elixir#indent#keyword(expr)
  return ':\@<!\<\C'.a:expr.'\>:\@!'
endfunction

" Start at the end of text and search backwards looking for a match. Also peek
" ahead if we get a match to make sure we get a complete match. This means
" that the result should be the position of the start of the right-most match
function! elixir#indent#find_last_pos(lnum, text, match)
  let last = len(a:text) - 1
  let c = last

  while c >= 0
    let substr = strpart(a:text, c, last)
    let peek = strpart(a:text, c - 1, last)
    let ss_match = match(substr, a:match)
    if ss_match != -1
      let peek_match = match(peek, a:match)
      if peek_match == ss_match + 1
        let syng = synIDattr(synID(a:lnum, c + ss_match, 1), 'name')
        if syng !~ '\%(String\|Comment\)'
          return c + ss_match
        end
      end
    end
    let c -= 1
  endwhile

  return -1
endfunction

function! elixir#indent#handle_top_of_file(_lnum, _text, prev_nb_lnum, _prev_nb_text)
  if a:prev_nb_lnum == 0
    return 0
  else
    return -1
  end
endfunction

function! elixir#indent#handle_following_trailing_do(lnum, text, prev_nb_lnum, prev_nb_text)
  if elixir#indent#ends_with(a:prev_nb_text, elixir#indent#keyword('do'), a:prev_nb_lnum)
    if elixir#indent#starts_with(a:text, elixir#indent#keyword('end'), a:lnum)
      return indent(a:prev_nb_lnum)
    else
      return indent(a:prev_nb_lnum) + &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_following_trailing_else(_lnum, _text, prev_nb_lnum, prev_nb_text)
  if elixir#indent#ends_with(a:prev_nb_text, elixir#indent#keyword('else'), a:prev_nb_lnum)
    return indent(a:prev_nb_lnum) + &sw
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_following_trailing_binary_operator(lnum, text, prev_nb_lnum, prev_nb_text)
  let binary_operator = '\%(=\|<>\|>>>\|<=\|||\|+\|\~\~\~\|-\|&&\|<<<\|/\|\^\^\^\|\*\)'

  if elixir#indent#ends_with(a:prev_nb_text, binary_operator, a:prev_nb_lnum)
    return indent(a:prev_nb_lnum) + &sw
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_pipe(lnum, text, prev_nb_lnum, prev_nb_text)
  if elixir#indent#starts_with(a:text, '|>', a:lnum)
    let match_operator = '\%(!\|=\|<\|>\)\@<!=\%(=\|>\|\~\)\@!'
    let pos = elixir#indent#find_last_pos(a:prev_nb_lnum, a:prev_nb_text, match_operator)
    if pos == -1
      return indent(a:prev_nb_lnum)
    else
      let next_word_pos = match(strpart(a:prev_nb_text, pos+1, len(a:prev_nb_text)-1), '\S')
      if next_word_pos == -1
        return indent(a:prev_nb_lnum) + &sw
      else
        return pos + 1 + next_word_pos
      end
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_end(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, elixir#indent#keyword('end'), a:lnum)
    let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('\%(do\|fn\)'), '', elixir#indent#keyword('end').'\zs')
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_comment(_lnum, text, prev_nb_lnum, _prev_nb_text)
  let starts_with_comment = match(a:text, '^\s*#')
  if starts_with_comment != -1
    return indent(a:prev_nb_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_else(lnum, text, prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, elixir#indent#keyword('else'), a:lnum)
    let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('if'), elixir#indent#keyword('else').'\zs', elixir#indent#keyword('end'))
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_rescue(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, elixir#indent#keyword('rescue'), a:lnum)
    let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('try'), elixir#indent#keyword('rescue').'\zs', elixir#indent#keyword('end'))
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_catch(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, elixir#indent#keyword('catch'), a:lnum)
    let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('try'), elixir#indent#keyword('catch').'\zs', elixir#indent#keyword('end'))
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_after(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, elixir#indent#keyword('after'), a:lnum)
    let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('receive\|try'), elixir#indent#keyword('after').'\zs', elixir#indent#keyword('end'))
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_close_sq_bracket(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, '\]', a:lnum)
    let pair_lnum = elixir#indent#searchpair_back('\[', '', '\]\zs')
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_close_curly_brace(lnum, text, _prev_nb_lnum, _prev_nb_text)
  if elixir#indent#starts_with(a:text, '}', a:lnum)
    let pair_lnum = elixir#indent#searchpair_back('{', '', '}\zs')
    return indent(pair_lnum)
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_starts_with_binary_operator(lnum, text, prev_nb_lnum, prev_nb_text)
  let binary_operator = '\%(=\|<>\|>>>\|<=\|||\|+\|\~\~\~\|-\|&&\|<<<\|/\|\^\^\^\|\*\)'

  if elixir#indent#starts_with(a:text, binary_operator, a:lnum)
    let match_operator = '\%(!\|=\|<\|>\)\@<!=\%(=\|>\|\~\)\@!'
    let pos = elixir#indent#find_last_pos(a:prev_nb_lnum, a:prev_nb_text, match_operator)
    if pos == -1
      return indent(a:prev_nb_lnum)
    else
      let next_word_pos = match(strpart(a:prev_nb_text, pos+1, len(a:prev_nb_text)-1), '\S')
      if next_word_pos == -1
        return indent(a:prev_nb_lnum) + &sw
      else
        return pos + 1 + next_word_pos
      end
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_cond_block(_lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('cond'), '', elixir#indent#keyword('end'))
  if pair_lnum
    if elixir#indent#contains(a:text, '->')
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_case_block(_lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('case'), '', elixir#indent#keyword('end'))
  if pair_lnum
    if elixir#indent#contains(a:text, '->')
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_fn(lnum, text, prev_nb_lnum, prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('fn'), '', elixir#indent#keyword('end'))
  if pair_lnum && pair_lnum != a:lnum
    if elixir#indent#contains(a:text, '->')
      return indent(pair_lnum) + &sw
    else
      if elixir#indent#ends_with(a:prev_nb_text, '->', a:prev_nb_lnum)
        return indent(a:prev_nb_lnum) + &sw
      else
        return indent(a:prev_nb_lnum)
      end
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_rescue(lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('rescue'), '', elixir#indent#keyword('end'))
  if pair_lnum
    if elixir#indent#ends_with(a:text, '->', a:lnum)
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_catch(lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('catch'), '', elixir#indent#keyword('end'))
  if pair_lnum
    if elixir#indent#ends_with(a:text, '->', a:lnum)
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_after(lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('after'), '', elixir#indent#keyword('end'))
  if pair_lnum
    if elixir#indent#ends_with(a:text, '->', a:lnum)
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_receive(lnum, text, _prev_nb_lnum, _prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back(elixir#indent#keyword('receive'), '', elixir#indent#keyword('\%(end\|after\)'))
  if pair_lnum
    if elixir#indent#ends_with(a:text, '->', a:lnum)
      return indent(pair_lnum) + &sw
    else
      return indent(pair_lnum) + 2 * &sw
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_data_structure(_lnum, _text, _prev_nb_lnum, _prev_nb_text)
  let innermost = -1

  " If in list...
  let pair_info = elixir#indent#searchpairpos_back('\[', '', '\]')
  let pair_lnum = pair_info[0]
  let pair_col = pair_info[1]
  if pair_lnum != 0 || pair_col != 0
    let pair_text = getline(pair_lnum)
    let substr = strpart(pair_text, pair_col, len(pair_text)-1)
    let indent_pos = match(substr, '\S')
    if indent_pos != -1
      let innermost = max([innermost, indent_pos + pair_col])
    else
      let innermost = max([innermost, indent(pair_lnum) + &sw])
    endif
  endif

  " TODO: @jbodah 2017-02-24: expand to be treated like []
  " If in tuple/map/struct...
  let pair_lnum = elixir#indent#searchpair_back('{', '', '}')
  if pair_lnum
    let innermost = max([innermost, indent(pair_lnum) + &sw])
  endif

  return innermost
endfunction

function! elixir#indent#handle_inside_parens(_lnum, _text, prev_nb_lnum, prev_nb_text)
  let pair_lnum = elixir#indent#searchpair_back('(', '', ')')
  if pair_lnum
    " Align indent (e.g. "def add(a,")
    let pos = elixir#indent#find_last_pos(a:prev_nb_lnum, a:prev_nb_text, '\w\+,')
    if pos == -1
      return 0
    else
      return pos
    end
  else
    return -1
  endif
endfunction

function! elixir#indent#handle_inside_generic_block(lnum, _text, prev_nb_lnum, prev_nb_text)
  let pair_lnum = searchpair(elixir#indent#keyword('\%(do\|fn\)'), '', elixir#indent#keyword('end'), 'b', "line('.') == ".a:lnum." || elixir#indent#is_string_or_comment(line('.'), col('.'))")
  if pair_lnum
    " TODO: @jbodah 2017-03-29: this should probably be the case in *all*
    " blocks
    if elixir#indent#ends_with(a:prev_nb_text, ',', a:prev_nb_lnum)
      return indent(pair_lnum) + 2 * &sw
    else
      return indent(pair_lnum) + &sw
    endif
  else
    return -1
  endif
endfunction
