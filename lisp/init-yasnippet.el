;;; init-yasnippet.el --- Yasnippet - snippets support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package yasnippet-snippets
  :ensure t
  )

(use-package yasnippet-capf
  :ensure t
  )

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
