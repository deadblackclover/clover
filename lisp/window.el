;;; window.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(setq-default frame-title-format "%b - Happy Hacking! - Clover Emacs")

(if window-system
    (tool-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(display-battery-mode 1) ;; battery status
(global-linum-mode t) ;; global line mode
(display-time-mode 1) ;; display time

(provide 'window)
