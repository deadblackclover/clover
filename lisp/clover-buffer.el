;;; clover-buffer.el
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(setq inhibit-startup-message t)

(setq logo "
#+STARTUP: inlineimages
[[~/.emacs.d/img/clover.png]] [[~/.emacs.d/img/key.png]]
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

[[https://github.com/deadblackclover/emacs.d][Source code]]
[[https://github.com/deadblackclover/emacs.d/releases][Releases]]
[[https://github.com/deadblackclover][DEADBLACKCLOVER]]
[[https://github.com/deadblackclover/emacs.d/blob/master/LICENSE][GNU GPL-3.0]]

")

(switch-to-buffer (get-buffer-create "*clover*"))
(insert logo)
(insert clover-version)
(insert links)
(org-mode)
(beginning-of-buffer)

(provide 'clover-buffer)
