;;; init-web-mode.el --- Web mode -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defvar my/web-mode-lsp-extensions '("html" "jsx" "tsx")
  "List of file extensions where LSP should run in `web-mode`."
  )

(defun my/web-mode-setup ()
  "Enable LSP in `web-mode` only for selected extensions."
  (when buffer-file-name
    (let ((ext (file-name-extension buffer-file-name)))
      (when (member ext my/web-mode-lsp-extensions)
        (lsp-deferred)))))

(defun my/web-mode-indentation ()
  "Set indentation for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(use-package web-mode
  :ensure t
  :mode
  (
    ("\\.ejs\\'" . web-mode)
    )
  :config
  (add-hook 'web-mode-hook #'my/web-mode-indentation)
  (add-hook 'web-mode-hook #'my/web-mode-setup)
  )

(provide 'init-web-mode)

;;; init-web-mode.el ends here
