;;; window.el --- Window setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'reverse-im)

(require 'xmr-ticker)
(require 'oxen-ticker)

(setq-default frame-title-format (concat "%b - Happy Hacking! - Clover " clover-version))

(if window-system (tool-bar-mode -1))
(if window-system (menu-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(display-battery-mode 1) ;; battery status
(global-linum-mode t)	 ;; global line mode
(display-time-mode 1)	 ;; display time
(scroll-bar-mode -1)	 ;; disable scroll bars

(setq column-number-mode t) ;; Column and line

(set-default 'truncate-lines t) ;; Truncate line

(nyan-mode) ;; Activate nyan-mode

(treemacs) ;; Activate treemacs

(reverse-im-activate "russian-computer") ;; Activate Reverse-im

(global-diff-hl-mode) ;; Activate diff-hl
(global-hl-todo-mode t) ;; Activate hl-todo

;;Optional: You can setup the fetch interval
;;default: 10 secs
(setq xmr-ticker-api-poll-interval 10)
(setq oxen-ticker-api-poll-interval 10)

;;Enable xmr-ticker-mode
(xmr-ticker-mode 1)
;;Enable oxen-ticker-mode
(oxen-ticker-mode 1)

(provide 'window)
;;; window.el ends here
