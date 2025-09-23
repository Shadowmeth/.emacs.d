;;; init-rainbow-delimiters.el --- Rainbow-Delimiters - fancy brackets coloring -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'conf-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'eshell-mode-hook #'rainbow-delimiters-mode)
  )

(provide 'init-rainbow-delimiters)

;;; init-rainbow-delimiters.el ends here
