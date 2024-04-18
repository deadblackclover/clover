;;; emms-setting.el --- Magit setting
;;; Copyright (c) 2024, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'emms-playlist-mode)

(defun clover-emms-add-directory (directory)
  "Emms add DIRECTORY."
  (interactive (list (read-string "Play directory: " "~/Music/")))
  (emms-add-directory-tree directory)
  (emms-playlist-mode-go))

(provide 'emms-setting)
;;; emms-setting.el ends here
