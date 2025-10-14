;;; init-corfu.el --- Corfu - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; kind-icon - icons for corfu completion
(use-package kind-icon
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  )

;; Cape - capf extensions for Corfu
(use-package cape
  :ensure t
  :config
  (add-hook 'lsp-completion-mode-hook (lambda ()
					(setq-local completion-at-point-functions
						    (list
						     #'cape-file
						     (cape-capf-buster
						      (cape-capf-super
						       #'lsp-completion-at-point
						       #'yasnippet-capf
						       #'cape-dabbrev
						       #'cape-keyword))))))
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-auto-delay 0.05)
  (corfu-popupinfo-delay 0.05)
  (corfu-auto-prefix 2)
  (corfu-preselect nil)
  (corfu-quit-no-match t)
  ;; (corfu-quit-at-boundary nil) uncomment this line to use space as seprator in corfu completions
  :config
  (setq corfu-separator ?\s)
  (setq corfu-popupinfo-max-height 20)
  
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

;; Uncomment the following snippet to use <TAB> for selecting candidate
;; and keeping enter key for newline
;; (with-eval-after-load 'corfu
;;   (define-key corfu-map (kbd "<return>") nil)
;;   (define-key corfu-map (kbd "RET") nil)
;;   )

(provide 'init-corfu)

;;; init-corfu.el ends here
