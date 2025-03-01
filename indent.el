;; File for the configuration of the indentation

(setq-default c-basic-offset 4) ;; set the identation as 4 spaces
(setq-default tab-width 4) ;; display the tab with a with of 4
;; to delete tabs in one time
(setq backward-delete-char-untabify-method nil)

(setq indent-with-tabs nil) ;; to know if the indentation is with tabs or spaces
(defun set-indent-mode-tabs ()
  " Set the indentation with tabs "
  (interactive)
  (setq-default indent-tabs-mode t)
  (setq indent-with-tabs t)
  (message "Indent with tabs")
  )

(defun set-indent-mode-spaces ()
  " Set the indentation with spaces "
  (interactive)
  (setq-default indent-tabs-mode nil)
  (setq indent-with-tabs nil)
  (message "Indent with spaces")
  )

(defun toggle-indent-mode ()
  " Toggle the indentation between spaces and tabs "
  (interactive)
  (if indent-with-tabs
      (set-indent-mode-spaces)
    (set-indent-mode-tabs)
    )
  )

(set-indent-mode-tabs) ;; set the indentation with tabs
(global-set-key (kbd "C-c i") 'toggle-indent-mode)
