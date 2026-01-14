;;; init-treesitter.el --- Treesitter - Modern, Accurate, Fast syntax highlighting -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq treesit-language-source-alist
  '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (java "https://github.com/tree-sitter/tree-sitter-java")
     (make "https://github.com/alemuller/tree-sitter-make")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (java "https://github.com/tree-sitter/tree-sitter-java")
     ))

(setq major-mode-remap-alist
  '((c-mode . c-ts-mode)
     (bash-mode . bash-ts-mode)
     (js-mode . js-ts-mode)
     (javascript-mode . js-ts-mode)
     (c++-mode . c++-ts-mode)
     (java-mode . java-ts-mode)
     (rust-mode . rust-ts-mode)
     (typescript-mode . typescript-ts-mode)
     (json-mode . json-ts-mode)
     (css-mode . css-ts-mode)
     (python-mode . python-ts-mode)))

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))

;; Quick to quickly all the grammars in `treesit-language-source-alist`
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

(provide 'init-treesitter)

;;; init-treesitter.el ends here
