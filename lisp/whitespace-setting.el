;;; whitespace-setting.el --- Whitespace setting
;;; Copyright (c) 2021, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'whitespace)

(setq whitespace-style
      (quote (face spaces tabs newline space-mark tab-mark newline-mark )))

(setq whitespace-display-mappings
      '(
        (space-mark 32 [183] [46])
        (newline-mark 10 [182 10])
        (tab-mark 9 [9655 9] [92 9])))

(provide 'whitespace-setting)
;;; whitespace-setting.el ends here
