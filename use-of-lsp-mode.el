(require 'lsp-mode)

(setq lsp-headerline-breadcrumb-enable nil)

;; enable wich-hey integration
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
