(global-company-mode)

;; to cycle through suggestions
(setq company-selection-wrap-around t)

;; to change the minor-mode string to cpy
(setq company-lighter-base "comp")

;;(setq company-minimum-prefix-length 100)
;; completion don't start automaticaly
(setq company-idle-delay nil)
;; completion start by pressing M-n, why, because it's quick
(global-set-key "\M-n" 'company-complete)

;; bind C-c f to complete file path
(global-set-key (kbd "C-c f") 'company-files)

;; to don't have to write something that matches a completion
(setq company-require-match nil)

;;(setq company-tooltip-align-annotations t)

;; to have number of line below and above instead of a scrollbar
(setq company-tooltip-offset-display 'lines)

(setq company-tooltip-flip-when-above t)

;; display quick access key at the left of the tooltip
(setq company-show-quick-access t)

;; to have a yellow scrollbar
;;(custom-set-faces '(company-scrollbar-fg ((t (:background "#eae19c")))))

;; set company-frontends
(setq company-frontends '(;;company-pseudo-tooltip-unless-just-one-frontend-with-delay
                          company-pseudo-tooltip-unless-just-one-frontend
                          company-preview-if-just-one-frontend
                          ;;company-preview-frontend
                          company-preview-common-frontend
                          company-echo-metadata-frontend
                          ))
