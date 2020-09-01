;;; node-setting.el --- Node.js setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(defun clover-new-node ()
  "Create a Node.js file."
  (interactive)
  (switch-to-buffer (get-buffer-create "untitled.js"))
  (setq initial-major-mode (quote js2-mode))
  (funcall initial-major-mode))

(defun clover-node-run ()
  "Run Node.js file."
  (interactive)
  (compile (format "node %s" (buffer-file-name))))

;; Run
(add-hook 'js2-mode-hook (lambda ()
			   (define-key js2-mode-map (kbd "<f5>") 'clover-node-run)))

(provide 'node-setting)
;;; node-setting.el ends here
