" Vim syntax file
" Language:     JavaScript
" Maintainer:   Kao Wei-Ko <othree@gmail.com>
" Maintainer:   Jose Elera Campana <https://github.com/jelera>
" Last Change:  2013-02-19
" Version:      0.8
" Changes:      Go to https://github.com/othree/vim-javascript-syntax for
"               recent changes.
" Origin:       https://github.com/jelera/vim-javascript-syntax
" Credits:      Zhao Yi, Claudio Fleiner, Scott Shattuck (This file is based
"               on their hard work), gumnos (From the #vim IRC Channel in
"               Freenode)

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif

"" dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syntax match shebang "^#!.*/bin/env\s\+node\>"
hi link shebang Comment

"" JavaScript comments"{{{
syntax keyword javascriptCommentTodo      TODO FIXME XXX TBD contained
syntax match   javascriptLineComment      "\/\/.*" contains=@Spell,javascriptCommentTodo
syntax match   javascriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syntax region  javascriptComment	       start="/\*"  end="\*/" contains=@Spell,javascriptCommentTodo
"}}}
"" JSDoc support start"{{{
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

" syntax coloring for JSDoc comments (HTML)
  "unlet b:current_syntax

  syntax region  javascriptDocComment    matchgroup=javascriptComment start="/\*\*\s*$"  end="\*/" contains=javascriptDocTags,javascriptCommentTodo,javascriptCvsTag,@javascriptHtml,@Spell fold
  syntax match   javascriptDocTags       contained "@\(param\|argument\|requires\|exception\|throws\|type\|class\|extends\|see\|link\|member\|module\|method\|title\|namespace\|optional\|default\|base\|file\)\>" nextgroup=javascriptDocParam,javascriptDocSeeTag skipwhite
  syntax match   javascriptDocTags       contained "@\(beta\|deprecated\|description\|fileoverview\|author\|license\|version\|returns\=\|constructor\|private\|protected\|final\|ignore\|addon\|exec\)\>"
  syntax match   javascriptDocParam      contained "\%(#\|\w\|\.\|:\|\/\)\+"
  syntax region  javascriptDocSeeTag     contained matchgroup=javascriptDocSeeTag start="{" end="}" contains=javascriptDocTags

  syntax case match
endif   "" JSDoc end
"}}}
syntax case match

"" Syntax in the JavaScript code"{{{
syntax match   javascriptSpecial	       "\\\d\d\d\|\\."
syntax region  javascriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javascriptSpecial,@htmlPreproc
syntax region  javascriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javascriptSpecial,@htmlPreproc

syntax match   javascriptSpecialCharacter "'\\.'"
syntax match   javascriptNumber	         "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax region  javascriptRegexpString    start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
" syntax match   javascriptSpecial        "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
" syntax region  javascriptStringD        start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=javascriptSpecial,@htmlPreproc
" syntax region  javascriptStringS        start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=javascriptSpecial,@htmlPreproc
" syntax region  javascriptRegexpString   start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=javascriptSpecial,@htmlPreproc oneline
" syntax match   javascriptNumber         /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syntax match   javascriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
" syntax match   javascriptLabel          /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/
"}}}
"" JavaScript Prototype"{{{
syntax keyword javascriptPrototype      prototype
"}}}
"  DOM, Browser and Ajax Support   {{{
""""""""""""""""""""""""
syntax keyword javascriptBrowserObjects           window navigator screen history location

syntax keyword javascriptDOMObjects               document event HTMLElement Anchor Area Base Body Button Form Frame Frameset Image Link Meta Option Select Style Table TableCell TableRow Textarea
syntax keyword javascriptDOMMethods               createTextNode createElement insertBefore replaceChild removeChild appendChild  hasChildNodes  cloneNode  normalize  isSupported  hasAttributes  getAttribute  setAttribute  removeAttribute  getAttributeNode  setAttributeNode  removeAttributeNode  getElementsByTagName  hasAttribute  getElementById adoptNode close compareDocumentPosition createAttribute createCDATASection createComment createDocumentFragment createElementNS createEvent createExpression createNSResolver createProcessingInstruction createRange createTreeWalker elementFromPoint evaluate getBoxObjectFor getElementsByClassName getSelection getUserData hasFocus importNode
syntax keyword javascriptDOMProperties            nodeName  nodeValue  nodeType  parentNode  childNodes  firstChild  lastChild  previousSibling  nextSibling  attributes  ownerDocument  namespaceURI  prefix  localName  tagName

syntax keyword javascriptAjaxObjects              XMLHttpRequest
syntax keyword javascriptAjaxProperties           readyState responseText responseXML statusText
syntax keyword javascriptAjaxMethods              onreadystatechange abort getAllResponseHeaders getResponseHeader open send setRequestHeader

syntax keyword javascriptPropietaryObjects        ActiveXObject
syntax keyword javascriptPropietaryMethods        attachEvent detachEvent cancelBubble returnValue

