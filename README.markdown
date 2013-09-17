#Enhanced Javascript Syntax for Vim

###Credits
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figured out the crazy Vim Regexes)

###Description
This file is a fork of [this file](http://www.vim.org/scripts/script.php?script_id=1491) and [the stock one](http://fleiner.com/vim/download.html)

This version of this file features the following text highlights:

- Parenthesis, curly and regular brackets.
- The semicolon or comma at the end of line.
- Browser, DOM and "Ajax" keywords like objects, methods, properties and others.
- Operation, comparison and logical symbols (`=`,`==`,`===`,`!=`,etc.).

To enable code folding add the following to your `.vimrc`.

    au FileType javascript call JavaScriptFold()

###Note
This is a syntax plugin, not an indentation one. For indentation, this is the [recommended one](https://github.com/vim-scripts/JavaScript-Indent) by Preston Koprivica.

###Installation
- Using [NeoBundle](https://github.com/Shougo/neobundle.vim) **(Which I recommend)**

		NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

- Using [Vundle](https://github.com/gmarik/vundle)

		Bundle 'jelera/vim-javascript-syntax'

- Using [Pathogen](https://github.com/tpope/vim-pathogen)

		$ cd ~/.vim/bundle
		$ git clone https://github.com/jelera/vim-javascript-syntax.git
	

###TODO
You can help me improve it too.

- ~~The separate highlight of the arguments~~ Thanks to [Billychan](https://github.com/jelera/vim-javascript-syntax/commit/b03f40ff6ddf605ac146634a651632d6c1e8a50b) for this
- ~~I know this is a syntax file, but having an autocompletion file.~~ So far a better autocompletion can be achieved by [Tern for Vim](https://github.com/marijnh/tern_for_vim)
- ~~Add keywords for the popular third-party libraries like jQuery, YUI, Prototype, etc.~~ This can be done with [this repo](https://github.com/othree/javascript-libraries-syntax.vim)

###Screenshots
This is the stock Javascript syntax file
![Stock Vim Javascript syntax file](http://i.imgur.com/bfQD7.png)

This is with the Enhanced Syntax file
![Enhanced Javascript Vim syntax](http://i.imgur.com/Tezu3.png)

###License
The same as Vim
