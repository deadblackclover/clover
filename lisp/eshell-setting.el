;;; eshell-setting.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(require 'em-term)

(add-to-list 'eshell-visual-commands "cmus")
(add-to-list 'eshell-visual-commands "htop")
(add-to-list 'eshell-visual-commands "ssh")
(add-to-list 'eshell-visual-commands "tail")

(add-to-list 'eshell-visual-commands "make")

(add-to-list 'eshell-visual-commands "cargo")

(provide 'eshell-setting)
