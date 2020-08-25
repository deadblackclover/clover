;;; keyboard.el --- Keyboard setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'neotree)

;; File
(global-set-key (kbd "C-o") 'find-file)       ;; Open file
(global-set-key (kbd "C-s") 'save-buffer)     ;; Save file
(global-set-key (kbd "C-w") 'kill-buffer)     ;; Close buffer
(global-set-key (kbd "C-f") 'isearch-forward) ;; Search buffer

;; Copy Paste
;; (global-set-key (kbd "C-z") 'undo)
;; (global-set-key (kbd "C-c") 'kill-ring-save) ;; Copy
;; (global-set-key (kbd "C-x") 'kill-region)    ;; Cut
;; (global-set-key (kbd "C-v") 'yank)           ;; Paste
(cua-mode 1)

;; Select Text
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Neotree toggle
(global-set-key [f8] 'neotree-toggle)

;; New scratch
(defun clover-new-scratch () 
  "Create a new *scratch* buffer." 
  (interactive) 
  (switch-to-buffer (get-buffer-create "*scratch*")))

(global-set-key (kbd "C-n") 'clover-new-scratch)

;; New scratch org mode
(defun clover-new-scratch-org-mode () 
  "Create a new *scratch* buffer." 
  (interactive) 
  (switch-to-buffer (get-buffer-create "*scratch org-mode*")) 
  (org-mode))

(global-set-key (kbd "M-n") 'clover-new-scratch-org-mode)

;; Comment line
(global-set-key (kbd "C-/") 'comment-line)

;; Eshell
(global-set-key [f2] 'eshell)

;; EWW
(global-set-key [f3] 'eww)

;; elpher
(global-set-key [f4] 'elpher)

;; ERC
(global-set-key [f6] 'erc)

;; Calculator
(global-set-key [f7] 'calculator)

;; htmlfontify-buffer
(global-set-key [f8] 'htmlfontify-buffer)

;; ielm
(global-set-key [f9] 'ielm)

(provide 'keyboard)
;;; keyboard.el ends here
