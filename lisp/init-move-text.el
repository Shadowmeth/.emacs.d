;;; init-move-text.el --- Move-Text - Move lines / regions up and down -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings) ;; M-<up> and M-<down> for keybinds

  ;; Re-indent the text in-and-around a text move
  (defun indent-region-advice (&rest ignored)
    (let ((deactivate deactivate-mark))
      (if (region-active-p)
        (indent-region (region-beginning) (region-end))
        (indent-region (line-beginning-position) (line-end-position)))
      (setq deactivate-mark deactivate)))

  (advice-add 'move-text-up :after 'indent-region-advice)
  (advice-add 'move-text-down :after 'indent-region-advice)
  )

(provide 'init-move-text)

;;; init-move-text.el ends here
