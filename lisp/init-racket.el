;;; init-racket.el --- Racket - Major mode for racket programming lang -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package racket-mode
  :ensure t
  :config
  (add-hook 'racket-mode (lambda ()
                           (electric-pair-mode -1)
                           ))
  )

(provide 'init-racket)

;;; init-racket.el ends here
