;;; lisp-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(defun clover-new-racket () 
  "Create a Racket file" 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled.rkt")) 
  (setq initial-major-mode (quote racket-mode)) 
  (funcall initial-major-mode))

;; racket-run
(add-hook 'racket-mode-hook (lambda () 
			      (define-key racket-mode-map (kbd "<f5>") 'racket-run)))

;; elisp-format-buffer
(add-hook 'emacs-lisp-mode-hook (lambda () 
				  (define-key emacs-lisp-mode-map (kbd "C-i")
				    'elisp-format-buffer)))

(add-hook 'lisp-mode-hook (lambda () 
			    (define-key lisp-mode-map (kbd "C-i") 'elisp-format-buffer)))

(add-hook 'scheme-mode-hook (lambda () 
			      (define-key scheme-mode-map (kbd "C-i") 'elisp-format-buffer)))

(add-hook 'racket-mode-hook (lambda () 
			      (define-key racket-mode-map (kbd "C-i") 'elisp-format-buffer)))

;; ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'scheme-mode-hook 'turn-on-eldoc-mode)
(add-hook 'racket-mode-hook 'turn-on-eldoc-mode)

(provide 'lisp-setting)
