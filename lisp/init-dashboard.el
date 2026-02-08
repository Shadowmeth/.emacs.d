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
  
(setq dashboard-items '((recents . 5)
                           (bookmarks . 5)
                           (projects . 5)
                           (agenda . 5)))
  
  (setq dashboard-item-shortcuts '((recents . "r")
                                    (bookmarks . "m")
                                    (projects . "p")
                                    (agenda . "a")
                                    (registers . "e")))
  (setq dashboard-display-icons-p t) ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  )

(provide 'init-dashboard)

;;; init-dashboard.el ends here