syntax keyword javascriptHtmlElemProperties       className  clientHeight  clientLeft  clientTop  clientWidth  dir  href  id  innerHTML  lang  length  offsetHeight  offsetLeft  offsetParent  offsetTop  offsetWidth  scrollHeight  scrollLeft  scrollTop  scrollWidth  style  tabIndex  target  title

syntax keyword javascriptEventListenerKeywords    blur click focus mouseover mouseout load item

syntax keyword javascriptEventListenerMethods     scrollIntoView  addEventListener  dispatchEvent  removeEventListener preventDefault stopPropagation
" }}}
"" Programm Keywords"{{{
syntax keyword javascriptSource         import export
syntax keyword javascriptIdentifier     arguments this let var void yield
syntax keyword javascriptOperator       delete new instanceof typeof
syntax keyword javascriptBoolean        true false
syntax keyword javascriptNull           null undefined
syntax keyword javascriptMessage        alert confirm prompt status
syntax keyword javascriptGlobal         self top parent
syntax keyword javascriptDeprecated     escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
"}}}
"" Statement Keywords"{{{
syntax keyword javascriptConditional    if else switch
syntax keyword javascriptRepeat         do while for in
syntax keyword javascriptBranch         break continue
syntax keyword javascriptLabel          case default
syntax keyword javascriptStatement      return with

syntax keyword javascriptGlobalObjects  Array Boolean Date Function Infinity Math Number NaN Object Packages RegExp String netscape

" http://www.khronos.org/registry/typedarray/specs/latest/
syntax keyword javascriptTypedArray     ArrayBuffer DataView
syntax keyword javascriptTypedArray     Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array
syntax keyword javascriptTypedArray     Int32Array Uint32Array Float32Array Float64Array

" http://www.w3.org/TR/FileAPI/
" https://dvcs.w3.org/hg/url/raw-file/tip/Overview.html
syntax keyword javascriptFileAPI        File Blob FileReader URL

syntax keyword javascriptExceptions     try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError

