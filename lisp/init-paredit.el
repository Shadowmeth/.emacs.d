;;; init-paredit.el --- Paredit - Structural Editing -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package paredit
  :ensure t
  :hook (
          racket-mode
          )
  )

(provide 'init-paredit)

;;; init-paredit.el ends here
