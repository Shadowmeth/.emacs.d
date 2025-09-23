;;; init-doom.el --- Doom-modeline  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-battery t)
  (setq doom-modeline-time t)
  )

(provide 'init-doom)

;;; init-doom.el ends here
