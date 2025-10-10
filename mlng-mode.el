;; define mlng major mode

(defconst mlng--font-lock-defaults
    '((
       ("#+[a-zA-Z0-9]+\\_>" 0 font-lock-preprocessor-face)
       ("#\n\\_>" 0 font-lock-preprocessor-face)
       ;;("#[0-9][0-9]*\\>" 0 font-lock-constant-face)
       ("\\_<\\(const\\|if\\|else\\|while\\|do\\|break\\|continue\\|return\\|sizeof\\|global\\)\\_>" 0 font-lock-keyword-face)
       ("\\.*\\_<\\(int1\\|int2\\|int4\\|int8\\|uint1\\|uint2\\|uint4\\|uint8\\|flt4\\|flt8\\|void\\)\\_>" 0 font-lock-type-face)
       ("\\.*\\_<[a-z][a-z0-9_]*_t\\_>" 0 font-lock-type-face)
       ("\\_<\\([a-z][a-z0-9_]*\\)\s*(" 1 font-lock-function-name-face)
       ("\\_<[a-z][a-z0-9_]*\\_>" 0 font-lock-variable-name-face)
       ("\\_<[A-Z_][A-Z0-9_]*\\_>" 0 font-lock-constant-face)
       )))

(defvar mlng-mode-syntax-table
  (let ((st (make-syntax-table)))
        ;; define parentesis
        (modify-syntax-entry ?\{ "(}" st)
        (modify-syntax-entry ?\} "){" st)
        (modify-syntax-entry ?\( "()" st)
        (modify-syntax-entry ?\) ")(" st)
        (modify-syntax-entry ?\[ "(]" st)
        (modify-syntax-entry ?\] ")[" st)
        
        (modify-syntax-entry ?_ "_" st)
        (modify-syntax-entry ?\\ "\\"    st)
        (modify-syntax-entry ?+  "."     st)
        (modify-syntax-entry ?-  "."     st)
        (modify-syntax-entry ?=  "."     st)
        (modify-syntax-entry ?%  "."     st)
        (modify-syntax-entry ?<  "."     st)
        (modify-syntax-entry ?>  "."     st)
        (modify-syntax-entry ?&  "."     st)
        (modify-syntax-entry ?|  "."     st)
        (modify-syntax-entry ?\' "\""    st)
        (modify-syntax-entry ?\240 "."   st)
        
        ;; ' and " for strings
        (modify-syntax-entry ?\" "\"" st)
        (modify-syntax-entry ?' "\"" st)
        
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
  (setq-local comment-end "")
  
  (set (make-local-variable 'indent-line-function) 'c-indent-line)
  (set (make-local-variable 'indent-region-function) 'c-indent-region))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.mlng\\'" . mlng-mode))
