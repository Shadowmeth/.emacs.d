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

;; asm-mode
(require 'asm-mode)
(add-hook 'asm-mode-hook (lambda ()
                           (setq indent-tabs-mode nil) ;; use spaces instead of tabs
                           ;; (electric-indent-mode -1) ;; indentation in asm-mode is annoying
                           (setq tab-stop-list (number-sequence 2 60 2))))

(define-key asm-mode-map (kbd "<ret>") 'newline-and-indent)

;; c and c++ (use spaces instead of tabs)
(add-hook 'c-mode-hook (lambda ()
                         (setq indent-tabs-mode nil)))
(add-hook 'c++-mode-hook (lambda ()
                           (setq indent-tabs-mode nil)))

;; c-ts and c++-ts (use spaces instead of tabs)
(add-hook 'c-ts-mode-hook (lambda ()
                            (setq indent-tabs-mode nil)))
(add-hook 'c++-ts-mode-hook (lambda ()
                              (setq indent-tabs-mode nil)))

(setq-default c-ts-mode-indent-offset 4)

(provide 'init-indentation)

;;; init-indentation.el ends here
