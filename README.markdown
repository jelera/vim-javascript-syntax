#Javascript Syntax with Ajax support
I use this customized version of Yi Zhao's Javascript syntax file to enhance the readibility of my files. 
The keywords included are Ajax methods and properties, Browser and DOM objects. 

As this being my first attempt to contribute with the community, I'll take any suggestions to make it better. 

Here are some screenshots http://twitpic.com/3ulapw http://twitpic.com/3ula28 

For the colorscheme, I use vimscript#3427 (also tweaked by myself). I find it perfect for Web Development 

Add these following lines to your favorite colorscheme and choose the colors you like the most 

  ```vim
  "" Special for Javascript 
  hi javaScriptBrowserObjects       guifg=#DBB6D2 ctermfg=182   gui=italic 

  hi javaScriptDOMObjects           guifg=#DBB6D2 gui=BOLD 
  hi javaScriptDOMMethods           guifg=#D4FA9B ctermfg=192 
  hi link javaScriptDOMProperties   Keyword 

  hi javaScriptAjaxObjects          guifg=#5d91d3 gui=underline 
  hi javaScriptAjaxMethods          guifg=#6699CC ctermfg=68 
  hi javaScriptAjaxProperties       guifg=#FF9494 ctermfg=210 

  hi javaScriptFuncName             guifg=#B5E4F7 ctermfg=153 
  hi javaScriptHtmlElemProperties   guifg=#FF9494 ctermfg=210 
  hi javaScriptEventListenerKeyword guifg=#6699CC ctermfg=68 
```
