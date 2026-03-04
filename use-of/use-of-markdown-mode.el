(add-hook 'markdown-mode-hook #'visual-line-mode) ;; lines that break smoothly

;; to prevent markdown from overriding scrolling keybindings
(add-hook 'markdown-mode-hook 
          (lambda ()
            (define-key markdown-mode-map (kbd "M-p") nil)
            (define-key markdown-mode-map (kbd "M-n") nil)
            ))
