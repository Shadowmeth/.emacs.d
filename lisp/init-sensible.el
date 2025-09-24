;;; init-sensible.el --- Defaults, built-in settings and built-in plugins -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Make native compilation silent prune its cache
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent)
  (setq native-compile-prune-cache t))

;; Package repository setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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

;; Replace highlighted text
(delete-selection-mode 1)

;; Which-key
(setq which-key-idle-delay 0.01)
(which-key-mode)

;; Auto close brackets
(setq electric-pair-pairs
      '(
	(?\" . ?\")
	(?\{ . ?\})
	(?\[ . ?\])
	(?\` . ?\`)
	(?\' . ?\')
	))
(electric-pair-mode 1)

;; Enable editorconfig support
(require 'editorconfig)
(editorconfig-mode 1)

;; Display battery percentage
(display-battery-mode 1)

;; Display time
(display-time-mode 1)

;; Disable case-sensitivity and buffer matching when built-in completion styles are used
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

;; Enable minibuffer history
(savehist-mode t)

;; Enable context menu
(context-menu-mode t)

;; Support opening new minibuffers from inside existing minibuffers.
(setq enable-recursive-minibuffers t)

;; Hide commands in M-x which do not work in the current mode.
(setq read-extended-command-predicate #'command-completion-default-include-p)

(provide 'init-sensible)

;;; init-sensible.el ends here
