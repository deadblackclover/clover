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

;; Buffer
(global-set-key (kbd "<C-tab>") 'switch-to-buffer)

;; New scratch
(defun new-scratch ()
    ; Creates a new *scratch* buffer
    (interactive)
    (switch-to-buffer (get-buffer-create "*scratch*")))

(global-set-key (kbd "C-n") 'new-scratch)

(provide 'keyboard)
