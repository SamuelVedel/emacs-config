;; define mlng major mode

(defconst mlng--font-lock-defaults
  (let ((keywords '("const"))
        (types '("int1" "int2" "int4" "int8" "flt4" "flt8" "void")))
    '((("\\(const\\|if\\|while\\|do\\|break\\|continue\\|return\\)" 0 font-lock-keyword-face)
       ("\\([a-z][a-z,0-9,_]*\\)\s*(" 1 font-lock-function-name-face)
       ("\\.*\\(int1\\|int2\\|int4\\|int8\\|uint1\\|uint2\\|uint4\\|uint8\\|flt4\\|flt8\\|void\\)" 0 font-lock-type-face)
       ("[a-z][a-z,0-9,_]*" 0 font-lock-variable-name-face)
       ("[A-Z][A-Z,0-9,_]*" 0 font-lock-constant-face)))))

(defvar mlng-mode-syntax-table
  (let ((st (make-syntax-table)))
        ;; define parentesis
        (modify-syntax-entry ?\{ "(}" st)
        (modify-syntax-entry ?\} "){" st)
        (modify-syntax-entry ?\( "()" st)
        (modify-syntax-entry ?\) ")(" st)
        (modify-syntax-entry ?\[ "(]" st)
        (modify-syntax-entry ?\] ")[" st)
        
        ;; _ word cotnituent
        (modify-syntax-entry ?_ "w" st)
        
        ;; ' and " for strings
        (modify-syntax-entry ?\" "\"" st)
        (modify-syntax-entry ?' "'" st)
        
        ;; // line comments
        ;; and /* */ block comments
        (modify-syntax-entry ?/ ". 124b" st)
        (modify-syntax-entry ?* ". 23" st)
        (modify-syntax-entry ?\n "> b" st)
        st))

;;;###autoload
(define-derived-mode mlng-mode c-mode "mlng"
  "Major mode for mlng files."
  (setq font-lock-defaults mlng--font-lock-defaults)
  (setq-local comment-start "//")
  (setq-local cooemnt-end "")
  
  (set (make-local-variable 'indent-line-function) 'c-indent-line)
  (set (make-local-variable 'indent-region-function) 'c-indent-region))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.mlng\\'" . mlng-mode))
