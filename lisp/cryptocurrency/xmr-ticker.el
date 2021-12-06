;;; xmr-ticker.el --- Shows latest monero price

;; Copyright (C) 2014  Jorge Niedbalski R.
;; Copyright (C) 2020  CipherDogs

;; Author: Jorge Niedbalski R. <jnr@metaklass.org>
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

(defgroup xmr-ticker nil
  "xmr-ticker extension"
  :group 'comms
  :prefix "xmr-ticker-")

(defconst xmr-ticker-api-url
  "https://api.cryptonator.com/api/ticker/xmr-usd")

(defcustom xmr-ticker-api-poll-interval 10
  "Default interval to poll to the bitstamp api."
  :type 'number
  :group 'xmr-ticker)

(defvar xmr-ticker-timer nil
  "Bitstamp API poll timer.")

(defvar xmr-ticker-mode-line " $0.00"
  "Displayed on mode-line.")

;;very risky :)
(put 'xmr-ticker-mode-line 'risky-local-variable t)

(defun xmr-ticker-start()
  "Start ticker."
  (unless xmr-ticker-timer
    (setq xmr-ticker-timer (run-at-time "0 sec" xmr-ticker-api-poll-interval #'xmr-ticker-fetch))
    (xmr-ticker-update-status)))

(defun xmr-ticker-stop()
  "Stop ticker."
  (when xmr-ticker-timer (cancel-timer xmr-ticker-timer)
        (setq xmr-ticker-timer nil)
        (if (boundp 'mode-line-modes)
            (delete '(t xmr-ticker-mode-line) mode-line-modes))))

(defun xmr-ticker-update-status()
  "Update status."
  (if (not(xmr-ticker-mode))
      (progn (if (boundp 'mode-line-modes)
                 (add-to-list 'mode-line-modes '(t xmr-ticker-mode-line) t)))))

(defun xmr-ticker-parse(json)
  "Parse JSON."
  (assoc-default 'price (assoc-default 'ticker json)))

(defun xmr-ticker-fetch()
  "Fetch data."
  (progn (request xmr-ticker-api-url
           :parser 'json-read
           :success (function* (lambda
                                 (&key
                                  data
                                  &allow-other-keys)
                                 (setq xmr-ticker-mode-line (concat " XMR: $" (xmr-ticker-parse
                                                                          data))))))))

;;;###autoload
(define-minor-mode xmr-ticker-mode "Minor mode to display the latest XMR price."
  :init-value nil
  :global t
  :lighter xmr-ticker-mode-line
  (if xmr-ticker-mode (progn (xmr-ticker-start))
    (xmr-ticker-stop)))

(provide 'xmr-ticker)
;;; xmr-ticker.el ends here

