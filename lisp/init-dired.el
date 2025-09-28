;;; init-dired.el --- Dired - file manager -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'dired-x)
(setq dired-omit-files
  (concat dired-omit-files "\\|^\\..+$")) ;; hide all dotfiles
(add-hook 'dired-mode-hook #'dired-omit-mode)
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
;; keep a single dired buffer
(setq dired-kill-when-opening-new-dired-buffer t)

(provide 'init-dired)

;;; init-dired.el ends here
