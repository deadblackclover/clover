;;; init.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'window)
(require 'keyboard)
(require 'clover-buffer)

;; Setting
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files

(custom-set-variables
 '(custom-enabled-themes (quote (misterioso))))
(custom-set-faces)
