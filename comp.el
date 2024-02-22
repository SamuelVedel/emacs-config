;; (defun exec (cmd buffer)
;;   (shell-command-on-region
;;    1
;;    1
;;    cmd
;;    buffer
;;    t
;;    nil
;;    nil)
;;   )

(defun exec (cmd buffer)
  (async-shell-command
   cmd
   buffer
   buffer
   )
  )

(defun ls ()
  (setq ls-buffer (generate-new-buffer "ls"))
  (exec "ls -l" ls-buffer)
  ;;(switch-to-buffer ls-buffer)
  )

(ls)

(kill-buffer (buffer-name ls-buffer))

(defun get-line-on-buffer (buffer line)
  (save-excursion
    (set-buffer ls-buffer)
    (goto-line line)
    (buffer-substring-no-properties (line-beginning-position) (line-end-position))
    )
  )

(get-line-on-buffer ls-buffer 1)

(progn
  (set-buffer ls-buffer)
  (goto-line 3)
  (buffer-substring-no-properties (line-beginning-position) (line-end-position))
  ;;(set-buffer (current-buffer))
  )

(defun color-line (line color)
  (save-excursion
    (if color
        (setq color-changed t))
    (goto-line line)
    (put-text-property
     (line-beginning-position)
     (line-end-position)
     'font-lock-face `(:background ,color))
    )
  )
sdfdd
(color-line 56 nil)

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

(max-line ls-buffer)
(max-line (current-buffer))

(defun color-red-line (buffer)
  (let ((n-line 1)
        (m-line (max-line buffer))
        line)
    (while (< n-line m-line)
      (setq line (get-line-on-buffer buffer n-line))
      (color-line (string-to-number line) "#ff0000")
      (setq n-line (+ n-line 1))
      )
    )
  )
sdfsdf
dssdf
(defun reset-color ()
  (interactive)
  
  (let ((n-line 1)
        (m-line (max-line (current-buffer))))
    (while (< n-line m-line)
      (color-line n-line nil)
      (setq n-line (+ n-line 1))
      )
    )
  )

(reset-color)

(color-line 88 nil)
(color-red-line ls-buffer)

(setq color-changed nil)

(local-set-key [t] 'reset-color)

(if "hey"
    1
  2)
