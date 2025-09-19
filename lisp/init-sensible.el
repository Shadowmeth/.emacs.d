;;; init-sensible.el --- Defaults, built-in settings and built-in plugins -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Custom file
(let ((custom-file (expand-file-name ".emacs.custom.el" user-emacs-directory)))
  ;; Ensure the file exists
  (unless (file-exists-p custom-file)
    (with-temp-buffer (write-file custom-file)))
  ;; Use custom-file for `customize` variables
  (setq custom-file custom-file)
  (load-file custom-file)
  )

;; Stop warning prompt for some commands. There's always undo.
(progn
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil)
  )

;; Clean up ui clutter
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Use y-or-n instead of yes-or-n
(setq use-short-answers t)

;; Show column number in modeline
(column-number-mode 1)

;; Show matching brackets
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Start the initial Emacs frame in maximized mode
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable startup screen and display a custom message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message ";;; Welcome Syed Kumail Hussain Sherazi\n;;; Happy hacking\n")

;; Disable the bell (both audio and visual)
(setq ring-bell-function 'ignore)

;; Hide the initial frame decorations
(setq default-frame-alist '((undecorated . t)))
;; The following 2 lines allow resizing of frame with mouse by adding a border to the frame
;;(add-to-list 'default-frame-alist '(drag-internal-border . 1))
;;(add-to-list 'default-frame-alist '(internal-border-width . 2))

;; Font - change height to modify the global scale
(set-face-attribute 'default nil :font "JetBrains Mono" :height 150)

;; Line numbers
;; (global-display-line-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; Disable #auto-save# backup
(setq auto-save-default nil)
;; Don't create #./lock file links
(setq create-lockfiles nil)
;; Disable automatic backup~ files
(setq make-backup-files nil)

;; Save cursor position (by default in "~/.emacs.d/places")
(save-place-mode 1)

;; Disable recentf mode
(recentf-mode -1)

(provide 'init-sensible)

;;; init-sensible.el ends here
