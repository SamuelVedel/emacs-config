;;(setq back-color-th "#32303b")
;;(setq back-color-th "#302e39")
(setq back-color-th "#2e2c37")
;;(setq back-color-th "#2c2a35")
;;(setq back-color-th "#1B2631")
(setq key-color-th "#86c1e9")
(setq var-color-th "#eae19c")
(setq func-color-th "#97a4ce")
(setq type-color-th "#58D68D")
(setq const-color-th "#d19ec9")
(setq comm-color-th "#aaaaaa")

(set-face-attribute 'font-lock-keyword-face nil
					:foreground key-color-th)

(set-face-attribute 'font-lock-variable-name-face nil
					:foreground var-color-th)
(set-face-attribute 'font-lock-variable-use-face nil
					:foreground var-color-th)

(set-face-attribute 'font-lock-function-name-face nil
					:foreground func-color-th)
(set-face-attribute 'font-lock-function-call-face nil
					:foreground func-color-th)

(set-face-attribute 'font-lock-type-face nil
					:foreground type-color-th)

(set-face-attribute 'font-lock-constant-face nil
					:foreground const-color-th)

(set-face-attribute 'font-lock-comment-face nil
					;;:foreground "#c0c0c0")
					:foreground comm-color-th)

