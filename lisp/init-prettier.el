;;; init-prettier.el --- Prettier - Auto format most languages -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package prettier-js
  :ensure t
  :init
  (defun enable-minor-mode (my-pair)
    "Enable minor mode if filename match the regexp. MY-PAIR is a cons cell (regexp . minor-mode)."
    (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
        (funcall (cdr my-pair)))))
  :config
  (add-hook 'web-mode-hook #'(lambda ()
                               (enable-minor-mode
                                 '("\\.jsx?\\'" . prettier-js-mode))
                               (enable-minor-mode
                                 '("\\.tsx?\\'" . prettier-js-mode))
                               (enable-minor-mode
                                 '("\\.html\\'" . prettier-js-mode))
                               ))
  
  (add-hook 'js-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  (add-hook 'css-mode-hook 'prettier-js-mode)
  (add-hook 'js-json-mode-hook 'prettier-js-mode)
  (add-hook 'js-ts-mode-hook 'prettier-js-mode)
  (add-hook 'json-ts-mode 'prettier-js-mode)
  (add-hook 'typescript-ts-mode 'prettier-js-mode)
  (add-hook 'tsx-ts-mode 'prettier-js-mode)

  (setq prettier-js-command "prettierd")
  )

(provide 'init-prettier)

;;; init-prettier.el ends here
