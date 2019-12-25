;;; init.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'window)
(require 'keyboard)
(require 'clover-buffer)
(require 'auto-install-packages)

;; Setting
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files
(display-battery-mode 1) ;; battery status
(global-linum-mode t) ;; global line mode

(custom-set-variables
 '(custom-enabled-themes (quote (misterioso))))
(custom-set-faces)
