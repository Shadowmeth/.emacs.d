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
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (add-hook 'completion-at-point-functions #'yasnippet-capf)
  :config
  (add-hook 'lsp-completion-mode-hook (lambda ()
					(setq-local completion-at-point-functions
					  (list
					    #'cape-file
                                            (cape-capf-buster
                                              (cape-capf-noninterruptible
						(cape-capf-super
                                                  #'lsp-completion-at-point ;; lsp-mode
                                                  ;; #'eglot-completion-at-point
						  #'yasnippet-capf
						  #'cape-dabbrev
						  #'cape-keyword)))))))
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-auto nil)
  (corfu-cycle t)
  (corfu-auto-delay 0.1)
  (corfu-popupinfo-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-preselect nil)
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary nil) ;; uncomment this line to use space as seprator in corfu completions
  :bind
  (:map corfu-map
    ("TAB" . corfu-insert)
    ("<tab>" . corfu-insert)
    ("C-n" . corfu-next)
    ("C-p" . corfu-previous)
    ("<return>" . corfu-insert)
    ("RET" . corfu-insert)
    ("<escape>" . corfu-quit)
    )
  :config
  (setq corfu-on-exact-match nil)
  (setq corfu-separator ?\s)
  (setq corfu-popupinfo-max-height 30)
  (setq tab-always-indent 'complete) ;; Use tab for both indentation and triggering Corfu

  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

;; (advice-add #'eglot-completion-at-point :around #'cape-wrap-noninterruptible)
(advice-add #'lsp-completion-at-point :around #'cape-wrap-noninterruptible)
(advice-add #'yasnippet-capf :around #'cape-wrap-noninterruptible)
(advice-add #'cape-dabbrev :around #'cape-wrap-noninterruptible)
(advice-add #'cape-keyword :around #'cape-wrap-noninterruptible)

(provide 'init-corfu)

;;; init-corfu.el ends here
