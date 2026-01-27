;;; init-mu4e.el --- mu4e - Email/Newsfeed Client -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-src/mu4e-1.10.8")

(use-package mu4e
  :ensure nil  ;; It's bundled with mu
  :load-path "/usr/share/emacs/site-lisp/elpa-src/mu4e-1.10.8"
  :config
  (setq mu4e-maildir "~/Mail/gmail"
    mu4e-get-mail-command "mbsync -a"
    mu4e-update-interval 300
    user-mail-address "s.kumailshirazi@gmail.com"
    user-full-name "Syed Kumail Hussain Sherazi"
    
    ;; SMTP settings for sending
    message-send-mail-function 'smtpmail-send-it
    smtpmail-smtp-server "smtp.gmail.com"
    smtpmail-smtp-service 587
    smtpmail-stream-type 'starttls
    smtpmail-smtp-user "s.kumailshirazi@gmail.com"
    
    ;; Don't ask for confirmation
    mu4e-confirm-quit nil)
  )

(provide 'init-mu4e)

;;; init-mu4e.el ends here
