;; -*- mode: emacs-lisp -*-
;;
;; JM-man-view.el -- format mail message including roff manual
;;
;; Copyright (C) 1999-2001 Akihiro MOTOKI <motoki@dd.iij4u.or.jp>
;; Time-Stamp: <2001-02-07 13:05:28 motoki>

;; Required:
;;  - woman.el (http://centaur.maths.qmw.ac.uk/Emacs/)

;; Preparation:
;; (1) Put this file (JM-man-view.el) and woman.el to load-path directory.
;; (2) Put this in your .emacs:
;;   ;; woman
;;   (autoload 'woman "woman"
;;     "Decode and browse a UN*X man page." t)
;;   (autoload 'woman-find-file "woman"
;;     "Find, decode and browse a specific UN*X man-page file." t)
;;   ;; JM-man-view
;;   (autoload 'JM-man-view "JM-man-view" nil t)
;;   (autoload 'JM-man-mail-view "JM-man-view" nil t)

;; Usage:
;; (2) Go to the message buffer.
;; (3) M-x JM-man-view
;;
;; For users of Wanderlust or Mew
;;  In summary mode, 
;;  M-x JM-man-mail-view
;;          formats manpages included in the message buffer.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

(require 'woman)

(defvar JM-tempfile-prefix "/tmp/jm"
  "Prefix for a temporary filename which JM-man-view.")

(defvar JM-tempfile-list nil
  "A List of temporary files which are used by JM-man-view")

(defvar JM-man-view-init nil)
(defvar JM-man-view-version "1.01")

(defvar JM-mew-disp-keybind ?.)

(defun JM-man-view-init ()
  (if (null JM-man-view-init)
      (progn
	(if (not (featurep 'woman))
	    (error "No woman package!!"))
	(add-hook 'kill-emacs-hook 'JM-tempfile-delete)
	(setq JM-man-view-init t)
	)))

(defun JM-tempfile-make ()
  (format "%s%d-%d"
	  JM-tempfile-prefix
	  (emacs-pid)
	  (nth 1 (current-time))))

(defun JM-man-mail-view ()
  (interactive)
  (JM-man-view-init)
  (cond ((string= major-mode "wl-summary-mode")
	 (wl-summary-jump-to-current-message)
	 (JM-man-view))
	((string= major-mode "mew-summary-mode")
	 ;;(mew-summary-display-command)
	 (funcall (cdr (assoc JM-mew-disp-keybind mew-summary-mode-map)))
	 (select-window (get-buffer-window
			    (get-buffer (mew-buffer-message))))
	 (JM-man-view))
	(t
	 (message "Please try 'JM-man-view' in message buffer."))))

(defun JM-man-view ()
  (interactive)
  (JM-man-view-init)
  (let ((tempfile (JM-tempfile-make)))
    (save-excursion
      (beginning-of-buffer)
      ;; search beginning of manual message.
      (if (re-search-forward "^\.\\\\\"" nil t)
	  (progn
	    (beginning-of-line)
	    (write-region (point) (point-max) tempfile)
	    (woman-find-file tempfile)
	    (setq JM-tempfile-list (cons tempfile JM-tempfile-list)))
	(message "No manual found.")
	))))

(defun JM-tempfile-delete ()
  (interactive)
  (let (failed-list)
    (mapcar
     (lambda (file)
       (if (and (file-exists-p file) (file-writable-p file))
	   (delete-file file)
	 (setq failed-list (cons file failed-list))))
     JM-tempfile-list)
    (setq JM-tempfile-list failed-list)))

(provide 'JM-man-view)
