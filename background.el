;; Change background color to dark blue or black
;; Useful because color in ubuntu terminal are strange
(require 'whitespace)

(defun set-whitespace-background (color)
  (set-face-attribute 'whitespace-tab nil
                      :background color ;;"#222244"
                      ;;:foreground "#FFFF00"
                      :weight 'normal)

  (set-face-attribute 'whitespace-newline nil
                      :background color ;;"#222244"
                      :weight 'normal)

  (set-face-attribute 'whitespace-space nil
                      :background color
                      :weight 'normal)
  )

(setq background-is-black nil)
(defun set-background (color)
  (interactive)
  (set-background-color color)
  (set-whitespace-background color)
  )

(defun set-background-dark-blue ()
  (interactive)
  (set-background "#171421")
  (setq background-is-black nil)
  (message "set background at dark blue")
  )

(defun set-background-black ()
  (interactive)
  (set-background "#000000")
  (setq background-is-black t)
  (message "set background at black")
  )

(defun toggle-background ()
  (interactive)
  (if background-is-black
      (set-background-dark-blue)
    (set-background-black)
    )
  )

(global-set-key (kbd "C-c b") 'toggle-background)
