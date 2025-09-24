;;; init-projectile.el --- Projectile - Project management -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  ;; note that this overrides project.el keymap
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  )

(provide 'init-projectile)

;;; init-projectile.el ends here
