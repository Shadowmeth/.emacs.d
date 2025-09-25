;;; init-corfu.el --- Corfu - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

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
  (corfu-preselect nil)
  (corfu-quit-no-match t)
  :config
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

(provide 'init-corfu)

;;; init-corfu.el ends here
