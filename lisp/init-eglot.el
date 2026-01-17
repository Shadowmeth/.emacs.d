;;; init-eglot.el --- Eglot - Lsp client for Emacs (built-in) -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Unlike with lsp-mode, keep the booster code in same file as eglot config
(use-package eglot-booster
  :after eglot
  :config
  (setq eglot-booster-io-only t)
  (eglot-booster-mode)
  )

(defun project-find-subroot-for-eglot (dir)
  (when eglot-lsp-context
    (let ((root (locate-dominating-file dir ".eglot")))
      (when root
        (cons 'transient root)))))

(add-hook 'project-find-functions #'project-find-subroot-for-eglot)

(use-package eglot
  :ensure nil ;; eglot comes built-in
  :hook (
          ;; normal modes
          (c-mode . eglot-ensure)
          (c++-mode . eglot-ensure)
          (cmake-mode . eglot-ensure)
          (js-mode . eglot-ensure)
          (typescript-mode . eglot-ensure)
          (css-mode . eglot-ensure)
          (java-mode . eglot-ensure)
          (rust-mode . eglot-ensure)
          (python-mode . eglot-ensure)
          (haskell-mode . eglot-ensure)
          (haskell-literate-mode . eglot-ensure)

          ;; ts modes
          (c-ts-mode . eglot-ensure)
          (c++-ts-mode . eglot-ensure)
          (rust-ts-mode . eglot-ensure)
          (cmake-ts-mode . eglot-ensure)
          (java-ts-mode . eglot-ensure)
          (css-ts-mode . eglot-ensure)
          (typescript-ts-mode . eglot-ensure)
          (html-ts-mode . eglot-ensure)
          (js-ts-mode . eglot-ensure)
          (tsx-ts-mode . eglot-ensure)
          (python-ts-mode . eglot-ensure)
          (haskell-ts-mode . eglot-ensure)

          ;; Disable flymake
          (eglot-managed-mode . (lambda ()
                                  (flymake-mode -1)
                                  (flycheck-mode 1)
                                  (eglot-inlay-hints-mode -1)))
          )
  :config
  (require 'eglot)
  ;; Enable orderless completion for Eglot
  (setq completion-category-overrides
    '((eglot (styles orderless basic))))

  ;; Python - use basedpyright
  (add-to-list 'eglot-server-programs
    '(python-mode . ("basedpyright-langserver" "--stdio")))
  (add-to-list 'eglot-server-programs
    '(python-ts-mode . ("basedpyright-langserver" "--stdio")))

  ;; Java - JDTLS with debug bundle
  (add-to-list 'eglot-server-programs
    '((java-mode java-ts-mode) .
       ("jdtls"
         "-XX:+UseParallelGC"
         "-XX:GCTimeRatio=4"
         "-XX:AdaptiveSizePolicyWeight=90"
         "-Dsun.zip.disableMemoryMapping=true"
         "-Xmx3G"
         "-Xms100m"
         :initializationOptions
         (:bundles ["/home/syedkhs/.local/bin/com.microsoft.java.debug.plugin-0.53.1.jar"]
           :extendedClientCapabilities (:progressReportProvider t)))))

  ;; C / C++ - Clangd
  (add-to-list 'eglot-server-programs
    '((c-mode c++-mode c-ts-mode c++-ts-mode) .
       ("clangd"
         "-j=4"
         "--background-index"
         "--clang-tidy"
         "--completion-style=detailed"
         "--header-insertion=never"
         "--header-insertion-decorators=0")))

  ;; Rust - Rust-Analyzer
  (add-to-list 'eglot-server-programs
    '((rust-mode rust-ts-mode) .
       ("rust-analyzer"
         :initializationOptions
         (:checkOnSave (:enable :json-false)))))

  ;; Typescript - enable parameter name hints
  (setq-default eglot-workspace-configuration
    '(:typescript (:inlayHints (:parameterNames (:enabled "all")))))

  ;; Performance settings
  (setq eglot-sync-connect nil)
  (setq eglot-connect-timeout 30)
  (setq eglot-autoshutdown t)
  (setq eglot-send-changes-idle-time 0.2)

  ;; Disable certain features
  (setq eglot-ignored-server-capabilities
    '(
       :documentHighlightProvider ;; no lsp symbol highlighting
       :documentOnTypeFormattingProvider ;; no lsp formatting
       ))

  ;; eldoc configuration
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq eldoc-echo-area-prefer-doc-buffer t)

  :custom
  (eglot-autoreconnect nil)
  )

;; Eglot command map (simple prefix approach)
(defvar eglot-command-map
  (let ((map (make-sparse-keymap)))
    ;; Actions
    (define-key map "a" 'eglot-code-actions)
    (define-key map "r" 'eglot-rename)
    (define-key map "f" 'eglot-format)
    (define-key map "o" 'eglot-code-action-organize-imports)
    
    ;; Navigation (using xref)
    (define-key map "d" 'xref-find-definitions)
    (define-key map "D" 'xref-find-definitions-other-window)
    (define-key map "R" 'xref-find-references)
    (define-key map "i" 'eglot-find-implementation)
    (define-key map "t" 'eglot-find-typeDefinition)
    
    ;; Help/Documentation
    (define-key map "h" 'eldoc)
    
    ;; Workspace
    (define-key map "w" 'eglot-reconnect)
    (define-key map "q" 'eglot-shutdown)
    (define-key map "Q" 'eglot-shutdown-all)
    
    ;; Toggles
    (define-key map "I" 'eglot-inlay-hints-mode)
    
    map)
  "Keymap for Eglot commands.")

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-l") eglot-command-map))

;; Dape (Debug Adapter Protocol for Emacs)
(use-package dape
  :ensure t
  :hook
  ;; Save breakpoints on quit
  (kill-emacs . dape-breakpoint-save)
  ;; Load breakpoints on startup
  (after-init . dape-breakpoint-load)
  
  :custom
  ;; Turn on global bindings for setting breakpoints with mouse
  (dape-breakpoint-global-mode +1)
  
  ;; Info buffers to the right
  (dape-buffer-window-arrangement 'right)

  :config
  ;; Pulse source line (performance hit)
  (add-hook 'dape-display-source-hook #'pulse-momentary-highlight-one-line)

  ;; Save buffers on startup, useful for interpreted languages
  (add-hook 'dape-start-hook (lambda () (save-some-buffers t t)))

  ;; Kill compile buffer on build success
  (add-hook 'dape-compile-hook #'kill-buffer)
  )

(provide 'init-eglot)

;;; init-eglot.el ends here
