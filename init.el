;;; init.el --- Init file
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(package-initialize)

(setq clover-version "v0.1.2")
(setq clover-path (file-name-directory (or load-file-name buffer-file-name)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Language setting

(require 'clover-buffer)
(require 'window)
(require 'keyboard)

;; Language setting
(require 'lisp-setting)
(require 'c-setting)
(require 'rust-setting)
(require 'python-setting)

;; Eshell
(require 'eshell-setting)

;; Setting
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files

(add-hook 'after-init-hook (lambda () 
			     (load-theme 'cyberpunk t)))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

;; Paredit mode
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'racket-mode-hook           'enable-paredit-mode)

;; Rainbow parentheses
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook       'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook     'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook     'rainbow-delimiters-mode)

;; Activate flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init)
;;; init.el ends here
