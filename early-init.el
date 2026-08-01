;;; early-init.el -- Code that should be run before init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Suppress straight.el's complaint about coexisting with package.el.
;; We knowingly use both (package.el primary, straight for escape-hatch cases).
(require 'warnings)
(add-to-list 'warning-suppress-log-types '(straight))
(add-to-list 'warning-suppress-types '(straight))
 
;;; Frame: maximized, no title bar.
;; Maximize works across X11, Wayland (including WSLg), and macOS/Windows.
;; Undecorated (no title bar) works on X11 and PGTK/Wayland; on some WMs
;; it's a no-op. We set both via default-frame-alist so new frames inherit.

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(undecorated . t))

;; The initial frame is created before early-init/init finishes reading
;; default-frame-alist in some Emacs versions. Apply to the current frame
;; too, so the first frame also reflects the settings.
(when (display-graphic-p)
  (set-frame-parameter nil 'fullscreen 'maximized))

;; Use native JSON parsing for LSP mode
(setenv "LSP_USE_PLISTS" "false")

(provide 'early-init)
;;; early-init.el ends here
