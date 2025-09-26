(setq pgtk-wait-for-event-timeout 0) ;; Don't delay waiting for GTK events after making changes to GUI
(setenv "LSP_USE_PLISTS" "false")

(setenv "SHELL" "/usr/bin/zsh")
(add-to-list 'exec-path "~/.nvm/versions/node/v24.7.0/bin")
(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "~/.local/custom")

;; Start Emacs in maximized mode
(toggle-frame-maximized)
;; and hide title bar
(add-hook 'window-size-change-functions
	  #'frame-hide-title-bar-when-maximized)
