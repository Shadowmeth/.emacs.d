;;; init-flycheck.el --- Flycheck - Modern syntax checking and linting -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  )

(use-package flycheck
  :ensure t
  :config
  (setq flycheck-idle-change-delay 1)
  (setq flycheck-display-errors-delay 0.1)
  (global-flycheck-mode)
  )

(provide 'init-flycheck)

;;; init-flycheck.el ends here
