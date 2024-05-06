;;; install-packages.el --- Install packages
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'cl-lib)
(require 'package)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("local-dir" . "~/.emacs.d/celpa") t)

(setq package-enable-at-startup nil)

(defvar clover-packages-list '(c-eldoc ag cargo cider clojure-mode company
                                       company-solidity diff-hl disaster
                                       dot-ticker ef-themes elisp-format
                                       elm-mode elpher emms epresent fasm-mode
                                       find-file-in-repository flycheck
                                       gradle-mode haskell-mode hl-todo js2-mode
                                       kotlin-mode lolcat lsp-metals lsp-mode
                                       lsp-ui magit mastodon move-mode
                                       multiple-cursors nasm-mode nyan-mode
                                       package-lint pacmacs paredit php-mode
                                       plan9-theme posframe py-autopep8
                                       python-mode racket-mode
                                       rainbow-delimiters reddigg reverse-im
                                       rust-mode sbt-mode scala-mode
                                       solidity-mode treemacs tuareg twtxt
                                       wat-mode xah-find xmr-ticker zig-mode))

(defun clover-install-packages ()
  "Auto install packages."
  (interactive)
  (unless package-archive-contents (package-refresh-contents))
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package))) clover-packages-list))

(defun clover-refresh-package ()
  "Forced package refresh contents."
  (interactive)
  (package-refresh-contents))

(defun clover-clear-packages ()
  "Clears the Emacs folder."
  (interactive)
  (delete-file (concat clover-path ".clover"))
  (delete-directory (concat clover-path "elpa/") t)
  (message "Done!"))

(defun clover-pull-from-remote ()
  "Pulling from remote."
  (progn (message "Updating...")
         (cd clover-path)
         (shell-command "git pull")
         (message "Done!")))

(defun clover-update ()
  "Update clover."
  (interactive)
  (clover-pull-from-remote)
  (save-buffers-kill-emacs))

(provide 'install-packages)
;;; install-packages.el ends here
