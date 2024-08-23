;; from https://www.emacswiki.org/emacs/download/sr-speedbar.el
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil) ;; on the left side
(setq sr-speedbar-auto-refresh nil) ;; no auto refresh
;;(setq sr-speedbar-show-unknown-files t)
;;(setq sr-speedbar-show-all-files t)
(global-set-key (kbd "C-c t") 'sr-speedbar-toggle)
