;;; init-gcmh.el --- Garbage Collector Magic Hack -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defvar my-last-gc-time (current-time)
  "Time when the last garbage collection finished.")

(add-hook 'post-gc-hook
          (lambda ()
            (setq my-last-gc-time (current-time))))

(defun my/time-since-last-gc ()
  "Show and return seconds since the last garbage collection."
  (interactive)
  (let ((secs (float-time (time-subtract (current-time) my-last-gc-time))))
    (when (called-interactively-p 'any)
      (message "Time since last GC: %.2f seconds" secs))
    secs))

(use-package gcmh
  :ensure t
  :config
  (setq gcmh-idle-delay 2)
  ;;(setq gcmh-high-cons-threshold 2073741824)
  (gcmh-mode 1)
  )

(provide 'init-gcmh)

;;; init-gcmh.el ends here
