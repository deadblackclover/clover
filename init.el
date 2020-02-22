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

(custom-set-variables '(custom-enabled-themes (quote (cyberpunk))))
(custom-set-faces)
