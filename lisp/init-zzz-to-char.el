;;; init-zzz-to-char.el --- Enhanced zap to char -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package zzz-to-char
  :ensure t
  :config
  (global-set-key (kbd "M-z") #'zzz-to-char-up-to-char)
  )

(provide 'init-zzz-to-char)

;;; init-zzz-to-char.el ends here
