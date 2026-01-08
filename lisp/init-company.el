;;; init-avy.el --- Company - In-buffer completion engine -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make company look fancier
(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  (setq company-box-doc-delay 0.1)
  )

;; Show candidates based on recency and frequency
(use-package company-statistics
  :ensure t
  :config
  (add-hook 'after-init-hook 'company-statistics-mode)
  )

(use-package company
  :ensure t
  :init
  (defun my/setup-lsp-company()
    (setq-local company-backends
      '((company-capf company-yasnippet company-keywords company-files company-dabbrev-code)))
    (setq-local company-frontends
      '(company-pseudo-tooltip-unless-just-one-frontend
         company-preview-if-just-one-frontend)))
  (defun my/lsp-mode-setup-completion-company ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
      '(orderless)))
  (add-hook 'lsp-completion-mode-hook #'my/setup-lsp-company)
  (add-hook 'lsp-completion-mode-hook #'my/lsp-mode-setup-completion-company)
  :bind
  (:map company-active-map
    ("TAB" . company-complete-selection)
    ("<tab>" . company-complete-selection)
    ("C-n" . company-select-next)
    ("C-p" . company-select-previous)
    ("<return>" . company-complete-selection)
    ("RET" . company-complete-selection)
    ("<escape>" . company-abort)
    )
  :config
  (setq company-idle-delay nil) ;; set to timer to make company popup automatic
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  (setq company-require-match nil)
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-downcase t)

  (global-company-mode)
  )

(add-hook 'company-completion-started-hook #'redisplay)
(add-hook 'company-completion-finished-hook #'redisplay)
(add-hook 'company-completion-cancelled-hook #'redisplay)

;; Helper function to check if company popup is visible
(defun my/company-visible-p ()
  "Check if Company popup is currently visible."
  (and (bound-and-true-p company-mode)
       company-candidates))

;; Smart TAB: indent first, then trigger company if nothing changed
(defun my/tab-dwim-company ()
  "Smart TAB: indent or trigger company completion."
  (interactive)
  (cond
   ;; Don't interfere with minibuffer
   ((minibufferp)
    (completion-at-point))
   
   ;; If Company popup is visible, company-active-map handles it
   ((my/company-visible-p)
    (call-interactively #'company-complete-selection))
   
   ;; Otherwise: indent, and if no change, trigger completion
   (t
    (let ((old-point (point))
          (old-tick (buffer-chars-modified-tick)))
      (call-interactively #'indent-for-tab-command)
      ;; If nothing changed, trigger completion
      (when (and (= old-point (point))
                 (= old-tick (buffer-chars-modified-tick)))
        (company-complete))))))

;; Shift-TAB for Company navigation
(defun my/shift-tab-dwim-company ()
  "Smart Shift-TAB: navigate company backward."
  (interactive)
  (when (my/company-visible-p)
    (call-interactively #'company-select-previous)))

;; Only bind in prog-mode and text-mode
(defun my/setup-tab-for-completion-company ()
  "Setup TAB for completion in programming and text modes."
  (local-set-key (kbd "TAB") #'my/tab-dwim-company)
  (local-set-key (kbd "<tab>") #'my/tab-dwim-company)
  (local-set-key (kbd "S-TAB") #'my/shift-tab-dwim-company)
  (local-set-key (kbd "<backtab>") #'my/shift-tab-dwim-company))

(add-hook 'prog-mode-hook #'my/setup-tab-for-completion-company)
(add-hook 'text-mode-hook #'my/setup-tab-for-completion-company)
(add-hook 'conf-mode-hook #'my/setup-tab-for-completion-company)

(provide 'init-company)

;;; init-company.el ends here
