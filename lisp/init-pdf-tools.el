;;; init-pdf-tools.el --- View PDFs in Emacs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package saveplace-pdf-view
  :ensure t
  :config
  (save-place-mode 1)
  )

(use-package pdf-tools
  :ensure t
  :config
  (pdf-loader-install) ;; On demand loading, leads to faster startup time
  )

(provide 'init-pdf-tools)

;;; init-pdf-tools.el ends here
