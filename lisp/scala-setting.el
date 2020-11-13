;;; scala-setting.el --- Scala setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'lsp-mode)
(require 'lsp-metals)

(defun clover-new-scala ()
  "Create a Scala file."
  (interactive)
  (switch-to-buffer (get-buffer-create "untitled.scala"))
  (setq initial-major-mode (quote scala-mode))
  (funcall initial-major-mode))

(add-hook 'scala-mode-hook 'lsp)
(add-hook 'lsp-mode-hook 'lsp-lens-mode)
(setq lsp-prefer-flymake nil)
(setq lsp-metals-treeview-show-when-views-received t)

(provide 'scala-setting)
;;; scala-setting.el ends here
