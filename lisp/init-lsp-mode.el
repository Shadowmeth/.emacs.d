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
          (js-mode . lsp)
          (typescript-mode . lsp)
          (css-mode . lsp)
          
          (lsp-mode . lsp-enable-which-key-integration)
	  (lsp-completion-mode . my/lsp-mode-setup-completion))
  :config
  (setq lsp-log-io nil)
  (setq lsp-completion-provider :none) ;; we use corfu!
  (setq lsp-idle-delay 0.1)
  (setq lsp-auto-execute-action nil)

  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-enable-indentation nil)
  
  (setq lsp-enable-symbol-highlighting nil) ;; 1
  (setq lsp-ui-sideline-show-code-actions nil) ;; 5
  (setq lsp-ui-sideline-show-hover nil) ;; 6
  (setq lsp-modeline-code-actions-enable nil) ;; 7
  (setq lsp-eldoc-enable-hover nil) ;; 10
  (setq lsp-modeline-diagnostics-enable nil) ;; 11
  (setq lsp-signature-render-documentation nil) ;; 13

  ;; web mode configuration
  ;; HTML
  (add-to-list 'lsp-language-id-configuration '(".*\\.html?\\'" . "html"))
  ;; TypeScript React
  (add-to-list 'lsp-language-id-configuration '(".*\\.tsx\\'" . "typescriptreact"))
  ;; JavaScript React
  (add-to-list 'lsp-language-id-configuration '(".*\\.jsx\\'" . "javascriptreact"))

  ;; clangd
  (setq lsp-clients-clangd-args
    '(
       "-j=4"
       "--background-index"
       "--clang-tidy"
       "--completion-style=detailed"
       "--header-insertion=never"
       "--header-insertion-decorators=0"
       ))

  :commands (lsp lsp-deferred)
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
