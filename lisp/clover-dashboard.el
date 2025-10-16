;;; clover-dashboard.el --- Clover dashboard
;;; Copyright (c) 2024, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'recentf)

(defvar clover-dashboard-images
  (format
   "[[%simg/lisp.png]] [[%simg/keyboard.png]] [[%simg/gplv3.png]]\n"
   user-emacs-directory
   user-emacs-directory
   user-emacs-directory))

(defvar clover-dashboard-logo
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

(defvar clover-dashboard-info
  (format
   "\nClover version: %s\nGNU Emacs v%s (build %s, %s)"
   clover-version
   emacs-version
   emacs-build-number
   system-configuration))

;; Recent files
(defvar clover-dashboard-rf (mapcar (lambda (item)
                                      (format "[[file:%s][%s]]\n" item
                                              item))
                                    recentf-list))

(defvar clover-dashboard-rf-last5
  (cond ((> (length clover-dashboard-rf) 5)
         (cl-subseq
          clover-dashboard-rf 0 5))
        (t clover-dashboard-rf)))

(defvar clover-dashboard-rf-view (format "


Recent files:
%s
" (mapconcat 'identity clover-dashboard-rf-last5 "")))

(defvar clover-dashboard-links
  "
[[https://github.com/deadblackclover/clover][GitHub]]
[[https://codeberg.org/deadblackclover/clover][Codeberg]]
[[https://deadblackclover.net/][DEADBLACKCLOVER]]
[[https://www.gnu.org/licenses/gpl-3.0.en.html][GNU GPL-3.0]]
")

(defvar clover-dashboard-icons
  (format
   "[[%simg/hacker.png]] [[%simg/emacs.png]]"
   user-emacs-directory
   user-emacs-directory))

(defvar clover-dashboard-content
  (concat clover-dashboard-images
          clover-dashboard-logo
          clover-dashboard-info
          clover-dashboard-rf-view
          clover-dashboard-links
          clover-dashboard-icons))

(defun clover-dashboard-open ()
  "Function that create Buffer with dashboard."
  (interactive)
  (switch-to-buffer (get-buffer-create "*clover*"))
  (erase-buffer)
  (insert "#+STARTUP: inlineimages\n")
  (insert clover-dashboard-content)
  (org-mode)
  (org-view-mode)
  (goto-char (point-min)))

(provide 'clover-dashboard)
;;; clover-dashboard.el ends here
