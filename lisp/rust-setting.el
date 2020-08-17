;;; rust-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(defun clover/new-rust () 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled.rs")) 
  (setq initial-major-mode (quote rust-mode)) 
  (funcall initial-major-mode))

;; Cargo run
(add-hook 'rust-mode-hook (lambda () 
			    (define-key rust-mode-map (kbd "<f5>") 'cargo-process-run)))

(provide 'rust-setting)
