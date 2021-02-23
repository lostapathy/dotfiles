syntax match todoCheckbox '\v.*\[\ \]'hs=e-2 conceal cchar=☐
syntax match todoCheckbox '\v.*\[X\]'hs=e-2 conceal cchar=🗹
syntax match todoCheckbox '\v.*\[[\.o]\]'hs=e-2 conceal cchar=☒
setlocal conceallevel=2
hi Conceal ctermfg=13 ctermbg=NONE guibg=NONE
