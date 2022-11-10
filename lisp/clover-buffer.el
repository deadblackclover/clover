;;; clover-buffer.el --- Clover buffer
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'recentf)

(setq inhibit-startup-message t)

(defvar clover-logo
"

           88
           88
           88
 ,adPPYba, 88  ,adPPYba,  8b       d8  ,adPPYba, 8b,dPPYba,
a8'     '' 88 a8'     '8a `8b     d8' a8P_____88 88P'   'Y8
8b         88 8b       d8  `8b   d8'  8PP''''''' 88
'8a,   ,aa 88 '8a,   ,a8'   `8b,d8'   '8b,   ,aa 88
 `'Ybbd8'' 88  `'YbbdP''      '8'      `'Ybbd8'' 88

")

;; Recent files
(defvar clover-rf (mapcar (lambda (item)
                            (format "[[file:%s][%s]]\n" item item)) recentf-list))

(defvar clover-rf-last5 (cond ((> (length clover-rf) 5)
                               (cl-subseq clover-rf 0 5))
                              (t clover-rf)))

(defvar clover-rf-view (format "


Recent files
%s
" (mapconcat 'identity clover-rf-last5 "")))

(defvar clover-links
"
[[https://github.com/deadblackclover/clover][Source code]]
[[https://github.com/deadblackclover/clover/releases][Releases]]
[[https://github.com/deadblackclover][DEADBLACKCLOVER]]
[[https://github.com/deadblackclover/clover/blob/master/LICENSE][GNU GPL-3.0]]
")

(switch-to-buffer (get-buffer-create "*clover*"))
(insert "#+STARTUP: inlineimages\n")
(insert (format "[[%simg/clover.png]] [[%simg/key.png]] [[%simg/cipher.png]]"
                user-emacs-directory
                user-emacs-directory
                user-emacs-directory))
(insert clover-logo)
(insert (format "Clover version: %s\nGNU Emacs v%s (build %s, %s)"
                clover-version
                emacs-version
                emacs-build-number
                system-configuration))
(insert clover-rf-view)
(insert clover-links)
(insert (format "[[%simg/hacker.png]] [[%simg/emacs.png]]"
                user-emacs-directory
                user-emacs-directory))
(org-mode)
(goto-char (point-min))

(provide 'clover-buffer)
;;; clover-buffer.el ends here
