;;; init-x86-lookup.el --- x86-lookup - Search through intel docs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package x86-lookup
  :ensure t
  :config
  (setq x86-lookup-pdf "~/.emacs.d/intel-complete-manual.pdf")
  (global-set-key (kbd "C-h z") #'x86-lookup)
  )

(provide 'init-x86-lookup)

;;; init-x86-lookup.el ends here
