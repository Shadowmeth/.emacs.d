;;; init.el --- No config here, just load other modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make sure ~/.emacs.d/lisp/ exists and then add it load-path
(let ((lisp-dir (expand-file-name "lisp" user-emacs-directory)))
  (when (file-directory-p lisp-dir)
    (add-to-list 'load-path lisp-dir)))

;; Custom file
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load-file custom-file)

(require 'init-sensible)
(require 'init-buffer-zoom)
(require 'init-magit)
(require 'init-gcmh)
(require 'init-exec-path-from-shell)
(require 'init-nerd-icons)
(require 'init-pdf-tools)
(require 'init-doom)
(require 'init-paredit)
(require 'init-avy)
(require 'init-expand-region)
(require 'init-ace-window)
(require 'init-zzz-to-char)
(require 'init-multiple-cursors)
(require 'init-vterm)
(require 'init-orderless)
(require 'init-vertico)
(require 'init-embark)
(require 'init-marginalia)
(require 'init-consult)
(require 'init-flycheck)
(require 'init-corfu)
(require 'init-yasnippet)
(require 'init-eglot)
(require 'init-prettier)
(require 'init-dired)
(require 'init-org)

;; language specific config
(require 'init-racket)

;; these packages should be loaded the last
(require 'init-treesitter)
(require 'init-modes)
(require 'init-indentation)
(provide 'init)
;;; init.el ends here
