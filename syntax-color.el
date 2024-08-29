;;(font-lock-add-keywords 'java-mode '((
;;                                      "\\( \\|^\\|(\\|\\.\\)[a-zA-Z0-9]+ *("
;;                                      . font-lock-function-name-face)))

;;(defconst char-befor-words "\\( \\|(\\|)\\|\\.\\|^\\)")

;;(set-face-attribute 'font-lock-keyword-face nil
;;                    :foreground "#ff8c00")

;(set-face-attribute 'font-lock-comment-face nil
;                    :foreground "#c0c0c0")

(font-lock-add-keywords
 'java-mode
 ;;'(("\\([a-zA-Z0-9_]+\\) *("
 '(("[^a-zA-Z0-9_]\\([a-z][a-zA-Z0-9]*\\) *("
    1
    'font-lock-function-call-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z][a-zA-Z0-9]*\\)"
    1
    'font-lock-variable-use-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([A-Z][A-Z0-9_]*\\)[^a-zA-Z0-9_]"
    1
    'font-lock-constant-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([A-Z][a-zA-Z0-9]*\\)[^a-zA-Z0-9_]"
    1
    'font-lock-type-face
    nil
    )
   )
 t
 )

(font-lock-add-keywords
 'c-mode
 '(("\\([a-z][a-zA-Z0-9_]*\\) *("
    1
    'font-lock-function-call-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-zA-Z][a-zA-Z0-9_]*_t\\)[^a-zA-Z_]"
    1
    'font-lock-type-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z][a-zA-Z0-9_]*\\)"
    1
    'font-lock-variable-use-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([A-Z][A-Z0-9_]*\\)"
    1
    'font-lock-constant-face
    nil
    ))
 t
 )

(font-lock-add-keywords
 'python-mode
 '(("\\([a-zA-Z][a-zA-Z0-9_]*\\) *("
    1
    'font-lock-function-call-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-zA-Z_][a-zA-Z0-9_]*\\)"
    1
    'font-lock-variable-use-face
    nil
    )
   ;; ("[^a-zA-Z0-9_]\\([A-Z][A-Z0-9_]*\\)"
   ;;  1
   ;;  'font-lock-constant-face
   ;;  nil
   ;;  )
   )
 t
 )

(font-lock-add-keywords
 'js-mode
 ;;'(("\\([a-zA-Z0-9_]+\\) *("
 '(("\\(type\\)[^a-zA-Z0-9_]"
    1
    'font-lock-keyword-face
    nil
    )
   ("[^a-zA-Z0-9_]\\(number\\|bigint\\|string\\)[^a-zA-Z0-9_]"
    1
    'font-lock-type-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([A-Z][a-zA-Z0-9_]*\\)"
    1
    'font-lock-type-face
    nil
    )
   ("\\([a-z_][a-zA-Z0-9]*\\) *("
    1
    'font-lock-function-call-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z_][a-zA-Z0-9]*\\)"
    1
    'font-lock-variable-use-face
    nil
    )
   )
 t
 )

;; bordel ----------------------
;; (defun my-latex-comment-region ()
;;   "Highlight text between \\begin{comment} and \\end{comment} as comments in LaTeX mode."
;;   (font-lock-add-keywords
;;    nil
;;    '(("\\(\\\\begin{comment}\\)\\(.\\|\n\\)*?\\(\\\\end{comment}\\)"
;;       (1 font-lock-comment-face t)
;;       (2 font-lock-comment-face t)
;;       (3 font-lock-comment-face t)))))

;; (add-hook 'latex-mode-hook 'my-latex-comment-region)

;; (font-lock-add-keywords
;;  'latex-mode
;;  '(("\begin{comment}\\([.^$]*\\)\end{comment}"
;;     1
;;     'font-lock-comment-face
;;     t
;;     )
;;    ("\\(haha\\)"
;;     1
;;     'font-lock-comment-face
;;     t
;;     )
;;    ("x\\(\\(?:.\\|\n\\)*\\)x"
;;     (1
;;     'font-lock-comment-face
;;     t)
;;     )
;;    )
;;  t
;;  )

;; (defun my-multiline-font-lock ()
;;   "Highlight multiline patterns in the current buffer."
;;   (font-lock-add-keywords
;;    nil
;;    '(("\\(start\\(?:.\\|\n\\)*?end\\)"
;;       (1 font-lock-keyword-face t)))))

;; (add-hook 'latex-mode-hook 'my-multiline-font-lock)


;;(highlight-regexp "[a-zA-Z1-9]")
;;(unhighlight-regexp "[a-zA-Z1-9]")
