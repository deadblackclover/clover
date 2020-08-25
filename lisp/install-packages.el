;;; install-packages.el --- Install packages
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'cl)
(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(setq package-enable-at-startup nil)

(setq clover-packages-list
      '(c-eldoc
	cargo
	cyberpunk-theme
	diff-hl
	disaster
	elisp-format
	elpher
	epresent
	flycheck
	js2-mode
	mastodon
	neotree
	nyan-mode
	package-lint
	paredit
	php-mode
	plan9-theme
	py-autopep8
	python-mode
	racket-mode
	rainbow-delimiters
	reverse-im
	rust-mode
	scala-mode
	))

(defun clover-install-packages ()
  "Auto install packages."
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
	    (unless (package-installed-p package)
	      (package-install package)))
	clover-packages-list))

(defun clover-clear-packages ()
  "Clears the Emacs folder."
  (interactive)
  (delete-file (concat clover-path ".clover"))
  (delete-directory (concat clover-path "elpa/") t)
  (message "Done!"))

(defun clover-pull-from-remote ()
  "Pulling from remote."
  (let ((default-directory clover-path))
    (vc-pull)))

(defun clover-update ()
  "Update clover."
  (interactive)
  (clover-clear-packages)
  (clover-pull-from-remote)
  (clover-install-packages)
  (save-buffers-kill-emacs))

(provide 'install-packages)
;;; install-packages.el ends here
