;; bindings for resizing buffer
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)

;; binding for toggleing truncate lines
(global-set-key (kbd "C-c r") 'toggle-truncate-lines)

;; functions and binding for scrolling manually
(defun scroll-down-1 ()
  (interactive)
  (scroll-down 1)
  )

(defun scroll-up-1 ()
  (interactive)
  (scroll-up 1)
  )

(global-set-key (kbd "M-<up>") 'scroll-down-1)
(global-set-key (kbd "M-p") 'scroll-down-1)
(global-set-key (kbd "M-<down>") 'scroll-up-1)
(global-set-key (kbd "M-n") 'scroll-up-1)

;; (global-set-key (kbd "C-j") 'backward-char) ;; previous eval-print-last-sexp
;; (global-set-key (kbd "C-k") 'forward-char) ;; previous kill-line :(
;; (global-set-key (kbd "M-j") 'backward-word) ;; previous default-indent-new-line
;; (global-set-key (kbd "M-k") 'forward-word) ;; previous kill-sentence
;; (global-set-key (kbd "C-M-j") 'move-beginning-of-line) ;; previous default-indent-new-line
;; (global-set-key (kbd "C-M-k") 'move-end-of-line) ;; previous kill-sexp

;; (global-set-key (kbd "C-d") 'previous-line) ;; previous delete-char
;; (global-set-key (kbd "C-f") 'next-line) ;; previous forward-char
;; (global-set-key (kbd "M-d") 'backward-paragraph) ;; previous kill-word
;; (global-set-key (kbd "M-f") 'forward-paragraph) ;; previous forward-word
;;(global-set-key (kbd "C-M-d") 'beginning-of-buffer) ;; previous donw-list
;;(global-set-key (kbd "C-M-f") 'end-of-buffer) ;; previous forward-sexp

(global-set-key (kbd "M-RET") 'default-indent-new-line)
;;(global-set-key (kbd "C-DEL") 'backward-kill-word)
(global-set-key (kbd "M-a") 'backward-paragraph)
(global-set-key (kbd "M-e") 'forward-paragraph)

(global-set-key (kbd "C-c d") 'kill-whole-line)

(global-set-key (kbd "C-x <left>") 'windmove-left) ;; was prevously assigned
(global-set-key (kbd "C-x <right>") 'windmove-right) ;; was prevously assigned
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
