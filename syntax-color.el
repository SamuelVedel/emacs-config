;;(font-lock-add-keywords 'java-mode '((
;;                                      "\\( \\|^\\|(\\|\\.\\)[a-zA-Z1-9]+ *("
;;                                      . font-lock-function-name-face)))

(font-lock-add-keywords
 'java-mode
 '(("\\([a-zA-Z1-9_]+\\) *("
    1
    'font-lock-function-name-face
    nil
    ))
 t
 )
