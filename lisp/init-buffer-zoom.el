;;; init-buffer-zoom.el --- Buffer-specific text scaling -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defvar my/buffer-zoom-level 2
  "Default zoom level for buffers. 1 = +1 step, 2 = +2 steps, etc.")

(defun my/buffer-text-scale-increase ()
  "Increase text scale in current buffer."
  (text-scale-increase my/buffer-zoom-level))

;; Apply zoom to programming modes
(add-hook 'prog-mode-hook #'my/buffer-text-scale-increase)

;; Apply zoom to text modes
(add-hook 'text-mode-hook #'my/buffer-text-scale-increase)

;; Apply zoom to conf modes
(add-hook 'conf-mode-hook #'my/buffer-text-scale-increase)

(provide 'init-buffer-zoom)

;;; init-buffer-zoom.el ends here
