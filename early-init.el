;;; early-init.el --- Mostly set variables and initial settings here before we get to init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq pgtk-wait-for-event-timeout 0) ;; Don't delay waiting for GTK events after making changes to GUI
(setenv "GDK_BACKEND" "x11")

(setenv "LSP_USE_PLISTS" "false")

(setenv "SHELL" "/usr/bin/zsh")

(when (and (getenv "XDG_SESSION_TYPE")
        (string= (getenv "XDG_SESSION_TYPE") "wayland"))
  
  ;; Start Emacs in maximized mode
  (toggle-frame-maximized)
  ;; and hide title bar
  (add-hook 'window-size-change-functions
    #'frame-hide-title-bar-when-maximized))

;;; early-init.el ends here
