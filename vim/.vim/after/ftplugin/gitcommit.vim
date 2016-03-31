" Always jump to (0,0) when editing git commit messages
au BufWinEnter <buffer> normal! gg0

" On OS X, focus iTerm again when leaving the git commit buffer
if has("mac") && has("gui_running")
  au VimLeave <buffer> !open -a iTerm
endif
