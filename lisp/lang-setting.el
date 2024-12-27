;;; lang-setting.el --- Settings for programming languages
;;; Copyright (c) 2024, DEADBLACKCLOVER. This file is
;;; licensed under the GNU General Public License version 3 or later. See
;;; the LICENSE file.

;;; Commentary:

;;; Code:
(require 'disaster)
(require 'eglot)
(require 'fasm-mode)
(require 'gradle-mode)
(require 'python-mode)
(require 'racket-mode)
(require 'rust-mode)
(require 'scheme)
(require 'wat-mode)

;; Eglot
(defun clover-scala-language-server ()
  "Language server depends on the system."
  (if (string-equal system-type "windows-nt") '("~/metals/metals") '("metals")))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(scala-mode . ,(clover-scala-language-server))))

;; C
(defun clover-c-mode-hook ()
  "Style for C file."
  (setq c-default-style "k&r")
  (setq c-basic-offset 4))
(add-hook 'c-mode-hook 'clover-c-mode-hook)

;; Disassemble
(add-hook 'c-mode-hook (lambda ()
                         (define-key c-mode-map (kbd "M-d") 'disaster)))

(defun clover-c-compile ()
  "Compile C file."
  (interactive)
  (compile (format "gcc -o %s %s && ./%s" (file-name-base buffer-file-name)
                   (buffer-file-name)
                   (file-name-base buffer-file-name))))

;; Compile and run
(add-hook 'c-mode-hook (lambda ()
                         (define-key c-mode-map (kbd "<f5>") 'clover-c-compile)))

;; Activate c-eldoc
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;  Debugging
(add-hook 'c-mode-hook (lambda ()
                         (define-key c-mode-map (kbd "<C-f5>") 'gdb)))

;; C++
(defun clover-c++-mode-hook ()
  "Style for C++ file."
  (setq c-basic-offset 4))
(add-hook 'c++-mode-hook 'clover-c++-mode-hook)

;; Disassemble
(add-hook 'c++-mode-hook (lambda ()
                           (define-key c++-mode-map (kbd "M-d") 'disaster)))

(defun clover-c++-compile ()
  "Compile C++ file."
  (interactive)
  (compile (format "g++ -o %s %s && ./%s" (file-name-base buffer-file-name)
                   (buffer-file-name)
                   (file-name-base buffer-file-name))))

;; Compile and run
(add-hook 'c++-mode-hook (lambda ()
                           (define-key c++-mode-map (kbd "<f5>") 'clover-c++-compile)))

;; Activate c-eldoc
(add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)

;;  Debugging
(add-hook 'c++-mode-hook (lambda ()
                           (define-key c++-mode-map (kbd "<C-f5>") 'gdb)))

;; FASM
(add-to-list 'auto-mode-alist '("\\.asm\\'" . fasm-mode))

;; Java
(add-hook 'java-mode-hook (lambda()
                            (gradle-mode 1)))

(defun clover-build-and-run-java ()
  "Build and run Java project."
  (interactive)
  (gradle-run "build run"))

;; Run
(add-hook 'java-mode-hook (lambda ()
                            (define-key java-mode-map (kbd "<f5>") 'clover-build-and-run-java)))

;; Lisp

;; racket-run
(add-hook 'racket-mode-hook (lambda ()
                              (define-key racket-mode-map (kbd "<f5>") 'racket-run)))

;; elisp run
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (define-key emacs-lisp-mode-map (kbd "<f5>") 'eval-buffer)))

;; prettier-elisp-buffer
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (define-key emacs-lisp-mode-map (kbd "C-i")
                                    'prettier-elisp-buffer)))

;; ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'scheme-mode-hook 'turn-on-eldoc-mode)
(add-hook 'racket-mode-hook 'turn-on-eldoc-mode)

;; Python
(defun clover-python-run ()
  "Run Python file."
  (interactive)
  (compile (format "python3 %s" (buffer-file-name))))

;; Run
(add-hook 'python-mode-hook (lambda ()
                              (define-key python-mode-map (kbd "<f5>") 'clover-python-run)))

;; Format
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; Rust
(add-hook 'rust-mode-hook (lambda ()
                            (define-key rust-mode-map (kbd "<f5>") 'cargo-process-run)))

;; Scala
(add-hook 'scala-mode-hook 'eglot-ensure)

;; FSharp

;; Since both `fsharp-mode` and `forth-mode` are used in the configuration,
;; we forcibly report that we use `fsharp-mode` for files of `.fs` type.
(add-to-list 'auto-mode-alist '("\\.fs\\'" . fsharp-mode))

(setq eglot-fsharp-server-install-dir nil)
(add-hook 'fsharp-mode-hook 'eglot-ensure)

(provide 'lang-setting)
;;; lang-setting.el ends here
