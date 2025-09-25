;;; init-orderless.el --- Orderless - Fuzzy completion -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package orderless
  :ensure t
  :custom
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)

  ;; Use orderless-flex is a little to lax for in buffer auto completion
  ;; (orderless-matching-styles '(orderless-flex orderless-literal orderless-regexp))
  (orderless-matching-styles '(orderless-literal orderless-regexp))
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t) ;; Emacs 31: partial-completion behaves like substring
  )

(provide 'init-orderless)

;;; init-orderless.el ends here
