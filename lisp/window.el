;;; window.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(setq frame-title-format (format "%s - Happy Hacking! - Clover Emacs v%s" (buffer-name) emacs-version))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(display-battery-mode 1) ;; battery status
(global-linum-mode t) ;; global line mode

(provide 'window)
