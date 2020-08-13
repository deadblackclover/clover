;;; c-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;; C
(defun my-c-mode-hook () 
  (c-set-style "k&r") 
  (c-basic-offset 4))
(add-hook 'c-mode-hook 'my-c-mode-hook)

;; C++

(provide 'c-setting)
