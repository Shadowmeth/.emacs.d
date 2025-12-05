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
  (corfu-auto-delay 0.1)
  (corfu-popupinfo-delay 0.1)
  (corfu-auto-prefix 2)
  (corfu-preselect nil)
  (corfu-quit-no-match t)
  ;; (corfu-quit-at-boundary nil) uncomment this line to use space as seprator in corfu completions
  :bind
  ;; (:map corfu-map
  ;;   ("TAB" . corfu-next)
  ;;   ([tab] . corfu-next)
  ;;   ("S-TAB" . corfu-previous)
  ;;   ([backtab] . corfu-previous)
  ;;   )
  :config
  (setq corfu-on-exact-match nil)
  (setq corfu-separator ?\s)
  (setq corfu-popupinfo-max-height 30)
  
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode)
  )

(advice-add #'lsp-completion-at-point :around #'cape-wrap-noninterruptible)
(advice-add #'yasnippet-capf :around #'cape-wrap-noninterruptible)
(advice-add #'cape-dabbrev :around #'cape-wrap-noninterruptible)
(advice-add #'cape-keyword :around #'cape-wrap-noninterruptible)

;; Uncomment the following snippet to use <TAB> for selecting candidate
;; and keeping enter key for newline
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "<return>") nil)
  (define-key corfu-map (kbd "RET") nil)
  )

;; The following snippet is to make corfu manual (use Tab to trigger corfu and indent)
(require 'corfu)
(defun my/corfu-popup-visible-p ()
  "Return non-nil if Corfu popup is currently visible."
  (and (boundp 'corfu--overlay)
    corfu--overlay))

(defun my/tab-indent-or-complete ()
  "Indent or trigger Corfu completion."
  (interactive)
  (if (my/corfu-popup-visible-p)
    ;; Popup visible → don't interfere, just indent normally
    (indent-for-tab-command)

    ;; Popup not visible → try indent first
    (let ((pos (point)))
      (indent-for-tab-command)
      (when (= pos (point))             ; indentation did nothing
        (completion-at-point)))))

;; (global-set-key (kbd "TAB") #'my/tab-indent-or-complete)
;; (global-set-key (kbd "<tab>") #'my/tab-indent-or-complete)

(provide 'init-corfu)

;;; init-corfu.el ends here
