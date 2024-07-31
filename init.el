;;; init.el --- Init file
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(package-initialize)

;; Global Variables
(defvar clover-version "v1.7.0")
(defvar clover-path (file-name-directory (or load-file-name
                                             buffer-file-name)))

(add-to-list 'load-path (expand-file-name "lisp"
                                          user-emacs-directory))

(add-to-list 'load-path (expand-file-name "lisp/lang"
                                          user-emacs-directory))

;; Installing packages if they are not installed
(require 'install-packages)
(clover-install-packages)

(require 'clover-dashboard)
(require 'emms-setting)
(require 'eshell-setting)
(require 'keyboard-setting)
(require 'lang-setting)
(require 'magit-setting)
(require 'whitespace-setting)
(require 'window-setting)

;; stop creating backup~ files
(setq make-backup-files nil)

;; stop creating #autosave# files
(setq auto-save-default nil)

;; stop creating .#lock files
(setq create-lockfiles nil)

;; Disables the start screen
(setq inhibit-startup-message t)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Load theme
(add-hook 'after-init-hook (lambda ()
                             (load-theme 'ef-tritanopia-dark t)))

;; Custom file
(setq custom-file (concat clover-path ".clover"))
(write-region "" nil custom-file)
(load custom-file)

;; Emms setup
(emms-minimalistic)

;; Players used by Emms
(setq emms-player-list '(emms-player-mplayer emms-player-vlc))

;; Getting minimal information about the track
(setq emms-info-functions '(emms-info-native))

;; Recent files
(recentf-mode 1)

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

;; Company
(add-hook 'after-init-hook 'global-company-mode)

;; Paredit mode
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'racket-mode-hook           'enable-paredit-mode)
(add-hook 'clojure-mode-hook          'enable-paredit-mode)

;; Rainbow parentheses
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook       'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook     'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook     'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook    'rainbow-delimiters-mode)

;; Activate flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Open dashboard
(clover-dashboard-open)

(defun clover-reload-configuration ()
  "Reload configuration."
  (interactive)
  (load-file (concat user-emacs-directory "init.el")))

(provide 'init)
;;; init.el ends here
