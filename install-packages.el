;;; install-packages.el
;;; Copyright (c) 2019, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

(require 'cl)
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

(setq clover-packages-list
      '(
	clojure-mode
	cyberpunk-theme
	elpher
	mastodon
	scala-mode
	))

(defun clover-auto-install-packages ()
  (package-refresh-contents)
  (mapc #'(lambda (package)
	    (unless (package-installed-p package)
	      (package-install package)))
	clover-packages-list)
  (save-buffers-kill-emacs))

(clover-auto-install-packages)
