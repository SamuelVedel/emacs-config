;;(font-lock-add-keywords 'java-mode '((
;;                                      "\\( \\|^\\|(\\|\\.\\)[a-zA-Z1-9]+ *("
;;                                      . font-lock-function-name-face)))

;;(defconst char-befor-words "\\( \\|(\\|)\\|\\.\\|^\\)")

(font-lock-add-keywords
 'java-mode
 ;;'(("\\([a-zA-Z1-9_]+\\) *("
 '(("\\([a-z][a-zA-Z1-9]*\\) *("
    1
    'font-lock-function-name-face
    nil
    )
   ("[^a-zA-Z1-9_]\\([a-z][a-zA-Z1-9]*\\)"
    1
    'font-lock-variable-name-face
    nil
    )
   ("[^a-zA-Z1-9_]\\([A-Z][A-Z1-9_]*\\)"
    1
    'font-lock-constant-face
    nil
    )
   ("[^a-zA-Z1-9_]\\([A-Z][a-zA-Z1-9]*\\)\\."
    1
    'font-lock-type-face
    t
    ))
 t
 )

;;(highlight-regexp "[a-zA-Z1-9]")
;;(unhighlight-regexp "[a-zA-Z1-9]")
