;;; init-vertico.el --- Vertico - Enhanced minibuffer -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode)
  )

(provide 'init-vertico)

;;; init-vertico.el ends here
