;;; init.el --- Bootstrap literate config -*- lexical-binding: t; -*-

;; Bootstrap straight.el (used only for packages not on MELPA).
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Don't let straight build/install packages that are already in Emacs core.
;; Prevents stale straight copies from conflicting with the built-ins.
(dolist (pkg '(project eglot jsonrpc flymake eldoc xref))
  (add-to-list 'straight-built-in-pseudo-packages pkg))

;; Ensure straight's Org takes precedence over Emacs's built-in Org
;; before org-babel-load-file triggers Org loading.
(straight-use-package 'org)

;;; Load the literate configuration
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))
