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


###TODO
You can help me improve it too.

- The separate highlight of the arguments
- I know this is a syntax file, but having an autocompletion file.
- Add keywords for the popular third-party libraries like jQuery, YUI, Prototype, etc.

###Screenshots
This is the stock Javascript syntax file
![Stock Vim Javascript syntax file](http://i.imgur.com/bfQD7.png)

This is with the Enhanced Syntax file
![Enhanced Javascript Vim syntax](http://i.imgur.com/Tezu3.png)

###License
The same as Vim



