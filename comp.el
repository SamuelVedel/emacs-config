
;; (defun exec (cmd buffer)
;;   (async-shell-command
;;    cmd
;;    buffer
;;    buffer
;;    )
;;   )

(defun exec (cmd buffer)
  (save-excursion
    (set-buffer buffer)
    (shell-command-on-region
     1
     1
     cmd
     buffer
     t
     buffer
     nil
     nil
     )
  )
  )

(defun get-bad-lines (buffer)
  (let ((cmd nil))
    (if (eq major-mode 'java-mode)
        (setq cmd (concat
                    "~/emacs-config/get_err_java.sh "
                    (buffer-file-name (current-buffer))
                    )))
    (if (not cmd)
        nil
      (exec cmd buffer)
      t
      )
    )
  )

(defun get-line-on-buffer (buffer line)
  (save-excursion
    (set-buffer buffer)
    (goto-line line)
    (buffer-substring-no-properties (line-beginning-position) (line-end-position))
    )
  )

(defun max-line (buffer)
  (save-excursion
    (set-buffer buffer)
    (let ((n-line 0))
      (goto-line n-line)
      (while (< (point) (point-max))
        (setq n-line (+ n-line 1))
        (goto-line n-line)
        )
      n-line
      )
    )
  )

(defun highlight-errors (buffer)
  (let ((n-line 1)
        (m-line (max-line buffer))
        line)
    (while (< n-line m-line)
      (setq line (get-line-on-buffer buffer n-line))
      (highligh-line (string-to-number line))
      (setq n-line (+ n-line 1))
      )
    )
  )

(setq highlighted-lines nil)

(defun highligh-line (n-line)
  (setq line
        (concat "^"
                (get-line-on-buffer (current-buffer)n-line)
                "$"))
  (setq highlighted-lines (cons line highlighted-lines))
  (highlight-regexp line 'isearch)
  )

(defun unhighlight-errors ()
  (if (not highlighted-lines)
      nil
    (unhighlight-regexp (car highlighted-lines))
    (setq highlighted-lines (cdr highlighted-lines))
    (unhighlight-errors)
    )
  )

(defun show-errors ()
  (interactive)
  (unhighlight-errors)
  (let ((buff (generate-new-buffer "err-lines")))
    (if (not (get-bad-lines buff))
        (message "No compilation for the mode: %s" major-mode)
      (highlight-errors buff)
      )
    (kill-buffer (buffer-name buff))
    )
  )

(global-set-key (kbd "C-c m") 'show-errors)
(global-set-key (kbd "C-c c") 'unhighlight-errors)
