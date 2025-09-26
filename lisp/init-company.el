;;; init-avy.el --- Company - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make company look fancier
;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-box-doc-delay 0.01)
;;   )

(use-package company-quickhelp
  :ensure t
  :after company
  :custom
  (company-quickhelp-delay 0.01)
  :config
  (company-quickhelp-mode 1)
  )

(use-package company
  :ensure t
  :init
  (defun my/setup-lsp-company()
    (setq-local company-backends
		'((company-capf company-yasnippet company-dabbrev company-dabbrev-code))))
  (add-hook 'lsp-completion-mode-hook #'my/setup-lsp-company)
  :config
  (setq company-idle-delay 0.01)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-downcase t)
  
  (global-company-mode)
  )

(provide 'init-company)

;;; init-company.el ends here
