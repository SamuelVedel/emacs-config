
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
    (if (eq major-mode 'c-mode)
        (setq cmd (concat
                    "~/emacs-config/get_err_c.sh "
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
    (let ((n-line 1))
      (goto-line n-line)
      (while (< (point) (point-max))
        (setq n-line (+ n-line 1))
        (goto-line n-line)
        )
      (- n-line 1)
      )
    )
  )

(defun highlight-errors (buffer)
  (let ((n-line 1)
        (m-line (max-line buffer))
        line)
    (while (<= n-line m-line)
      (setq line (get-line-on-buffer buffer n-line))
      (highlight-line (string-to-number line))
      (setq n-line (+ n-line 1))
      )
    )
  )

(setq highlighted-lines nil)
(make-variable-buffer-local 'highlighted-lines)

(defun prepare-string-for-regexp (str)
  (setq str (replace-regexp-in-string "\\\\" "\\\\\\\\" str))
  (setq str (replace-regexp-in-string "\\*" "\\\\*" str))
  (setq str (replace-regexp-in-string "\\+" "\\\\+" str))
  (setq str (replace-regexp-in-string "\\$" "\\\\$" str))
  (setq str (replace-regexp-in-string "\\^" "\\\\^" str))
  (setq str (replace-regexp-in-string "\\." "\\\\." str))
  (setq str (replace-regexp-in-string "\\?" "\\\\?" str))
  (setq str (replace-regexp-in-string "\\[" "\\\\[" str))
  (setq str (replace-regexp-in-string "\\]" "\\\\]" str))
  (setq str (replace-regexp-in-string "\\-" "\\\\-" str))
  )

(defun highlight-line (n-line)
  (let ((line (get-line-on-buffer (current-buffer)n-line)))
    (setq line (prepare-string-for-regexp line))
    (setq line
          (concat "^"
                  line
                  "$"))
    (setq highlighted-lines (cons line highlighted-lines))
    (highlight-regexp line 'isearch)
    )
  )

(defun unhighlight-errors ()
  (interactive)
  (if (not highlighted-lines)
      (message "Error highlight errased")
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
      (message "%d errors highlighted" (max-line buff))
      )
    (kill-buffer (buffer-name buff))
    )
  ;(insert-truc highlighted-lines)
  )


;; (defun insert-truc (truc)
;;   (if (not truc)
;;       nil
;;     (insert (concat (car truc) "\n"))
;;     (insert-truc (cdr truc))
;;     )
;;   )
;;(highlight-line 99)
;;(unhighlight-errors)

;;h$e.yb*sd^e+d\fe-de[3]

;;(setq format (prepare-string-for-regexp "h$e.yb*sd^e+d\\fe-de[3]"))

;;(highlight-phrase format)
;;(unhighlight-regexp format)

;;highlighted-lines

(global-set-key (kbd "C-c m") 'show-errors)
(global-set-key (kbd "C-c c") 'unhighlight-errors)
