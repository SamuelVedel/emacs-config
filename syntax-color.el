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
    'font-lock-function-name-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z][a-zA-Z0-9]*\\)"
    1
    'font-lock-variable-name-face
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
    'font-lock-function-name-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-zA-Z][a-zA-Z0-9_]*_t\\)[^a-zA-Z_]"
    1
    'font-lock-type-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z][a-zA-Z0-9_]*\\)"
    1
    'font-lock-variable-name-face
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
    'font-lock-function-name-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-zA-Z_][a-zA-Z0-9_]*\\)"
    1
    'font-lock-variable-name-face
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
    'font-lock-function-name-face
    nil
    )
   ("[^a-zA-Z0-9_]\\([a-z_][a-zA-Z0-9]*\\)"
    1
    'font-lock-variable-name-face
    nil
    )
   )
 t
 )

;; for block comment in latex for text between
;; \begin{comment}
;; and
;; \end{comment}

(defconst latex-big-comments
  (syntax-propertize-rules
   ("\\(\\\\\\)begin{comment}" (1 "< b"))
   ("\\\\end{comment\\(}\\)" (1 "> b"))
   )
  )

(add-hook 'latex-mode-hook
           (lambda ()
             (make-local-variable 'parse-sexp-lookup-properties)
             (setq parse-sexp-lookup-properties t)
             (make-local-variable 'syntax-propertize-function)
             (setq syntax-propertize-function latex-big-comments)
             )
           )

;;(highlight-regexp "[a-zA-Z1-9]")
;;(unhighlight-regexp "[a-zA-Z1-9]")
