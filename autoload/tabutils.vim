"Author: Francis Grizzly Smit
" License:  GPLv3
"Created: 2015-12-07

if exists("g:loaded_autoload_tabutils")
    finish
endif
let g:loaded_autoload_tabutils = 1

let s:sfile = expand('<sfile>:p')
"call vlutils#Init()
"let s:os = vlutils#os

function! Joinpath(a, ...) "{{{2
    if has('win32') || has('win64') || has('win32unix')
       let pathsep = '\'
    else
       let pathsep = '/'
    endif
    let path = a:a
    for b in a:000
        if b =~# pathsep
            let path = b
        elseif path ==# '' || path =~# pathsep .'$'
            let path .= b
        else
            let path .= pathsep . b
        endif
    endfor
    return path
endfunction
function! PosixPath(sPath) "{{{2
    if has('win32') || has('win64') || has('win32unix')
        return substitute(a:sPath, '\', '/', 'g')
    else
        return a:sPath
    endif
endfunction
let g:tabstuf_dir = Joinpath(fnamemodify(fnamemodify(s:sfile, ':h'), ':h'), '_tabstuff')
let g:tabstuff_bitmapsdir = Joinpath(tabstuf_dir, 'bitmaps')

function tabutils#init()
    return 1
endfunction

let rtp_bak = &runtimepath
let &runtimepath = PosixPath(g:tabstuf_dir) . ',' . &runtimepath
"call sign_define('ImgTest',  {'icon' : Joinpath(tabstuff_bitmapsdir, 'open-in-tabs.bmp')})
function tabutils#toolbar()
    "let rtp_bak = &runtimepath
    "let &runtimepath = PosixPath(tabstuf_dir) . ',' . &runtimepath
    "let &runtimepath = PosixPath(g:tabstuf_dir) . ',' . &runtimepath

    "sign place 1 line=1 name=ImgTest
    "let id = sign_place(0, '', 'ImgTest', 'gvim-build.sh', {'lnum' : 10})
    "anoremenu icon=$HOME/.vim/_tabstuff/bitmaps/open-in-tabs.xpm 1.15 ToolBar.OpenInNewTab :browse tabnew<cr>
    "anoremenu <silent>  icon=&ImgTest 1.15 ToolBar.OpenInNewTab :browse tabnew<cr>
    let g:open_in_new_tab_icon = Joinpath(g:tabstuff_bitmapsdir, 'open-in-tabs.bmp')
    let g:open_in_new_tab_str = printf("anoremenu <silent>  icon=%s 1.15 ToolBar.OpenInNewTab :browse tabnew<cr>", g:open_in_new_tab_icon)
    exe g:open_in_new_tab_str
    "anoremenu <silent>  icon=BuiltIn01 1.15 ToolBar.OpenInNewTab :browse tabnew<cr>
    tmenu ToolBar.OpenInNewTab Open In New Tab
    "anoremenu <silent>  icon=create-in-tabs 1.16 ToolBar.CreateInNewTab :call TabNewFile()<cr>
    let g:create_in_tabs_icon = Joinpath(g:tabstuff_bitmapsdir, 'create-in-tabs.bmp')
    let g:create_in_tabs_str = printf("anoremenu <silent>  icon=%s 1.16 ToolBar.CreateInNewTab :call TabNewFile()<cr>", g:create_in_tabs_icon)
    exe g:create_in_tabs_str
    tmenu ToolBar.CreateInNewTab Create File In New Tab
    anoremenu <silent>  1.281 ToolBar.-TabSep- :
    "anoremenu <silent>  icon=$HOME/.vim/_tabstuff/bitmaps/arrow-left-double.xpm 1.282 ToolBar.TabFirst :tabfirst<cr>
    exe printf("anoremenu <silent>  icon=%s 1.282 ToolBar.TabFirst :tabfirst<cr>", Joinpath(g:tabstuff_bitmapsdir, 'arrow-left-double.bmp'))
    tmenu ToolBar.TabFirst Goto First Tab
    exe printf("anoremenu <silent>  icon=%s 1.283 ToolBar.TabNext :tabnext<cr>", Joinpath(g:tabstuff_bitmapsdir, 'arrow-right.bmp'))
    tmenu ToolBar.TabNext Goto Next Tab 
    exe printf("anoremenu <silent>  icon=%s 1.284 ToolBar.TabPrevious :tabprevious<cr>", Joinpath(g:tabstuff_bitmapsdir, 'arrow-left.bmp'))
    tmenu ToolBar.TabPrevious Goto Previous Tab
    exe printf("anoremenu <silent>  icon=%s 1.285 ToolBar.TabLast :tablast<cr>", Joinpath(g:tabstuff_bitmapsdir, 'arrow-right-double.bmp'))
    tmenu ToolBar.TabLast Goto Last Tab
    anoremenu <silent>  1.286 ToolBar.-TabSep2- :
    exe printf("anoremenu <silent>  icon=%s 1.287 ToolBar.TabClose :tabclose<cr>", Joinpath(g:tabstuff_bitmapsdir, 'dialog-close.bmp'))
    tmenu ToolBar.TabClose Close Current Tab
    anoremenu <silent>  1.288 ToolBar.-TabSep3- :
    exe printf("anoremenu <silent>  icon=%s 1.289 ToolBar.TabOpenAllInTabs :tab sball<cr>", Joinpath(g:tabstuff_bitmapsdir, 'tabs.bmp'))
    tmenu ToolBar.TabOpenAllInTabs Open All Buffers In Tabs
    exe printf("anoremenu <silent>  icon=%s 1.290 ToolBar.TabMoveStart :tabmove 0<cr>", Joinpath(g:tabstuff_bitmapsdir, 'tabmove-start.bmp'))
    tmenu ToolBar.TabMoveStart Tab Move Start
    exe printf("anoremenu <silent>  icon=%s 1.291 ToolBar.TabMoveBack :exe 'tabmove' (tabpagenr()-2)<cr>", Joinpath(g:tabstuff_bitmapsdir, 'tabmove-left.bmp'))
    tmenu ToolBar.TabMoveBack Tab Move Back
    exe printf("anoremenu <silent>  icon=%s 1.292 ToolBar.TabMoveForward :exe 'tabmove' (tabpagenr()+1)<cr>", Joinpath(g:tabstuff_bitmapsdir, 'tabmove-right.bmp'))
    tmenu ToolBar.TabMoveForward Tab Move Forward
    exe printf("anoremenu <silent>  icon=%s 1.293 ToolBar.TabMove :tabmove<cr>", Joinpath(g:tabstuff_bitmapsdir, 'tabmove-end.bmp'))
    tmenu ToolBar.TabMove Tab Move End
    anoremenu <silent>  1.294 ToolBar.-TabSep4- :
    let g:tab_search_help_icon = Joinpath(g:tabstuff_bitmapsdir, 'help.bmp')
    let g:tab_search_help_str  = printf("anoremenu <silent>  icon=%s 1.295 ToolBar.Tab\\ Search\\ Help :call Tabhelp()<cr>", g:tab_search_help_icon)
    exe g:tab_search_help_str
    tmenu ToolBar.Tab\ Search\ Help Tab Search Help
    let g:tab_search_helpgrep_icon = Joinpath(g:tabstuff_bitmapsdir, 'helpgrep.bmp')
    let g:tab_search_helpgrep_str  = printf("anoremenu <silent>  icon=%s 1.296 ToolBar.Tab\\ Search\\ HelpGrep :call TabhelpGrep()<cr>", g:tab_search_helpgrep_icon)
    exe g:tab_search_helpgrep_str
    "exe printf("anoremenu <silent>  icon=%s 1.296 ToolBar.Tab\ Search\ HelpGrep :call TabhelpGrep()<cr>", Joinpath(g:tabstuff_bitmapsdir, 'helpgrep.bmp'))
    tmenu ToolBar.Tab\ Search\ HelpGrep Tab Search HelpGrep
    "let &runtimepath = rtp_bak
    return 1
endfunction

function! Tabhelp()
    let search =inputdialog("Search help for: ", "") 
    exe ":tab help " . search
endfunction

function! TabhelpGrep()
    let search =inputdialog("Grep Search help for: ", "") 
    exe ":tab helpgrep " . search
    exe ":cwindow"
endfunction

function TabNewFile()
    if  has("browse") == 0
        let dir = input("directory for new file: ", "", "dir")
        let filename = Joinpath(dir, input("file name: "))
    else
        let dir = browsedir("choose a directory for new file: ", getcwd())
        if dir == ""
            return
        endif
        let basefilename = inputdialog("Name for new file: ", "", v:null)
        if basefilename == v:null
            return
        endif
        let filename = Joinpath(dir, basefilename)
    endif
    exe ":tabnew " . filename
endfunction

function tabutils#menus()
    anoremenu Tab.First\ Tab :tabfirst<cr>
    anoremenu Tab.Next\ Tab :tabnext<cr>
    anoremenu Tab.Previous\ Tab :tabprevious<cr>
    anoremenu Tab.Last\ Tab :tablast<cr>
    anoremenu Tab.-Sep0- :
    anoremenu Tab.Close\ Tab :tabclose<cr>
    anoremenu Tab.-Sep1- :
    anoremenu Tab.Open\ All\ Buffers\ In\ Tabs :tab sball<cr>
    anoremenu Tab.-Sep2- :
    anoremenu Tab.Move\ Tab\ to\ Start :tabmove 0<cr>
    anoremenu Tab.Move\ Tab\ Back :exe 'tabmove' (tabpagenr()-2)<cr>
    anoremenu Tab.Move\ Tab\ Forward :exe 'tabmove' (tabpagenr()+1)<cr>
    anoremenu Tab.Move\ Tab\ to\ end :tabmove<cr>
    anoremenu Tab.-Sep3- :
    anoremenu Tab.Create\ New\ File\ in\ tab\.\.\. :call TabNewFile()<cr>

    anoremenu Tools.-GrizzlySep0- :
    anoremenu Tools.Toggle\ Tag\ List :TlistToggle<cr>
    return 1
endfunction
