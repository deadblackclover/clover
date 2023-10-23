;;; window-setting.el --- Window setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'reverse-im)

(require 'xmr-ticker)
(require 'oxen-ticker)

(setq-default frame-title-format (concat "%b - Happy Hacking! - Clover " clover-version))

;; Set default font
(cond ((string-equal system-type "windows-nt")      ;; Microsoft Windows
       (when (member "Consolas" (font-family-list))
         (set-frame-font "Consolas" t t)))
      ((string-equal system-type "darwin")          ;; MacOS
       (when (member "Menlo" (font-family-list))
         (set-frame-font "Menlo" t t)))
      ((string-equal system-type "gnu/linux")       ;; Linux
       (when (member "Ubuntu Mono" (font-family-list))
         (set-frame-font "Ubuntu Mono 12" t t))))

(if window-system (tool-bar-mode -1))
(if window-system (menu-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(tab-bar-mode 1)                     ;; tab bar mode
(display-battery-mode 1)             ;; battery status
(global-display-line-numbers-mode 1) ;; global line mode
(display-time-mode 1)                ;; display time
(scroll-bar-mode -1)                 ;; disable scroll bars

(setq column-number-mode t) ;; Column and line

(set-default 'truncate-lines t) ;; Truncate line

(nyan-mode) ;; Activate nyan-mode

(treemacs-git-mode 'deferred) ;; Activate git mode for treemacs

(reverse-im-activate "russian-computer") ;; Activate Reverse-im

(global-diff-hl-mode)   ;; Activate diff-hl
(global-hl-todo-mode t) ;; Activate hl-todo

;;Optional: You can setup the fetch interval
;;default: 10 secs
(setq xmr-ticker-api-poll-interval 60)
(setq oxen-ticker-api-poll-interval 60)

;;Enable xmr-ticker-mode
(xmr-ticker-mode 1)
;;Enable oxen-ticker-mode
(oxen-ticker-mode 1)

(defun clover-set-transparency ()
  "Set the window strength."
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 50)))

(defun clover-unset-transparency ()
  "Unset the window strength."
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 . 100)))

(provide 'window-setting)
;;; window-setting.el ends here
