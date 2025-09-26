;;; init-corfu.el --- Corfu - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; kind-icon - icons for corfu completion
(use-package kind-icon
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-auto-delay 0.05)
  (corfu-popupinfo-delay 0.05)
  (corfu-auto-prefix 1)
  (corfu-preselect nil)
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary nil)
  :config
  (setq corfu-separator ?\s)
  (setq corfu-popupinfo-max-height 20)
  
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

(provide 'init-corfu)

;;; init-corfu.el ends here
