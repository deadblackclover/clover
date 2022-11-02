;;; oxen-ticker.el --- Shows latest Oxen price

;; Copyright (C) 2021  CipherDogs

;; Author: DEADBLACKCLOVER <deadblackclover@protonmail.com>
;; Version: 1.0.0
;; Package-Requires: ((json "1.2") (request "0.2.0"))
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

;;; Code:

(require 'request)
(require 'json)

(defgroup oxen-ticker nil
  "Oxen ticker extension."
  :group 'comms
  :prefix "oxen-ticker-")

(defconst oxen-ticker-api-url
  "https://api.coingecko.com/api/v3/simple/price?ids=loki-network&vs_currencies=usd")

(defcustom oxen-ticker-api-poll-interval 10
  "Default interval to poll to the bitstamp api."
  :type 'number
  :group 'oxen-ticker)

(defvar oxen-ticker-timer nil
  "Cryptonator API poll timer.")

(defvar oxen-ticker-mode-line " $0.00"
  "Displayed on mode-line.")

;;very risky :)
(put 'oxen-ticker-mode-line 'risky-local-variable t)

(defun oxen-ticker-start()
  "Start ticker."
  (unless oxen-ticker-timer
    (setq oxen-ticker-timer (run-at-time "0 sec" oxen-ticker-api-poll-interval #'oxen-ticker-fetch))
    (oxen-ticker-update-status)))

(defun oxen-ticker-stop()
  "Stop ticker."
  (when oxen-ticker-timer (cancel-timer oxen-ticker-timer)
        (setq oxen-ticker-timer nil)
        (if (boundp 'mode-line-modes)
            (delete '(t oxen-ticker-mode-line) mode-line-modes))))

(defun oxen-ticker-update-status()
  "Update status."
  (if (not(oxen-ticker-mode))
      (progn (if (boundp 'mode-line-modes)
                 (add-to-list 'mode-line-modes '(t oxen-ticker-mode-line) t)))))

(defun oxen-ticker-parse(json)
  "Parse JSON."
  (assoc-default 'usd (assoc-default 'loki-network json)))

(defun oxen-ticker-fetch()
  "Fetch data."
  (progn (request oxen-ticker-api-url
           :parser 'json-read
           :success (cl-function (lambda
                                   (&key
                                    data
                                    &allow-other-keys)
                                   (setq oxen-ticker-mode-line (concat " OXEN: $" (number-to-string
                                                                                   (oxen-ticker-parse
                                                                                    data)))))))))

;;;###autoload
(define-minor-mode oxen-ticker-mode "Minor mode to display the latest OXEN price."
  :init-value nil
  :global t
  :lighter oxen-ticker-mode-line
  (if oxen-ticker-mode (progn (oxen-ticker-start))
    (oxen-ticker-stop)))

(provide 'oxen-ticker)
;;; oxen-ticker.el ends here
