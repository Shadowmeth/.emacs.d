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

  ;; Disable TAB key for snippet navigation
  (define-key yas-keymap (kbd "TAB") nil)
  (define-key yas-keymap (kbd "<tab>") nil)
  (define-key yas-keymap (kbd "SPC") nil)

  ;; This is key: bind TAB to nothing, allowing it to fall through
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)

  ;; Use C-j and C-k for navigation
  (define-key yas-keymap (kbd "C-j") 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap (kbd "C-k") 'yas-prev-field)
  )

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
