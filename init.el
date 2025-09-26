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
(require 'init-magit)
(require 'init-gcmh)
(require 'init-nerd-icons)
(require 'init-doom)
(require 'init-avy)
(require 'init-expand-region)
(require 'init-zzz-to-char)
(require 'init-rainbow-delimiters)
(require 'init-multiple-cursors)
(require 'init-vterm)
(require 'init-projectile)
(require 'init-orderless)
(require 'init-vertico)
(require 'init-embark)
(require 'init-marginalia)
(require 'init-consult)
(require 'init-flycheck)
(require 'init-yasnippet)
(require 'init-corfu)
(require 'init-lsp-booster)
(require 'init-lsp-mode)

(provide 'init)
;;; init.el ends here
