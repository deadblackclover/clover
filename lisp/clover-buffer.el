;;; clover-buffer.el --- Clover buffer
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(setq inhibit-startup-message t)

(setq logo "

           88
           88
           88
 ,adPPYba, 88  ,adPPYba,  8b       d8  ,adPPYba, 8b,dPPYba,
a8'     '' 88 a8'     '8a `8b     d8' a8P_____88 88P'   'Y8
8b         88 8b       d8  `8b   d8'  8PP''''''' 88
'8a,   ,aa 88 '8a,   ,a8'   `8b,d8'   '8b,   ,aa 88
 `'Ybbd8'' 88  `'YbbdP''      '8'      `'Ybbd8'' 88

")

(setq links "

[[https://github.com/deadblackclover/clover][Source code]]
[[https://github.com/deadblackclover/clover/releases][Releases]]
[[https://github.com/deadblackclover][DEADBLACKCLOVER]]
[[https://github.com/deadblackclover/clover/blob/master/LICENSE][GNU GPL-3.0]]
")

(switch-to-buffer (get-buffer-create "*clover*"))
(insert "#+STARTUP: inlineimages\n")
(insert (format "[[%simg/clover.png]] [[%simg/key.png]] [[%simg/cipher.png]]"
                clover-path
                clover-path
                clover-path))
(insert logo)
(insert (format "Clover: %s\nEmacs: v%s" clover-version emacs-version))
(insert links)
(insert (format "[[%simg/hacker.png]] [[%simg/emacs.png]]" clover-path clover-path))
(org-mode)
(beginning-of-buffer)

(provide 'clover-buffer)
;;; clover-buffer.el ends here
