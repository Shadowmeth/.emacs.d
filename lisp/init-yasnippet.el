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
  (setq yas-verbosity 0)
  (yas-global-mode 1)

  (define-key yas-keymap (kbd "C-j") 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap (kbd "C-k") 'yas-prev-field)
  (define-key yas-keymap (kbd "TAB") nil)
  (define-key yas-keymap (kbd "<tab>") nil)
  (define-key yas-keymap (kbd "SPC") nil)
  )

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here

