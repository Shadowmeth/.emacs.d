;;; init-yasnippet.el --- Yasnippet - snippets support -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package yasnippet-snippets
  :ensure t
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
  (define-key yas-minor-mode-map (kbd "SPC") nil)
  (define-key yas-keymap (kbd "C-j") 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap (kbd "C-k") 'yas-prev-field)
  )

(require 'corfu)
(with-eval-after-load 'yasnippet
  (add-hook 'yas-keymap-disable-hook
    (lambda ()
      (and (bound-and-true-p corfu-mode)
        (boundp 'corfu--frame)
        (frame-live-p corfu--frame)
        (frame-visible-p corfu--frame)))))

;; Integration with company
(with-eval-after-load 'company
  ;; Abort company when expanding a snippet
  (add-hook 'yas-before-expand-snippet-hook
    (lambda ()
      (when (bound-and-true-p company-mode)
        (company-abort))))

  ;; Use modern advice-add instead of defadvice
  (advice-add 'company-complete-common :around
    (lambda (orig-fun &rest args)
      "Don't complete if in an active yasnippet field."
      (if (yas-active-snippets)
        (yas-next-field-or-maybe-expand)
        (apply orig-fun args)))))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
