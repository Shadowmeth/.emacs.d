;;; init-avy.el --- Company - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make company look fancier
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-doc-delay 0.1)
  )

;; Show candidates based on recency and frequency
(use-package company-statistics
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-statistics-mode)
  )

(use-package company
  :ensure t
  :init
  (defun my/setup-lsp-company()
    (setq-local company-backends
      '((company-capf company-yasnippet company-keywords company-files company-dabbrev-code)))
    (setq-local company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
         company-preview-if-just-one-frontend)))
  (defun my/lsp-mode-setup-completion-company ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
      '(orderless)))
  (add-hook 'lsp-completion-mode-hook #'my/setup-lsp-company)
  (add-hook 'lsp-completion-mode-hook #'my/lsp-mode-setup-completion-company)
  :config
  (setq company-idle-delay 0.05)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-downcase t)
  
  (global-company-mode)
  )

(add-hook 'company-completion-started-hook #'redisplay)
(add-hook 'company-completion-finished-hook #'redisplay)
(add-hook 'company-completion-cancelled-hook #'redisplay)

(provide 'init-company)

;;; init-company.el ends here
