;; from https://raw.githubusercontent.com/jimhourihan/glsl-mode/master/glsl-mode.el
;; or https://maverick.inria.fr/~Xavier.Decoret/resources/glsl-mode/glsl-mode.el
(require 'glsl-mode)
(add-to-list 'auto-mode-alist
             '("\\.vert\\'"       . glsl-mode)
             )
(add-to-list 'auto-mode-alist
             '("\\.frag\\'"       . glsl-mode)
             )
