;;; dot-ticker.el --- Shows latest Polkadot price

;; Copyright (C) 2023 CipherDogs

;; Author: DEADBLACKCLOVER <deadblackclover@protonmail.com>
;; Version: 1.0.0
;; URL: https://github.com/CipherDogs/elpa-cryptocurrency
;; Package-Requires: ((emacs "25.1") (json "1.2") (request "0.2.0"))
;; Keywords: news

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Emacs minor-mode to display current Polkadot price on the mode-line.

;;; Code:
(require 'cl-lib)
(require 'request)
(require 'json)

(defgroup dot-ticker nil
  "Polkadot ticker extension."
  :group 'comms
  :prefix "dot-ticker-")

(defconst dot-ticker-api-url
  "https://api.coingecko.com/api/v3/simple/price?ids=polkadot&vs_currencies=usd")

(defcustom dot-ticker-api-poll-interval 10
  "Default interval to poll to the coingecko api."
  :type 'number
  :group 'dot-ticker)

(defvar dot-ticker-timer nil
  "CoinGecko API poll timer.")

(defvar dot-ticker-mode-line " $0.00"
  "Displayed on mode-line.")

;;very risky :)
(put 'dot-ticker-mode-line 'risky-local-variable t)

(defun dot-ticker-start()
  "Start ticker."
  (unless dot-ticker-timer
    (setq dot-ticker-timer (run-at-time "0 sec" dot-ticker-api-poll-interval #'dot-ticker-fetch))
    (dot-ticker-update-status)))

(defun dot-ticker-stop()
  "Stop ticker."
  (when dot-ticker-timer (cancel-timer dot-ticker-timer)
        (setq dot-ticker-timer nil)
        (if (boundp 'mode-line-modes)
            (delete '(t dot-ticker-mode-line) mode-line-modes))))

(defun dot-ticker-update-status()
  "Update status."
  (if (not(dot-ticker-mode))
      (progn (if (boundp 'mode-line-modes)
                 (add-to-list 'mode-line-modes '(t dot-ticker-mode-line) t)))))

(defun dot-ticker-parse(json)
  "Parse JSON."
  (assoc-default 'usd (assoc-default 'polkadot json)))

(defun dot-ticker-fetch()
  "Fetch data."
  (progn (request dot-ticker-api-url
           :parser 'json-read
           :success (cl-function (lambda
                                   (&key
                                    data
                                    &allow-other-keys)
                                   (setq dot-ticker-mode-line (concat " DOT: $" (number-to-string
                                                                                   (dot-ticker-parse
                                                                                    data)))))))))

;;;###autoload
(define-minor-mode dot-ticker-mode "Minor mode to display the latest DOT price."
  :init-value nil
  :global t
  :lighter dot-ticker-mode-line
  (if dot-ticker-mode (progn (dot-ticker-start))
    (dot-ticker-stop)))

(provide 'dot-ticker)
;;; dot-ticker.el ends here
