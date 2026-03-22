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
  :bind
  (:map company-active-map
    ("TAB" . company-complete-selection)
    ("<tab>" . company-complete-selection)
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ("<return>" . company-complete-selection)
    ("RET" . company-complete-selection)
    ("<escape>" . company-abort)
    )
  :config
  (setq company-idle-delay nil) ;; set to timer to make company popup automatic
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

