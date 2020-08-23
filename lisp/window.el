;;; window.el --- Window setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'reverse-im)

(setq-default frame-title-format (concat "%b - Happy Hacking! - Clover Emacs " clover-version))

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

(neotree) ;; Activate neotree

(reverse-im-activate "russian-computer") ;; Activate Reverse-im

(global-diff-hl-mode) ;; Activate diff-hl

(provide 'window)
;;; window.el ends here
