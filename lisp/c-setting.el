;;; c-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(require 'disaster)

;; C
(defun my-c-mode-hook () 
  (c-set-style "k&r") 
  (c-basic-offset 4))
(add-hook 'c-mode-hook 'my-c-mode-hook)

;; Disassemble
(add-hook 'c-mode-hook (lambda () 
			 (define-key c-mode-map (kbd "M-d") 'disaster)))

;; C++

(provide 'c-setting)
