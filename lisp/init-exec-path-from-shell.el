;;; init-exec-path-from-shell.el --- Get exec-path from shell config file -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "OPENROUTER_API_KEY")
  )

(provide 'init-exec-path-from-shell)

;;; init-exec-path-from-shell.el ends here
