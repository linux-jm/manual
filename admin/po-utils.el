(defun fuzzy-diff ()
  "Check a difference in fuzzy contents."
  (interactive)
  (let (begin end prevfile newfile diffbuf)
    (save-excursion
      (re-search-backward "^$" nil t)
      (setq begin (point))
      (re-search-forward "^msgstr " nil t)
      (beginning-of-line)
      (setq end (point))
      (goto-char begin)
      (if (not (and (re-search-forward "^#| msgid " nil t)
		    (< (point) end)))
	  (error "Valid fuzzy section not found."))
      (beginning-of-line)
      (setq begin (point))
      ;; cut text from the original buffer
      (kill-ring-save begin end)
      ;; previous string
      (with-temp-buffer
	(yank)
	(goto-char (point-min))
	(re-search-forward "^msgid " nil t)
	(move-beginning-of-line nil)
	(kill-region (point) (point-max))

	(goto-char (point-min))
	(replace-regexp "^#| " "" nil (point-min) (point-max))
	(replace-regexp "^msgid " "" nil (point-min) (point-max))
	(replace-regexp "^\"" "" nil (point-min) (point-max))
	(replace-regexp "\"$" "" nil (point-min) (point-max))

	(setq prevfile (make-temp-file "podiff"))
	(write-region (point-min) (point-max) prevfile))
      (with-temp-buffer
	(yank)

	(goto-char (point-min))
	(replace-regexp "^msgid " "" nil (point-min) (point-max))
	(replace-regexp "^\"" "" nil (point-min) (point-max))
	(replace-regexp "\"$" "" nil (point-min) (point-max))

	(setq newfile (make-temp-file "podiff"))
	(write-region (point-min) (point-max) newfile))

      (setq diffbuf (diff prevfile newfile "-c" 'no-async))
      (set-buffer diffbuf)
      (toggle-read-only t)
      (set-buffer-modified-p nil)
      (pop-to-buffer diffbuf)
      (diff-hunk-next)

      (delete-file prevfile)
      (delete-file newfile))))

(provide 'po-utils)
