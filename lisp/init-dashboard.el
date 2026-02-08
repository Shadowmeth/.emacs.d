;;; init-dashboard.el --- Dashboard - Better startup screen -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-projects-backend 'project-el)
  (setq initial-buffer-choice 'dashboard-open) ;; Show dashboard in frames with emacsclient -s
  ;; all-the-icons and nerd-icons may require a refresh in order to be displayed correctly
  (add-hook 'server-after-make-frame-hook 'dashboard-open)
  )

(provide 'init-dashboard)

;;; init-dashboard.el ends here
