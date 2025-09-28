;;; init-indentation.el --- Indentation settings for programming languages -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; c family
(require 'cc-mode)
(setq c-default-style "linux")
(setq c-basic-offset 4)

;; lisp
(setq lisp-body-indent 2)
(setq lisp-indent-offset 2)

;; js-ts
(setq js-indent-level 2)
(setq typescript-indent-level 2)
;; Use this if the above 2 lines don't work
;; (add-hook 'js-mode-hook
;;   (lambda ()
;;     (setq js-indent-level 2)))
;; (add-hook 'typescript-mode-hook
;;   (lambda ()
;;     (setq typescript-indent-level 2)))

(provide 'init-indentation)

;;; init-indentation.el ends here
