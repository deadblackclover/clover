;;; python-setting.el --- Python setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(defun clover-new-python ()
  "Create a Python file."
  (interactive)
  (switch-to-buffer (get-buffer-create "untitled.py"))
  (setq initial-major-mode (quote python-mode))
  (funcall initial-major-mode))

(defun clover-python-run ()
  "Run Python file."
  (interactive)
  (compile (format "python3 %s" (buffer-file-name))))

;; Run
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map (kbd "<f5>") 'clover-python-run)))

;; Format
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'python-setting)
;;; python-setting.el ends here
