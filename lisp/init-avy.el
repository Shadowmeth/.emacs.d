;;; init-avy.el --- Avy - quick jump anywhere -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-'") 'avy-goto-char)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  )

(provide 'init-avy)

;;; init-avy.el ends here
