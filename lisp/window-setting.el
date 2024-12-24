;;; window-setting.el --- Window setting
;;; Copyright (c) 2019-2020, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'emms-playing-time)
(require 'reverse-im)

(setq-default frame-title-format
              (concat "%b - Happy Hacking! - Clover " clover-version))

(if (string-equal system-type "windows-nt")
    (set-face-attribute 'default nil :height 140))

;; Set default font
(cond ((string-equal system-type "windows-nt") ;; Microsoft Windows
       (when (member "Consolas" (font-family-list))
         (set-frame-font "Consolas" t t)))
      ((string-equal system-type "darwin") ;; MacOS
       (when (member "Menlo" (font-family-list))
         (set-frame-font "Menlo" t t)))
      ((string-equal system-type "gnu/linux") ;; Linux
       (when (member "Ubuntu Mono" (font-family-list))
         (set-frame-font "Ubuntu Mono 12" t t))))

(if window-system (tool-bar-mode -1))
(if window-system (menu-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(tab-bar-mode 1)                     ;; tab bar mode
(display-battery-mode 1)             ;; battery status
(global-display-line-numbers-mode 1) ;; global line mode
(display-time-mode 1)                ;; display time
(scroll-bar-mode -1)                 ;; disable scroll bars

;; Column and line
(setq column-number-mode t)

;; Truncate line
(set-default 'truncate-lines t)

;; Activate nyan-mode
(nyan-mode)

;; Activate Reverse-im
(reverse-im-activate "russian-computer")

;; Activate diff-hl
(global-diff-hl-mode)

;; Activate hl-todo
(global-hl-todo-mode t)

(defun clover-set-transparency ()
  "Set the window strength."
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 50)))

(defun clover-unset-transparency ()
  "Unset the window strength."
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 . 100)))

(defun clover-emms-toggle ()
  "Toggle emms modes."
  (interactive)
  (emms-mode-line-mode)
  (emms-playing-time-mode))

(clover-emms-toggle)

(provide 'window-setting)
;;; window-setting.el ends here
