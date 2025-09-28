;;; init-aidermacs.el --- Aidermacs git client -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu))
  :custom
  (aidermacs-default-model "openrouter/x-ai/grok-4-fast:free")
  (setq aidermacs-backend 'vterm)
  (setq aidermacs-exit-kills-buffer t)
  )

(provide 'init-aidermacs)

;;; init-aidermacs.el ends here
