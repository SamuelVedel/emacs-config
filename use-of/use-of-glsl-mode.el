;; from https://raw.githubusercontent.com/jimhourihan/glsl-mode/master/glsl-mode.el
;; or https://maverick.inria.fr/~Xavier.Decoret/resources/glsl-mode/glsl-mode.el
(require 'glsl-mode)
(add-to-list 'auto-mode-alist
             '("\\.vert\\'"       . glsl-mode)
             )
(add-to-list 'auto-mode-alist
             '("\\.frag\\'"       . glsl-mode)
             )

(font-lock-add-keywords
 'glsl-mode
 '(("\\([a-z][a-zA-Z0-9]*\\) *("
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
   ("[^a-zA-Z0-9_]\\([A-Z][a-zA-Z0-9]*\\)[^a-zA-Z_]"
    1
    'font-lock-type-face
    nil
    )
   )
 t
 )
