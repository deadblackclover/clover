;;; lisp-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;; racket-run
(add-hook 'racket-mode-hook (lambda () 
			      (define-key racket-mode-map (kbd "C-r") 'racket-run)))

(defun clover/new-racket () 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled")) 
  (setq initial-major-mode (quote racket-mode)) 
  (funcall initial-major-mode))

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
(provide 'lisp-setting)
