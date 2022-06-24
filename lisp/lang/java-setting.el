;;; java-setting.el --- Java setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'gradle-mode)
(add-hook 'java-mode-hook (lambda() 
                             (gradle-mode 1)))

(defun clover-new-java () 
  "Create a Java file." 
  (interactive) 
  (switch-to-buffer (get-buffer-create "untitled.java")) 
  (setq initial-major-mode (quote java-mode)) 
  (funcall initial-major-mode))

(defun clover-build-and-run-java () 
  "Build and run Java project." 
  (interactive) 
  (gradle-run "build run"))

;; Run
(add-hook 'java-mode-hook (lambda () 
                            (define-key java-mode-map (kbd "<f5>") 'clover-build-and-run-java)))

(provide 'java-setting)
;;; java-setting.el ends here
