;;; init-lsp-mode.el --- Lsp-Mode - Lsp client for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-l")
  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
	  '(orderless)))
  :hook (
         (c-mode . lsp)
	 (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration)
	 (lsp-completion-mode . my/lsp-mode-setup-completion))
  :config
  (setq lsp-log-io nil)
  (setq lsp-completion-provider :none) ;; we use corfu!
  
  :commands lsp
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  )

(use-package dap-mode
  :ensure t
  )

(provide 'init-lsp-mode)

;;; init-lsp-mode.el ends here
