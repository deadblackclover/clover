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

(setq clover-packages-list '(c-eldoc cargo company company-solidity company-lsp cyberpunk-theme diff-hl
                                     disaster elisp-format elpher epresent flycheck gradle-mode hl-todo js2-mode
                                     lsp-metals lsp-mode lsp-ui magit mastodon neotree nyan-mode package-lint
                                     paredit php-mode plan9-theme posframe py-autopep8 python-mode racket-mode
                                     rainbow-delimiters reverse-im rust-mode sbt-mode scala-mode
                                     solidity-mode twtxt))

(defun clover-install-packages ()
  "Auto install packages."
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package))) clover-packages-list))

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
