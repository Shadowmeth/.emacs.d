;;; init.el --- No config here, just load other modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make sure ~/.emacs.d/lisp/ exists and then add it load-path
(let ((lisp-dir (expand-file-name "lisp" user-emacs-directory)))
  (when (file-directory-p lisp-dir)
    (add-to-list 'load-path lisp-dir)))

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
(require 'init-projectile)
(require 'init-orderless)
(require 'init-vertico)
(require 'init-marginalia)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
