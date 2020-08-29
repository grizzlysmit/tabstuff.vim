"Author: Francis Grizzly Smit
" License:  GPLv3 or above
"Created: 2015-12-05

if exists('g:loaded_tabstuff')
    finish
endif
let g:loaded_tabstuff = 1


call tabutils#init()

call tabutils#toolbar()

command TabNewFile call TabNewFile()

call tabutils#menus()

