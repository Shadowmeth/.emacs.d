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
  (setq flycheck-idle-change-delay 0.5)
  (setq flycheck-display-errors-delay 0.4)
  (setq flycheck-highlighting-mode nil)
  (global-flycheck-mode)
  )

(provide 'init-flycheck)

;;; init-flycheck.el ends here
