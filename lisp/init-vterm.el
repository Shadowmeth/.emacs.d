;;; init-vterm.el --- Vterm - Fast terminal in Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package vterm
  :init
  (defun my/vterm (&optional arg)
    "Open a new vterm. Prompt for the buffer name with prefix ARG."
    (interactive "P")
    (if arg
      ;; Ask a custom buffer name
      (let ((name (read-string "vterm buffer name: ")))
        (vterm (format "*VTERM-%s*" (upcase name))))
      ;; Otherwise use default naming (*vterm*, *vterm*<2>, …)
      (let ((buf (generate-new-buffer-name "*vterm*")))
        (vterm buf))))
  :ensure t
  :config
  (setq vterm-buffer-name-string "VTERM %s")
  )

(provide 'init-vterm)

;;; init-vterm.el ends here
