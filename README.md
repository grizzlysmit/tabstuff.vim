description
===========

Tabstuff puts in toolbar buttons and a tab menu, that lets you do things like: open a file in a new tab create a new file in a new tab open all buffers  in separate tabs; this will only work up to tabpagemax tabs the rest will be opened in widows in the last tab.

There is also functions to move tabs, change tabs close the current tab: NB: this will not close the buffer, to do that use Buffers-&gt;delete.

If you want to increase the maximum number of tabs then set tabpagemax to your desired value I have; set tabpagemax=50 in my .gvimrc file .

If you wish to open the help in a new tab or helpgrep then there are two buttons for this.

Follow the tool tips for more details.
 
install details
===============

## With Vundel 

Add this line to your .vimrc on linux or your _vimrc on windows

Plugin 'grizzlysmit/tabstuff.vim'

inside your 
call vundle#begin()
and 
call vundle#end()            " required

if you do not have [Vundel](https://github.com/VundleVim/Vundle.vim) installed [go here for instuctions](https://github.com/VundleVim/Vundle.vim#quick-start)


## Tabstuff Installation (Linux):

1. Download tabstuff-&lt;version&gt;-&lt;build&gt;.tar.bz2 and extract it
2. Put everything which is in tabstuff-&lt;version&gt; folder to ~/.vim, or put videm to ~/.vim/bundle if you use pathogen

## Installation(Windows):

1. Download tabstuff-&lt;version&gt;-&lt;build&gt;.tar.bz2 and extract it
2. Put everything which in tabstuff-&lt;version&gt; folder to $VIM\vimfiles (for example of mine: C:\Program Files\Vim\vimfiles) or put tabstuff folder into $VIM\vimfiles\bundle if you use pathogen

