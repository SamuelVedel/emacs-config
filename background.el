;; Change background color to dark blue or black
;; Useful because color in ubuntu terminal are strange
(require 'whitespace)

(setq whitespace-on t)
(setq whitespace-color "#c0c0c0")

(defun set-whitespace-background (color)
  "Set the background color for the whitespaces characteres"
  (set-face-attribute 'whitespace-tab nil
                      :background color ;;"#222244"
                      ;;:foreground "#FFFF00"
                      ;;:weight 'normal
                      )

  (set-face-attribute 'whitespace-newline nil
                      :background color ;;"#222244"
                      ;;:weight 'normal
                      )

  (set-face-attribute 'whitespace-space nil
                      :background color
                      ;;:weight 'normal
                      )
  )

(defun set-whitespace-foreground (color)
  "Set the foreground color for the whitespaces characteres"
  (set-face-attribute 'whitespace-tab nil
                      :foreground color
                      )

  (set-face-attribute 'whitespace-newline nil
                      :foreground color
                      )

  (set-face-attribute 'whitespace-space nil
                      :foreground color
                      )
  )

(setq black-color "#000000")
;;(setq dark-blue-color "#171421")
(setq dark-blue-color back-color-th)
(setq background black-color)

(defun update-background ()
  (set-background-color background)
  (set-whitespace-background background)
  (if (not whitespace-on)
      (set-whitespace-foreground background)
    (set-whitespace-foreground whitespace-color)
    )
  )

(defun set-background (color)
  "Set the background"
  ;;(interactive)
  (setq background color)
  (update-background)
  )

(defun set-background-dark-blue ()
  "Set the background to a sort of dark blue"
  ;;(interactive)
  (set-background dark-blue-color)
  (message "set background at dark blue")
  )

(defun set-background-black ()
  "Set the background to black"
  ;;(interactive)
  (set-background black-color)
  (message "set background at black")
  )

(defun toggle-background ()
  "
  Toggle the background color between
  black and dark blue
  "
  (interactive)
  (if (eq background black-color)
      (set-background-dark-blue)
    (set-background-black)
    )
  )

(global-set-key (kbd "C-c b") 'toggle-background)
