;;; eshell-setting.el --- Eshell setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'em-term)

(add-to-list 'eshell-visual-commands "cmus")
(add-to-list 'eshell-visual-commands "htop")
(add-to-list 'eshell-visual-commands "ssh")
(add-to-list 'eshell-visual-commands "tail")
(add-to-list 'eshell-visual-commands "top")
(add-to-list 'eshell-visual-commands "watch")

;; C/C++
(add-to-list 'eshell-visual-commands "make")

;; Rust
(add-to-list 'eshell-visual-subcommands '("cargo" "build" "check" "doc" "publish" "run" "test" "clippy"))

;; JS
(add-to-list 'eshell-visual-commands "npm")
(add-to-list 'eshell-visual-commands "yarn")

;; Git
(add-to-list 'eshell-visual-subcommands '("git" "diff" "help" "log" "show"))

(provide 'eshell-setting)
;;; eshell-setting.el ends here
