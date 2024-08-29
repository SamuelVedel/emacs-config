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

(defun slash-slash-comments ()
  (setq-local comment-start "//")
  (setq-local comment-end "")
  )

(add-hook 'c-mode-hook (lambda () (slash-slash-comments)))

;;bordel ----------------------
;;(defconst hehehaha
;;  (syntax-propertize-rules
;;   ("\\(<\\)<" (1 "(>"))
;;   (">\\(>\\)" (1 ")<"))
;;   ("\\(\\\\\\)begin{comment}" (1 "< b"))
;;   ("\\\\end{comment\\(}\\)" (1 "> b"))
;;   ))

;;(defun my-java-block9syntax-table ()
;;  (interactive)
;;  (let ((synTable (make-syntax-table)))
;;    (modify-syntax-entry ?\/ ". 15" synTable)
;;    (modify-syntax-entry ?* ". 23" synTable)
;;    (set-syntax-table synTable)
;;    (font-lock-fontify-buffer)))

;;(my-java-block9syntax-table)

;;(add-hook 'latex-mode-hook
;;          (lambda ()
;;            (set (make-local-variable 'comment-multi-line) nil)
;;            (set (make-local-variable 'comment-start) "/*")
;;            (set (make-local-variable 'comment-end) "*/")
;;            )
;;          )
