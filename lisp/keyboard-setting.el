;;; keyboard-setting.el --- Keyboard setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'treemacs)

;; File
(global-set-key (kbd "C-o") 'find-file)               ;; Open file
(global-set-key (kbd "C-s") 'save-buffer)             ;; Save file
(global-set-key (kbd "C-w") 'kill-buffer)             ;; Close buffer
(global-set-key (kbd "C-f") 'isearch-forward-regexp)  ;; Search buffer
(global-set-key (kbd "C->") 'isearch-repeat-forward)  ;; Move to the next occurrence
(global-set-key (kbd "C-<") 'isearch-repeat-backward) ;; Move to the previous occurrence
(global-set-key (kbd "C-c f") 'xah-find-text-regex)   ;; Search in project

;; Ignore
(global-set-key (kbd "C-x C-f") 'ignore) ;; find-file
(global-set-key (kbd "C-x C-s") 'ignore) ;; save-buffer
(global-set-key (kbd "C-x C-w") 'ignore) ;; write-file
(global-set-key (kbd "C-x k") 'ignore)   ;; kill-buffer

;; Copy Paste
;; (global-set-key (kbd "C-z") 'undo)
;; (global-set-key (kbd "C-c") 'kill-ring-save) ;; Copy
;; (global-set-key (kbd "C-x") 'kill-region)    ;; Cut
;; (global-set-key (kbd "C-v") 'yank)           ;; Paste
(cua-mode 1)

;; Select Text
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; Git status
(global-set-key (kbd "C-c g s") 'magit-status)

;; New scratch
(defun clover-new-scratch ()
  "Create a new *scratch* buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*")))

(global-set-key (kbd "C-c s t") 'clover-new-scratch)

;; New scratch org mode
(defun clover-new-scratch-org-mode ()
  "Create a new *scratch* buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch org-mode*"))
  (org-mode))

(global-set-key (kbd "C-c s o") 'clover-new-scratch-org-mode)

;; New tab
(global-set-key (kbd "C-n") 'tab-bar-new-tab)

;; Close tab
(global-set-key (kbd "C-q") 'tab-close)

;; Switch to the next tab
(global-set-key (kbd "C-TAB") 'tab-bar-switch-to-next-tab)

;; Help
(defun clover-help ()
  "Clover help."
  (interactive)
  (switch-to-buffer (get-buffer-create "*Help*"))
  (insert "#+TITLE: Help\n\n")
  (insert-file-contents (concat clover-path "doc/Games.org"))
  (insert-file-contents (concat clover-path "doc/Shortcuts.org"))
  (insert-file-contents (concat clover-path "doc/Functions.org"))
  (org-mode)
  (org-view-mode)
  (goto-char (point-min)))

(global-set-key [f1] 'clover-help)

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

;; Treemacs
(global-set-key [f8] 'treemacs)

;; ielm
(global-set-key [f9] 'ielm)

;; htmlfontify-buffer
(global-set-key [f10] 'htmlfontify-buffer)

;; Whitespace
(global-set-key [f11] 'whitespace-mode)

(provide 'keyboard-setting)
;;; keyboard-setting.el ends here
