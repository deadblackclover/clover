;;; other-lang-setting.el --- Other lang setting
;;; Copyright (c) 2019-2021, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
;; FASM
(require 'fasm-mode)
(add-to-list 'auto-mode-alist '("\\.asm\\'" . fasm-mode))

;; RIDE
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.ride\\'" . scala-mode))

;; ZoKrates, Vyper
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.zok\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.vy\\'" . python-mode))

;; Zinc
(require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.zn\\'" . rust-mode))

(provide 'other-lang-setting)
;;; other-lang-setting.el ends here
