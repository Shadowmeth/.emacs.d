;;; init-git-gutter-fringe.el --- Git status indicators - doesn't work on tty -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package git-gutter-fringe
  :ensure t
  :config
  ;; This is still better than enabling it globally
  (add-hook 'prog-mode-hook (lambda ()
                              (git-gutter-mode +1)))
  (add-hook 'conf-mode-hook (lambda ()
                              (git-gutter-mode +1)))

  )

(provide 'init-git-gutter-fringe)

;;; init-git-gutter-fringe.el ends here
