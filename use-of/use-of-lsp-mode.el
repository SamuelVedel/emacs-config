(require 'lsp-mode)

;; To remove the lsp topbar
(setq lsp-headerline-breadcrumb-enable nil)
;; to kill the server after using it
(setq lsp-keep-workspace-alive nil)

;; enable wich-hey integration
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

;; change the lsp keymap prefix from s-l to C-c l
;; because s-l don't work when emacs is running in a terminal
(setq lsp-keymap-prefix "C-c l")
(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

;; disable auto formating
(setq lsp-enable-on-type-formatting nil)
