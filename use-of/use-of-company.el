(global-company-mode)

(setq company-prefix-key "C-c c")

;; to cycle through suggestions
(setq company-selection-wrap-around t)

;; to change the minor-mode string to cpy
(setq company-lighter-base "comp")

;;(setq company-minimum-prefix-length 100)
;; completion don't start automaticaly
;;(setq company-idle-delay nil)
;; completion start by pressing M-n, why, because it's quick
;;(global-set-key "\M-n" 'company-complete)
(global-set-key (kbd (concat company-prefix-key " a")) 'company-complete)

;; bind C-c f to complete file path
(global-set-key (kbd (concat company-prefix-key " f")) 'company-files)

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

;; to be case sensitive
(setq company-dabbrev-downcase nil)

;; to make company-clang backends don't complete arguments
(setq company-clang-insert-arguments nil)

;; to make company-clang complete with args when M-RET is pressed
(defun complete-with-args()
  "
  Autorise company-clang to complete args
  then complete the selection
  "
  (interactive)
  (let ((company-clang-insert-arguments t))
    (company-complete-selection)
    )
  )
(define-key company-active-map (kbd "M-RET") 'complete-with-args)

;; set company-frontends
(setq company-frontends '(;;company-pseudo-tooltip-unless-just-one-frontend-with-delay
                          company-pseudo-tooltip-unless-just-one-frontend
                          company-preview-if-just-one-frontend
                          ;;company-preview-frontend
                          company-preview-common-frontend
                          company-echo-metadata-frontend
                          ))

(defun company-add-clang-include (dir)
  (interactive "DEnter include directory")
  (add-to-list 'company-clang-arguments (concat "-I" (expand-file-name dir)))
  )

(global-set-key (kbd (concat company-prefix-key " i")) 'company-add-clang-include)
