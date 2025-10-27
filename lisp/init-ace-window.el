;;; init-ace-window.el --- Ace-Window - switch buffers fast -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  )

(provide 'init-ace-window)

;;; init-ace-window.el ends here
