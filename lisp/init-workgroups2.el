;;; init-workgroups2.el --- Workgroups2 - Session management for Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package workgroups2
  :ensure t
  :config
  (setq wg-workspace-file "~/.emacs.d/.emacs_workgroups")
  (setq wg-prefix-key "C-c z")
  (workgroups-mode 1)
  )

(provide 'init-workgroups2)

;;; init-workgroups2.el ends here
