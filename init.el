;;; init.el --- Init file
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(package-initialize)

;; Global Variables
(setq clover-version "v0.3.0")
(setq clover-path (file-name-directory (or load-file-name
                                           buffer-file-name)))

;; Custom file
(setq custom-file (concat clover-path ".clover"))
(write-region "" nil custom-file)
(load custom-file)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/mode" user-emacs-directory))

;; Install packages
(require 'install-packages)
(clover-install-packages)

(require 'clover-buffer)
(require 'window)
(require 'keyboard)

;; Language setting
(require 'lisp-setting)
(require 'c-setting)
(require 'rust-setting)
(require 'python-setting)
(require 'node-setting)
(require 'scala-setting)
(require 'java-setting)
(require 'other-lang-setting)

;; Eshell
(require 'eshell-setting)

;; Setting
(setq make-backup-files nil) ;; stop creating backup~ files
(setq auto-save-default nil) ;; stop creating #autosave# files
(setq create-lockfiles nil)  ;; stop creating .#lock files

(setq-default indent-tabs-mode nil) ;; No tabs

(add-hook 'after-init-hook (lambda ()
                             (load-theme 'cyberpunk t)))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

;; Company
(add-hook 'after-init-hook    'global-company-mode)
(add-hook 'solidity-mode-hook 'company-solidity)

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
