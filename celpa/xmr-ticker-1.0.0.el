;;; xmr-ticker.el --- Shows latest monero price

;; Copyright (C) 2014 Jorge Niedbalski R.
;; Copyright (C) 2020 CipherDogs

;; Author: Jorge Niedbalski R. <jnr@metaklass.org>
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

;; Emacs minor-mode to display current Monero price on the mode-line.

;;; Code:
(require 'cl-lib)
(require 'request)
(require 'json)

(defgroup xmr-ticker nil
  "XMR ticker extension."
  :group 'comms
  :prefix "xmr-ticker-")

(defconst xmr-ticker-api-url
  "https://api.coingecko.com/api/v3/simple/price?ids=monero&vs_currencies=usd")

(defcustom xmr-ticker-api-poll-interval 10
  "Default interval to poll to the coingecko api."
  :type 'number
  :group 'xmr-ticker)

(defvar xmr-ticker-timer nil
  "CoinGecko API poll timer.")

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
  (assoc-default 'usd (assoc-default 'monero json)))

(defun xmr-ticker-fetch()
  "Fetch data."
  (progn (request xmr-ticker-api-url
           :parser 'json-read
           :success (cl-function (lambda
                                   (&key
                                    data
                                    &allow-other-keys)
                                   (setq xmr-ticker-mode-line (concat " XMR: $" (number-to-string
                                                                                 (xmr-ticker-parse
                                                                                  data)))))))))

;;;###autoload
(define-minor-mode xmr-ticker-mode "Minor mode to display the latest XMR price."
  :init-value nil
  :global t
  :lighter xmr-ticker-mode-line
  (if xmr-ticker-mode (progn (xmr-ticker-start))
    (xmr-ticker-stop)))

(provide 'xmr-ticker)
;;; xmr-ticker.el ends here
