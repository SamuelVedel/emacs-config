(setq back-color-th "#1B2631")
(setq key-color-th "#AED6F1")
(setq var-color-th "#F4D03F")
(setq func-color-th "#7FB3D5")
(setq type-color-th "#58D68D")
(setq const-color-th "#C39BD3")
(setq comm-color-th "#B3B6B7")

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

