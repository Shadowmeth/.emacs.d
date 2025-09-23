;;; init-expand-region.el --- Incremental selection -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(provide 'init-expand-region)

;;; init-expand-region.el ends here
