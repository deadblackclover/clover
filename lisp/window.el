;;; window.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(require 'em-term)

(setq-default frame-title-format (concat "%b - Happy Hacking! - Clover Emacs " clover/version))

(if window-system (tool-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(display-battery-mode 1) ;; battery status
(global-linum-mode t)	 ;; global line mode
(display-time-mode 1)	 ;; display time

(setq column-number-mode t) ;; Column and line

(set-default 'truncate-lines t) ;; Truncate line

(nyan-mode) ;; Activate nyan-mode

(neotree) ;; Activate neotree

;; Eshell
(add-to-list 'eshell-visual-commands "cmus")
(add-to-list 'eshell-visual-commands "htop")
(add-to-list 'eshell-visual-commands "ssh")
(add-to-list 'eshell-visual-commands "tail")

(add-to-list 'eshell-visual-commands "make")

(add-to-list 'eshell-visual-commands "cargo")

(provide 'window)
