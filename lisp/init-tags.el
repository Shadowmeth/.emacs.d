;;; init-tags.el --- Tags-based navigation and completion (ctags + citre) -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; Replaces LSP-based navigation with Universal Ctags + Citre.
;; Provides: jump-to-definition, completion-at-point, peek, and find-references (via GNU Global).
;;
;; External dependencies:
;;   - Universal Ctags:  sudo apt install universal-ctags  (or build from source)
;;   - readtags:         comes bundled with Universal Ctags
;;   - GNU Global:       sudo apt install global  (optional, for find-references)
;;
;; Tag generation:
;;   M-x citre-update-this-tags-file   — generate/update tags for current project
;;
;;; Code:

;; ---------------------------------------------------------------------------
;; Citre — the main tags frontend
;; ---------------------------------------------------------------------------
(use-package citre
  :ensure t
  :defer t
  :init
  (require 'citre-config)

  :bind (:map prog-mode-map
          ("M-."     . citre-jump)
          ("M-,"     . citre-jump-back)
          ("M-?"     . citre-peek)
          ("C-c t j" . citre-jump)
          ("C-c t p" . citre-peek)
          ("C-c t u" . citre-update-this-tags-file)
          ("C-c t r" . citre-jump-to-reference))

  :custom
  (citre-ctags-program "ctags")
  (citre-readtags-program "readtags")

  ;; Use project.el to detect project root
  (citre-project-root-function
    (lambda ()
      (when-let ((proj (project-current)))
        (project-root proj))))

  ;; Default ctags command used by citre-update-this-tags-file
  (citre-default-create-tags-file-cmdline
    '("ctags"
       "-o" "%TAGSFILE%"
       "--languages=C,C++,Java,Python,Rust,JavaScript,TypeScript,Lua,Haskell,CSS,HTML,Make,Asm"
       "--kinds-all=*"
       "--fields=*"
       "--extras=*"
       "-R"
       "--exclude=.git"
       "--exclude=node_modules"
       "--exclude=build"
       "--exclude=dist"
       "--exclude=target"
       "--exclude=.cache"
       "--exclude=__pycache__"
       "--exclude=.venv"
       "--exclude=venv"
       "--exclude=*.min.js"
       "--exclude=*.min.css"
       "--exclude=*.o"
       "--exclude=*.a"
       "--exclude=*.so"
       "--exclude=*.class"))

  (citre-auto-enable-citre-mode-modes '(prog-mode))

  :config
  (with-eval-after-load 'cc-mode
    (add-hook 'c-mode-hook #'citre-mode)
    (add-hook 'c++-mode-hook #'citre-mode))
  (with-eval-after-load 'c-ts-mode
    (add-hook 'c-ts-mode-hook #'citre-mode)
    (add-hook 'c++-ts-mode-hook #'citre-mode))
  (add-hook 'python-mode-hook #'citre-mode)
  (add-hook 'python-ts-mode-hook #'citre-mode)
  (add-hook 'rust-mode-hook #'citre-mode)
  (add-hook 'rust-ts-mode-hook #'citre-mode)
  (add-hook 'java-mode-hook #'citre-mode)
  (add-hook 'java-ts-mode-hook #'citre-mode)
  (add-hook 'js-mode-hook #'citre-mode)
  (add-hook 'js-ts-mode-hook #'citre-mode)
  (add-hook 'typescript-ts-mode-hook #'citre-mode)
  (add-hook 'tsx-ts-mode-hook #'citre-mode)
  (add-hook 'haskell-mode-hook #'citre-mode)
  (add-hook 'lua-ts-mode-hook #'citre-mode)
  (add-hook 'css-mode-hook #'citre-mode)
  (add-hook 'css-ts-mode-hook #'citre-mode)
  (add-hook 'html-ts-mode-hook #'citre-mode))

;; ---------------------------------------------------------------------------
;; Keybinding summary (under C-c t prefix):
;;   j — jump to definition
;;   p — peek definition
;;   u — update/create tags file
;;   r — jump to reference (GNU Global)
;; ---------------------------------------------------------------------------

(provide 'init-tags)

;;; init-tags.el ends here
