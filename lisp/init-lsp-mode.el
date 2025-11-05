;;; init-lsp-mode.el --- Lsp-Mode - Lsp client for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Python
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "basedpyright") ;; or pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))
  )

;; Java
(use-package lsp-java
  :ensure t
  )

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-l")
  (defun my/lsp-mode-setup-completion-corfu ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
      '(orderless)))
  :hook (
          (c-mode . lsp)
	  (c++-mode . lsp)
          (cmake-mode . lsp)
          (js-mode . lsp)
          (typescript-mode . lsp)
          (css-mode . lsp)
          (java-mode . lsp)
          (rust-mode . lsp)
          
          (lsp-mode . lsp-enable-which-key-integration)
	  (lsp-completion-mode . my/lsp-mode-setup-completion-corfu) ;; use this only with corfu
          )
  :config
  (setq lsp-log-io nil)
  (setq lsp-idle-delay 1)
  (setq lsp-completion-provider :none) ;; we use corfu!
  (setq lsp-auto-execute-action nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-indentation nil)

  ;; Some settings are disabled in lsp-ui package config
  (setq lsp-enable-symbol-highlighting nil) ;; 1
  (setq lsp-modeline-code-actions-enable nil) ;; 7
  (setq lsp-eldoc-enable-hover nil) ;; 10
  (setq lsp-signature-auto-activate nil) ;; 12
  (setq lsp-signature-render-documentation nil) ;; 13

  ;; Assembly
  (add-to-list 'lsp-language-id-configuration '(".*\\.s\\'" . "assembly"))
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

  ;; rust-analyzer
  (setq lsp-rust-analyzer-cargo-watch-enable nil)

  ;; jdtls
  ;; download URL:
  ;; Update this in future if this causes issues or lacks features
  (setq lsp-java-settings-url
    "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.50.0/jdt-language-server-1.50.0-202509041425.tar.gz")
  ;; current VSCode defaults for jdtls
  (setq lsp-java-vmargs
    '("-XX:+UseParallelGC"
       "-XX:GCTimeRatio=4"
       "-XX:AdaptiveSizePolicyWeight=90"
       "-Dsun.zip.disableMemoryMapping=true"
       "-Xmx3G"
       "-Xms100m"))

  :commands (lsp lsp-deferred)
  )

;; Sometimes lsp-mode doesn't correctly load lsp-keymap-prefix.
;; This permanently fixes that. NOTE: this should be outside use-package after lsp-mode
;; is done with all the initialization work
(define-key lsp-mode-map (kbd "C-l") lsp-command-map)

(use-package lsp-ui
  :ensure t
  :config
  ;; Disable sideline entirely
  (setq lsp-ui-sideline-enable nil)
  ;; Hide lsp-ui-sideline items
  (setq lsp-ui-sideline-show-code-actions nil) ;; 5 (code actions)
  (setq lsp-ui-sideline-show-hover nil) ;; 6 (symbols)
  
  (setq lsp-ui-doc-delay 0.05)
  (setq lsp-ui-sideline-delay 0.05)
  
  :commands lsp-ui-mode
  )

;; See https://github.com/emacs-lsp/dap-mode/pull/837/commits to fix the UI controls bug
;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   (require 'dap-node)
;;   (require 'dap-java)
;;   (require 'dap-python)
;;   (require 'dap-lldb)
  
;;   (setq dap-python-debugger 'debugpy)
;;   (setq dap-lldb-debug-program '("/usr/bin/lldb-dap"))
;;   (dap-node-setup)

;;   (dap-mode 1)
;;   (dap-ui-mode 1)
;;   (dap-tooltip-mode 1)
;;   (tooltip-mode 1)
;;   (dap-ui-controls-mode 1)
;;   )

(provide 'init-lsp-mode)

;;; init-lsp-mode.el ends here
