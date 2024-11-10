(global-company-mode)

;; to cycle through suggestions
(setq company-selection-wrap-around t)

;; to change the minor-mode string to cpy
(setq company-lighter-base "comp")

;; completion don't start automaticaly
(setq company-idle-delay nil)
;; completion start by pressing M-n, why, because it's quick
(global-set-key "\M-n" 'company-complete)

;; bind C-c f to complete file path
(global-set-key (kbd "C-c f") 'company-files)
