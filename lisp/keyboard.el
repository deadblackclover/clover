;;; keyboard.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;; File
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-w") 'kill-buffer)

;; Copy Paste
;; (global-set-key (kbd "C-z") 'undo)
;; (global-set-key (kbd "C-c") 'kill-ring-save) ;; Copy
;; (global-set-key (kbd "C-x") 'kill-region) ;; Cut
;; (global-set-key (kbd "C-v") 'yank) ;; Paste
(cua-mode 1)

;; Select Text
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; New scratch
(defun clover/new-scratch ()
  "Creates a new *scratch* buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

(global-set-key (kbd "C-n") 'clover/new-scratch)


;; New scratch org mode
(defun clover/new-scratch-org-mode ()
  "Creates a new *scratch* buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch org-mode*"))
  (org-mode))

(global-set-key (kbd "M-n") 'clover/new-scratch-org-mode)

;; racket-run
(add-hook 'racket-mode-hook
	  (lambda ()
	    (define-key racket-mode-map (kbd "C-r") 'racket-run)))

(defun clover/new-racket ()
  (interactive)
  (switch-to-buffer (get-buffer-create "untitled"))
  (setq initial-major-mode (quote racket-mode))
  (funcall initial-major-mode))

(provide 'keyboard)
