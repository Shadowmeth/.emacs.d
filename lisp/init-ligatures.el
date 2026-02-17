;;; init-ligature.el --- Ligature - quick jump anywhere -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defvar ligatures-jet-brains-mono
  '("--" "---" "==" "===" "!=" "!==" "=!=" "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++"
     "***" ";;" "!!" "??" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<>" "<<<" ">>>" "<<" ">>" "||" "-|"
     "_|_" "|-" "||-" "|=" "||=" "##" "###" "####" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:"
     "#!" "#=" "^=" "<$>" "<$" "$>" "<+>" "<+ +>" "<*>" "<* *>" "</" "</>" "/>" "<!--"
     "<#--" "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>" "==>" "=>"
     "=>>" ">=>" ">>=" ">>-" ">-" ">--" "-<" "-<<" ">->" "<-<" "<-|" "<=|" "|=>" "|->" "<-"
     "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~" "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]"
     "|>" "<|" "||>" "<||" "|||>" "|||>" "<|>" "..." ".." ".=" ".-" "..<" ".?" "::" ":::"
     ":=" "::=" ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__"))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 'prog-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'text-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'conf-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'vterm-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'compilation-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'dired-mode ligatures-jet-brains-mono)
  (ligature-set-ligatures 'fundamental-mode ligatures-jet-brains-mono)

  (global-ligature-mode t)
  )

(provide 'init-ligatures)

;;; init-ligatures.el ends here
