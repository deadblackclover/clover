;;; c-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(require 'disaster)

;; C
(defun clover/new-c () 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled.c")) 
  (setq initial-major-mode (quote c-mode)) 
  (funcall initial-major-mode))

(defun clover/c-mode-hook () 
  (setq c-set-style "k&r") 
  (setq c-basic-offset 4))
(add-hook 'c-mode-hook 'clover/c-mode-hook)

;; Compile command
(add-hook 'c-mode-hook (lambda () 
			 (set (make-local-variable 'compile-command) 
			      (format "gcc -o %s %s && ./%s" (file-name-base buffer-file-name) 
				      (buffer-file-name) 
				      (file-name-base buffer-file-name)))))

;; Disassemble
(add-hook 'c-mode-hook (lambda () 
			 (define-key c-mode-map (kbd "M-d") 'disaster)))

;; Compile and run
(add-hook 'c-mode-hook (lambda () 
			 (define-key c-mode-map (kbd "<f5>") 'compile)))

;; C++
(defun clover/new-c++ () 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled.cpp")) 
  (setq initial-major-mode (quote c++-mode)) 
  (funcall initial-major-mode))

(defun clover/c++-mode-hook () 
  (setq c-basic-offset 4))
(add-hook 'c++-mode-hook 'clover/c++-mode-hook)

;; Compile command
(add-hook 'c++-mode-hook (lambda () 
			   (set (make-local-variable 'compile-command) 
				(format "g++ -o %s %s && ./%s" (file-name-base buffer-file-name) 
					(buffer-file-name) 
					(file-name-base buffer-file-name)))))

;; Disassemble
(add-hook 'c++-mode-hook (lambda () 
			   (define-key c++-mode-map (kbd "M-d") 'disaster)))

;; Compile and run
(add-hook 'c++-mode-hook (lambda () 
			   (define-key c++-mode-map (kbd "<f5>") 'compile)))

(provide 'c-setting)
