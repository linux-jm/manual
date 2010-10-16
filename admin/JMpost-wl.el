;; -*- mode: emacs-lisp -*-
;;
;; JMpost-wl.el -- JMpost フォーマットのメールを作成する
;;
;; Copyright (C) 1999-2001 Akihiro MOTOKI <motoki@dd.iij4u.or.jp>
;;
;; [準備]
;; (1) ~/.emacs に (require 'JMpost-wl) を追加
;; (2) JMpost-wl-from-address, JMpost-wl-from-name を確認する
;; (3) JM CVS Repository をチェックアウトしている場合は
;;     JMpost-wl-manual-directory を設定する(オプション)。
;;
;; [使用方法]
;; (1) Goto to Wanderlust draft.
;; (2) M-x JMpost-wl
;;
;;
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

(defvar JMpost-wl-status-list '("TR" "DO" "DP" "PR" "RO" "RR"))
(defvar JMpost-wl-default-status "DP")

(defvar JMpost-wl-post-address "JMpost@linux.or.jp"
  "*JM の作業メールの送信先")

(defvar JMpost-wl-from-address user-mail-address
  "*Full e-mail address of the poster.")
(defvar JMpost-wl-from-name user-full-name
  "*The full name of the poster.")

(defvar JMpost-wl-manual-directory nil
  "*JM のマニュアルが展開されているディレクトリ。ディレクトリが
JM CVS と同じフォルダ階層であれば、パッケージ名の推測を行ってくれる。
JM CVS Repository を $JMDIR に展開している場合には、
本変数に $JMDIR/manual を設定するとよい。")
(defvar JMpost-wl-last-read-directory JMpost-wl-manual-directory)

(defun JMpost-wl (&optional FILENAME)
  (interactive)
  (if (not (eq major-mode 'wl-draft-mode))
      (error "Run in wl-draft mode!"))
  (let ((filename
	 (or FILENAME
	     (read-file-name "Filename: " JMpost-wl-last-read-directory)))
	(status (completing-read
		 (format "Page status (%s): " JMpost-wl-default-status)
		 (mapcar 'list JMpost-wl-status-list)
		 nil t nil nil JMpost-wl-default-status))
	(pkg-regex (and JMpost-wl-manual-directory
			(format
			 "%s/?\\(.+\\)/\\(draft\\|release\\)/man[1-9]/"
			 JMpost-wl-manual-directory)))
	manpage dirname pkgname pkgread)
    ;; Check filename
    (if (file-directory-p filename)
	(error "The specified file is a directory.")
      (setq manpage (file-name-nondirectory filename))
      (setq dirname (file-name-directory filename))
      (setq JMpost-wl-last-read-directory dirname))
    (if (and pkg-regex (string-match pkg-regex dirname))
	(setq pkgname (match-string 1 dirname)))
    ;; Package name
    (setq pkgread (read-from-minibuffer
		   (if pkgname (format "Package (%s): " pkgname) "Package: ")))
    (if (not (string= pkgread ""))
	(setq pkgname pkgread))
    (if (null pkgname)
	(error "Please specify PACKAGE NAME.")
    ;; Field insert
    (wl-draft-replace-field "To" JMpost-wl-post-address)
    (wl-draft-replace-field "From" JMpost-wl-from-address)
    (wl-draft-replace-field "Subject"
			    (format "[POST:%s] %s %s"
				    status (if pkgname pkgname "") manpage))
    ;; Generate body header
    (wl-draft-body-goto-top)
    (insert (concat "<STATUS>\n"
		    (format "stat: %s\n" status)
		    (format "ppkg: %s\n" (if pkgname pkgname ""))
		    (format "page: %s\n" manpage)
		    (format "date: %s\n" (format-time-string "%Y/%m/%d"))
		    (format "mail: %s\n" JMpost-wl-from-address)
		    (format "name: %s\n" JMpost-wl-from-name)
		    "</STATUS>\n\n"))
    (if (or (string= status "TR") (string= status "PR"))
	()
      (insert-file-contents filename))
    (setq wl-draft-config-exec-flag nil)
    (wl-highlight-headers))
    ))

(provide 'JMpost-wl)
