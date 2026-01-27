;;; init-gnus.el --- Gnus - Email/Newsfeed Client -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package gnus
  :ensure nil
  :config
  (setq user-mail-address "s.kumailshirazi@gmail.com"
    user-full-name "Syed Kumail Hussain Sherazi")

  (setq gnus-select-method
    '(nnimap "gmail"
       (nnimap-address "imap.gmail.com")
       (nnimap-server-port 993)
       (nnimap-stream ssl)
       (nnimap-user "s.kumailshirazi@gmail.com")))

  (setq gnus-secondary-select-methods
    '((nntp "news.gmane.io")))

  (setq message-send-mail-function 'smtpmail-send-it
    smtpmail-smtp-server "smtp.gmail.com"
    smtpmail-smtp-service 587
    smtpmail-stream-type 'starttls
    smtpmail-smtp-user "s.kumailshirazi@gmail.com")
  )

(provide 'init-gnus)

;;; init-gnus.el ends here
