;;; init-gnus.el --- Gnus - Email/Newsfeed Client -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package gnus
  :ensure nil
  :config
  (setq user-mail-address "skhsherazi@teresol.com"
    user-full-name "Syed Kumail Hussain Sherazi")
  
  ;; Fix HELO name issue
  (setq smtpmail-local-domain "teresol.com")

  (setq smtpmail-auth-credentials 'auth-source
    smtpmail-smtp-user "skhsherazi@teresol.com")

  ;; SMTP configuration for cPanel email
  ;; SMTP configuration - SSL on port 465
  (setq message-send-mail-function 'smtpmail-send-it
    smtpmail-smtp-server "mail.teresol.com"
    smtpmail-smtp-service 465
    smtpmail-stream-type 'ssl
    smtpmail-local-domain "teresol.com"
    smtpmail-smtp-user "skhsherazi@teresol.com")

  ;; For reading email
  (setq gnus-select-method
    '(nnimap "teresol"
       (nnimap-address "mail.teresol.com")
       (nnimap-server-port 993)
       (nnimap-stream ssl)
       (nnimap-user "skhsherazi@teresol.com")))

  (setq gnus-select-method '(nntp "news.gmane.io"))
  
  )

(provide 'init-gnus)

;;; init-gnus.el ends here
