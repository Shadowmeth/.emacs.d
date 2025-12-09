;;; init-yasnippet.el --- Yasnippet - snippets support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package yasnippet-snippets
  :ensure nil
  )

(use-package yasnippet-capf
  :ensure t
  )

(use-package yasnippet
  :ensure t
  :config
  (setq yas-verbosity 0)
  (yas-global-mode 1)

  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  )

(require 'corfu)
(with-eval-after-load 'yasnippet
  (add-hook 'yas-keymap-disable-hook
    (lambda ()
      (and (bound-and-true-p corfu-mode)
        (boundp 'corfu--frame)
        (frame-live-p corfu--frame)
        (frame-visible-p corfu--frame)))))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
