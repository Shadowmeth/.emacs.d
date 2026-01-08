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
                                                #'lsp-completion-at-point
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
    ("TAB" . corfu-next)
    ("<tab>" . corfu-next)
    ("S-TAB" . corfu-previous)
    ("<backtab>" . corfu-previous)
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
;; (with-eval-after-load 'corfu
;;   (define-key corfu-map (kbd "<return>") nil)
;;   (define-key corfu-map (kbd "RET") nil)
;;   )

(require 'corfu)
(require 'yasnippet)
;; Helper function to check if Corfu popup is visible
(defun my/corfu-visible-p ()
  "Check if Corfu popup is currently visible."
  (and (featurep 'corfu)
       (boundp 'corfu--frame)
       corfu--frame
       (frame-visible-p corfu--frame)))

;; Simple TAB: trigger completion or indent
(defun my/tab-dwim ()
  "Smart TAB: trigger corfu or indent."
  (interactive)
  (cond
   ;; Don't interfere with minibuffer
   ((minibufferp)
    (call-interactively #'completion-at-point))
   
   ;; If Corfu popup is visible, navigate it
   ((my/corfu-visible-p)
    (call-interactively #'corfu-next))
   
   ;; Otherwise: indent, and if no change, trigger completion
   (t
    (let ((old-point (point))
          (old-tick (buffer-chars-modified-tick)))
      (call-interactively #'indent-for-tab-command)
      ;; If nothing changed, trigger completion
      (when (and (= old-point (point))
                 (= old-tick (buffer-chars-modified-tick)))
        (completion-at-point))))))

;; Shift-TAB for Corfu navigation
(defun my/shift-tab-dwim ()
  "Smart Shift-TAB: navigate corfu backward."
  (interactive)
  (when (my/corfu-visible-p)
    (call-interactively #'corfu-previous)))

;; Only bind in prog-mode and text-mode to avoid minibuffer issues
(defun my/setup-tab-for-completion ()
  "Setup TAB for completion in programming and text modes."
  (local-set-key (kbd "TAB") #'my/tab-dwim)
  (local-set-key (kbd "<tab>") #'my/tab-dwim)
  (local-set-key (kbd "S-TAB") #'my/shift-tab-dwim)
  (local-set-key (kbd "<backtab>") #'my/shift-tab-dwim))

(add-hook 'prog-mode-hook #'my/setup-tab-for-completion)
(add-hook 'text-mode-hook #'my/setup-tab-for-completion)

(provide 'init-corfu)

;;; init-corfu.el ends here
