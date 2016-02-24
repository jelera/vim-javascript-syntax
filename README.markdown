# Enhanced JavaScript Syntax for Vim

### Credits
- Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based on their hard work)
- gumnos (From the #vim IRC Channel in Freenode) (Who helped me figured out the
  crazy Vim Regexes)

### Description
This file is a fork of [this file](http://www.vim.org/scripts/script.php?script_id=1491)
and [the stock one](http://fleiner.com/vim/download.html)

This version of this file features the following text highlights:

- Parenthesis, curly and regular brackets.
- The semicolon or comma at the end of line.
- Browser, DOM and "Ajax" keywords like objects, methods, properties and others.
- Operation, comparison and logical symbols (`=`,`==`,`===`,`!=`,etc.).
- Separate highlight of the arguments. Thanks to [Billychan](https://github.com/jelera/vim-javascript-syntax/commit/b03f40ff6ddf605ac146634a651632d6c1e8a50b).


###  [Screenshots](http://imgur.com/a/7bnu3)
This is the stock Javascript syntax file
#### Solarized Light
![Stock Vim JavaScript syntax file](http://i.imgur.com/FCVLMgl.png)

This is with the Enhanced Syntax file
![Enhanced JavaScript Vim syntax](http://i.imgur.com/yGY3Cmm.png)

#### Hybrid
![Stock Vim JavaScript syntax file](http://i.imgur.com/cGb3EjH.png)

This is with the Enhanced Syntax file
![Enhanced JavaScript Vim syntax](http://i.imgur.com/cmgdlO6.png)
### Installation
- Using [NeoBundle](https://github.com/Shougo/neobundle.vim) **(Which I recommend)**,
  add this line to your `.vimrc`

```vim
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
```

- Using [Vundle](https://github.com/gmarik/vundle),
  add this line to your `.vimrc`

```vim
Plugin 'jelera/vim-javascript-syntax'
```

- Using [Pathogen](https://github.com/tpope/vim-pathogen),
  run this command in your shell

```bash
git clone https://github.com/jelera/vim-javascript-syntax.git ~/.vim/bundle/vim-javascript-syntax
```

### Suggested Companion Plugins
- **Indentation**, can be achieved with [Javascript-Indent](https://github.com/vim-scripts/JavaScript-Indent) by Preston Koprivica. On my testing, it has proved to be the most capable and also indents HTML and JS inside HTML.
The project is unmaintained for now, but you could fork it and improve upon it.
- **Autocompletion** by [Tern for Vim](https://github.com/marijnh/tern_for_vim)
- Popular **third-party libraries support** like jQuery, YUI, Prototype, by [javascript-libraries-syntax](https://github.com/othree/javascript-libraries-syntax.vim)


### Contributions
This project follows the
[Git-flow](http://nvie.com/posts/a-successful-git-branching-model/) methodology,
this will keep the master branch clean for new stable releases. Also the
version numbering convention will be [this one](http://stackoverflow.com/a/65750)

More about Git-flow at:
- [Daniel Kummer's Git Flow cheatsheet](http://danielkummer.github.io/git-flow-cheatsheet/)
- [Sayanee Basu's Build Podcast - Git Flow](https://www.youtube.com/watch?v=Hh-jJcJ5IJ8)

#### For new contributors
Follow this steps
- Clone this repository.
- Using the command line, run `git flow init -d`.
- Checkout the `develop` branch.
- For new features: Create a new `feature` branch using git-flow.
- For bugfixes: Commit in the `develop` branch.
- Bump the date and version number on the syntax file.
- When done, don't forget to push the `develop` branch.
- Submit a pull request.

While all contributions are always welcome, make sure your commit message follow this
[**convention**](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)


### License
The same as Vim
