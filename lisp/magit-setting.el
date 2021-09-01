;;; magit-setting.el --- Magit setting
;;; Copyright (c) 2021, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'magit)

(add-hook 'magit-mode-hook (lambda ()
                           (define-key magit-mode-map (kbd "C-w") 'magit-kill-this-buffer)))

(provide 'magit-setting)
;;; magit-setting.el ends here
