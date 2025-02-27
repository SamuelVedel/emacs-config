(require 'auto-complete)
(global-auto-complete-mode t)

(setq ac-auto-start nil) ;; autocompletion don't start automaticaly
(global-set-key "\C-c \ " 'ac-start) ;; it start by pressing C-c SPACE
(define-key ac-complete-mode-map "\C-c \ " 'ac-stop) ;; on stop by pressing C-c SPACE

;; to use C-s in the completion list
(setq ac-use-menu-map t)

;; to ignore quick help
;; (setq ac-use-quick-help nil)

;; to don't ignore case
(setq ac-ignore-case nil)

(setq-default ac-sources '(ac-source-words-in-same-mode-buffers
                           ac-source-filename
                           ac-source-dictionary))

(defun add-emacs-lisp-completion ()
  (setq ac-sources (append ac-sources '(ac-source-functions
                                        ac-source-symbols
                                        ac-source-variables)))
  )

(add-hook 'emacs-lisp-mode-hook 'add-emacs-lisp-completion)

;;(add-hook 'c-mode-hook (lambda () (setq ac-sources '('ac-source-semantic))))
