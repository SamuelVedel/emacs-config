(setq c-bin "null")
(setq c++-bin "null")
(setq latex-file "null")
(setq java-bin "bin")

(setq scripts-path (concat config-path "/scripts"))

(defun exec (cmd buffer)
  "
  Execute de command cmd, and
  dump the output in the buffer in args
  "
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

(defun exec-async (cmd buffer)
  (async-shell-command
   cmd
   buffer
   buffer
   )
  )

(defun get-bad-lines (buffer)
  "
  Execute a compilation command and dump
  the lines with errors in the buffer enter in args.
  Work for java-mode and c-mode
  "
  (let ((cmd nil))
    (if (eq major-mode 'java-mode)
        (setq cmd (concat
                    scripts-path "/get_err_java.sh "
                    (buffer-file-name (current-buffer))
                    " " java-bin
                    )))
    (if (eq major-mode 'c-mode)
        (setq cmd (concat
                    scripts-path "/get_err_c.sh "
                    (buffer-file-name (current-buffer))
                    " " c-bin
                    )))
    (if (eq major-mode 'c++-mode)
        (setq cmd (concat
                    scripts-path "/get_err_c++.sh "
                    (buffer-file-name (current-buffer))
                    " " c++-bin
                    )))
    (if (eq major-mode 'latex-mode)
        (setq cmd (concat
                   scripts-path "/get_err_latex.sh "
                   (buffer-file-name (current-buffer))
                   " " latex-file
                   )))
    (if (eq major-mode 'js-mode)
        (setq cmd (concat
                   scripts-path "/get_err_ts.sh "
                   (buffer-file-name (current-buffer))
                   )))
    (if (not cmd)
        nil
      (exec cmd buffer)
      t
      )
    )
  )

(setq clang-tidy-args "")

(defun call-clang-tidy (buffer)
  "
  Execute a compilation command and dump
  the lines with errors in the buffer enter in args.
  Work for java-mode and c-mode
  "
  (let ((cmd nil))
    (if (eq major-mode 'c-mode)
        (setq cmd (concat
                    scripts-path "/clang-td-c.sh "
                    (buffer-file-name (current-buffer))
                    " " clang-tidy-args)))
    (if (not cmd)
        nil
      (exec cmd buffer)
      t
      )
    )
  )

(defun get-line-on-buffer (buffer line)
  "
  Return a line of a buffer
  "
  (save-excursion
    (set-buffer buffer)
    (goto-line line)
    (buffer-substring-no-properties (line-beginning-position) (line-end-position))
    )
  )

(defun max-line (buffer)
  "
  Return the buffer's number of line
  "
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
  "
  Highlight the line numbers that is write in the
  buffer
  "
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
  "
  Highlight in the current buffer
  the line n-line with isearch face
  and save in the highlighted-lines what
  is highlighted
  "
  (let ((line (get-line-on-buffer (current-buffer)n-line)))
    (setq line (prepare-string-for-regexp line))
    (setq line
          (concat "^"
                  line
                  "$"))
    (setq highlighted-lines (cons line highlighted-lines))
    ;;(highlight-regexp line 'isearch)
    ;;(highlight-regexp line 'error)
    (highlight-regexp line 'confusingly-reordered)
    )
  )

(defun unhighlight-errors ()
  "
  Unhighlight errors thanks to the var
  highlighted-lines
  "
  (interactive)
  (if (not highlighted-lines)
      (message "Error highlight errased")
    (unhighlight-regexp (car highlighted-lines))
    (setq highlighted-lines (cdr highlighted-lines))
    (unhighlight-errors)
    )
  )

(defun open-pdf ()
  "
  Open with evince the file buffer-file-name but with .tex replaced by .pdf
  if the current buffer is in latex-mode
  "
  (interactive)
  (if (eq major-mode 'latex-mode)
      (exec-async (concat scripts-path "/open_pdf.sh "
                          (buffer-file-name (current-buffer))
                          " " latex-file)
                  nil)
    (message "You are not in latex-mode")
    )
  )

(defun show-errors ()
  "
  Compile the code and highlight errors in the buffer
  work with java-mode and c-mode
  "
  (interactive)
  (unhighlight-errors)
  (let ((buff (generate-new-buffer "err-lines")))
    (if (not (get-bad-lines buff))
        (message "No compilation for %s" major-mode)
      (highlight-errors buff)
      (message "%d errors highlighted" (max-line buff))
      )
    (kill-buffer (buffer-name buff))
    )
  )

(defun show-clang-tidy-errors ()
  "
  Call clang-tidy and highlight errors
  "
  (interactive)
  (unhighlight-errors)
  (let ((buff (generate-new-buffer "err-lines")))
    (if (not (call-clang-tidy buff))
        (message "No use of clang-tidy for %s" major-mode)
      (highlight-errors buff)
      (message "%d errors highlighted" (max-line buff))
      )
    (kill-buffer (buffer-name buff))
    )
  )

(defun show-errors-explanation ()
  "
  Open in another window the error output
  of the lastest compilation thanks to show-errors
  function.
  "
  (interactive)
  (find-file-read-only-other-window (concat config-path "/zut.txt"))
  )

(defun change-bin-folder (n-bin)
  "
  Change the folder/file name for compilation, work with c-mode, latex-mode.
  Don't forgot to the '/' ad the end of the name
  "
  (interactive "MEnter compilation folder/file: ")
  (if (eq major-mode 'c-mode)
      (progn
        (setq c-bin n-bin)
        (message "Change the folder for binary file in c to %s" c-bin)
        )
    (if (eq major-mode 'c++-mode)
      (progn
        (setq c++-bin n-bin)
        (message "Change the folder for binary file in c to %s" c-bin)
        )
      (if (eq major-mode 'latex-mode)
          (progn
            (setq latex-file n-bin)
            (message "Change the main file in latex to %s" latex-file)
            )
        (if (eq major-mode 'java-mode)
            (progn
              (setq java-bin n-bin)
              (message "Change the folder for binary file in java to %s" java-bin)
              )
          (message "No binary folder selection for %s" major-mode)
          )
        )
      )
    )
  )

(defun change-clang-tidy-args (args)
  "
  change the arguments for the clang-tidy call
  "
  (interactive "MEnter binary folder: ")
  (setq clang-tidy-args args)
  (message "Change the arguments for the clang-tidy call to %s" clang-tidy-args)
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

(add-to-list 'display-buffer-alist '("*Async Shell Command*" display-buffer-no-window (nil)))

(global-set-key (kbd "C-c m") 'show-errors)
(global-set-key (kbd "C-c c") 'unhighlight-errors)
(global-set-key (kbd "C-c e") 'show-errors-explanation)
(global-set-key (kbd "C-c o") 'change-bin-folder)
(global-set-key (kbd "C-c s") 'open-pdf)
;;(global-set-key (kbd "C-c t") 'show-clang-tidy-errors)
;;(global-set-key (kbd "C-c a") 'change-clang-tidy-args)