syntax keyword javascriptReserved       abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public
"}}}
"" DOM/HTML/CSS specified things"{{{

  " DOM2 Objects"{{{
  syntax keyword javascriptType         DOMImplementation DocumentFragment Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
  syntax keyword javascriptExceptions   DOMException
"}}}
  " DOM2 CONSTANT"{{{
  syntax keyword javascriptDomErrNo     INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
  syntax keyword javascriptDomNodeConsts ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE
"}}}
  " HTML events and internal variables"{{{
  syntax case ignore
  syntax keyword javascriptHtmlEvents   onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
  syntax case match
"}}}

" Follow stuff should be highligh within a special context
" While it can't be handled with context depended with Regex based highlight
" So, turn it off by default
if exists("javascript_enable_domhtmlcss")

    " DOM2 things"{{{
    syntax match javascriptDomElemAttrs     contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
    syntax match javascriptDomElemFuncs     contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=javascriptParen skipwhite
	"}}}
    " HTML things"{{{
    syntax match javascriptHtmlElemAttrs    contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
    syntax match javascriptHtmlElemFuncs    contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=javascriptParen skipwhite
"}}}
    " CSS Styles in JavaScript"{{{
    syntax keyword javascriptCssStyles      contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
    syntax keyword javascriptCssStyles      contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
    syntax keyword javascriptCssStyles      contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
    syntax keyword javascriptCssStyles      contained bottom height left position right top width zIndex
    syntax keyword javascriptCssStyles      contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
    syntax keyword javascriptCssStyles      contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
    syntax keyword javascriptCssStyles      contained listStyle listStyleImage listStylePosition listStyleType
    syntax keyword javascriptCssStyles      contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
    syntax keyword javascriptCssStyles      contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
    syntax keyword javascriptCssStyles      contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
    syntax keyword javascriptCssStyles      contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor
"}}}
    " Highlight ways"{{{
    syntax match javascriptDotNotation      "\." nextgroup=javascriptPrototype,javascriptDomElemAttrs,javascriptDomElemFuncs,javascriptHtmlElemAttrs,javascriptHtmlElemFuncs
    syntax match javascriptDotNotation      "\.style\." nextgroup=javascriptCssStyles
"}}}
endif "DOM/HTML/CSS

"" end DOM/HTML/CSS specified things""}}}


"" Code blocks
syntax cluster javascriptAll       contains=javascriptComment,javascriptLineComment,javascriptDocComment,javascriptStringD,javascriptStringS,javascriptRegexpString,javascriptNumber,javascriptFloat,javascriptLabel,javascriptSource,javascriptType,javascriptOperator,javascriptBoolean,javascriptNull,javascriptFuncKeyword,javascriptConditional,javascriptGlobal,javascriptRepeat,javascriptBranch,javascriptStatement,javascriptGlobalObjects,javascriptMessage,javascriptIdentifier,javascriptExceptions,javascriptReserved,javascriptDeprecated,javascriptDomErrNo,javascriptDomNodeConsts,javascriptHtmlEvents,javascriptDotNotation,javascriptBrowserObjects,javascriptDOMObjects,javascriptAjaxObjects,javascriptPropietaryObjects,javascriptDOMMethods,javascriptHtmlElemProperties,javascriptDOMProperties,javascriptEventListenerKeywords,javascriptEventListenerMethods,javascriptAjaxProperties,javascriptAjaxMethods,javascriptFuncArg,javascriptTypedArray,javascriptFileAPI

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javascriptComment minlines=200
  " syntax sync match javascriptHighlight grouphere javascriptBlock /{/
endif

syntax keyword javascriptFuncKeyword function contained
syntax region  javascriptFuncDef start="function" end="\([^)]*\)" contains=javascriptFuncKeyword,javascriptFuncArg keepend
syntax match   javascriptFuncArg "\(([^()]*)\)" contains=javascriptParens,javascriptFuncComma contained
syntax match   javascriptFuncComma /,/ contained
" syntax region  javascriptFuncBlock      contained matchgroup=javascriptFuncBlock start="{" end="}" contains=@javascriptAll,javascriptParensErrA,javascriptParensErrB,javascriptParen,javascriptBracket,javascriptBlock fold

syntax match   javascriptBraces	   "[{}\[\]]"
syntax match   javascriptParens	   "[()]"
syntax match   javascriptOpSymbols	   "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syntax match   javascriptEndColons    "[;,]"
syntax match   javascriptLogicSymbols "\(&&\)\|\(||\)"

" JavaScriptFold Function {{{

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syntax region  foldBraces start=/{/ end=/}/ transparent fold keepend extend

	setl foldtext=FoldText()
endfunction

" au FileType javascript call JavaScriptFold()

" }}}

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink javascriptEndColons            Exception
  HiLink javascriptOpSymbols            Operator
  HiLink javascriptLogicSymbols         Boolean
  HiLink javascriptBraces               Function
  HiLink javascriptParens               Operator
  HiLink javascriptComment              Comment
  HiLink javascriptLineComment          Comment
  HiLink javascriptDocComment           Comment
  HiLink javascriptCommentTodo          Todo
  HiLink javascriptCvsTag               Function
  HiLink javascriptDocTags              Special
  HiLink javascriptDocSeeTag            Function
  HiLink javascriptDocParam             Function
  HiLink javascriptStringS              String
  HiLink javascriptStringD              String
  HiLink javascriptRegexpString         String
  HiLink javascriptGlobal               Constant
  HiLink javascriptCharacter            Character
  HiLink javascriptPrototype            Type
  HiLink javascriptConditional          Conditional
  HiLink javascriptBranch               Conditional
  HiLink javascriptIdentifier           Identifier
  HiLink javascriptRepeat               Repeat
  HiLink javascriptStatement            Statement
  HiLink javascriptFuncKeyword          Function
  HiLink javascriptMessage              Keyword
  HiLink javascriptDeprecated           Exception
  HiLink javascriptError                Error
  HiLink javascriptParensError          Error
  HiLink javascriptParensErrA           Error
  HiLink javascriptParensErrB           Error
  HiLink javascriptParensErrC           Error
  HiLink javascriptReserved             Keyword
  HiLink javascriptOperator             Operator
  HiLink javascriptType                 Type
  HiLink javascriptNull                 Type
  HiLink javascriptNumber               Number
  HiLink javascriptFloat                Number
  HiLink javascriptBoolean              Boolean
  HiLink javascriptLabel                Label
  HiLink javascriptSpecial              Special
  HiLink javascriptSource               Special
  HiLink javascriptGlobalObjects        Special
  HiLink javascriptExceptions           Special
  HiLink javascriptTypedArray           Special
  HiLink javascriptFileAPI              Special

  HiLink javascriptDomErrNo             Constant
  HiLink javascriptDomNodeConsts        Constant
  HiLink javascriptDomElemAttrs         Label
  HiLink javascriptDomElemFuncs         PreProc

  HiLink javascriptHtmlElemAttrs        Label
  HiLink javascriptHtmlElemFuncs        PreProc

  HiLink javascriptCssStyles            Label

  " Ajax Highlighting
  HiLink javascriptBrowserObjects       Constant
                                        
  HiLink javascriptDOMObjects           Constant
  HiLink javascriptDOMMethods           Exception
  HiLink javascriptDOMProperties        Type
                                        
  HiLink javascriptAjaxObjects          htmlH1
  HiLink javascriptAjaxMethods          Exception
  HiLink javascriptAjaxProperties       Type
                                        
  HiLink javascriptFuncDef              Title
  HiLink javascriptFuncArg              Special
  HiLink javascriptFuncComma            Operator  
                                        
  HiLink javascriptHtmlEvents           Special
  HiLink javascriptHtmlElemProperties   Type

  HiLink javascriptEventListenerKeywords Keyword

  HiLink javascriptNumber               Number
  HiLink javascriptPropietaryObjects    Constant

  delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javascriptExpression
syntax cluster  htmlJavaScript contains=@javascriptAll,javascriptBracket,javascriptParen,javascriptBlock,javascriptParenError
syntax cluster  javascriptExpression contains=@javascriptAll,javascriptBracket,javascriptParen,javascriptBlock,javascriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

