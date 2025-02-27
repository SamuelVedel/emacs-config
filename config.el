(if (not (boundp 'config-path)) ;; if config-path not def
    (setq config-path "~/emacs-config")
  )

(load (concat config-path "/theme.el"))
(load (concat config-path "/background.el"))
(load (concat config-path "/indent.el"))
(load (concat config-path "/comp.el"))
(load (concat config-path "/auto-comp.el"))
(load (concat config-path "/syntax-color.el"))
(load (concat config-path "/comments.el"))
(load (concat config-path "/keybindings.el"))

;; uncomment if you have installed glsl-mode.el
;; from https://raw.githubusercontent.com/jimhourihan/glsl-mode/master/glsl-mode.el
;; or https://maverick.inria.fr/~Xavier.Decoret/resources/glsl-mode/glsl-mode.el
;; it will use and configure glsl-mode,
;; it's a programming language to write shaders (code that are executed on GPU)
;;(load (concat config-path "/use-of-glsl-mode.el"))

;; uncomment if you have installed xclip.el
;; from https://www.emacswiki.org/emacs/xclip.el
;; is it for using x11 clipboard when using terminal emacs
;;(load (concat config-path "/use-of-xclip.el"))

;; uncomment if you have installed company from MELPA
;; is it for auto completion
;;(load (concat config-path "/use-of-company.el"))

;; uncomment if you have installed consult from MELPA
;;(load (concat config-path "/use-of-consult.el"))

;; uncomment if you have installed marginalia from MELPA
;;(load (concat config-path "/use-of-marginalia.el"))

;; uncomment if you have installed treemacs from MELPA
;; it is for a file tree
;;(load (concat config-path "/use-of-treemacs.el"))

;; uncomment if you have installed ace-window from MELPA
;; it is for switching buffer in a cool way
;;(load (concat config-path "/use-of-ace-window.el"))

;; uncomment if you have installed ace-jump-mode from MELPA
;; it is for a quick jump mode
;;(load (concat config-path "/use-of-ace-jump-mode.el"))

;; uncomment if you have installed markdown-mode from MELPA
;;(load (concat config-path "/use-of-markdown-mode.el"))

;; uncomment if you have installed lsp-mode from MELPA
;; it is generaly installed as a dependencies for
;; lsp-* packages
;;(load (concat config-path "/use-of-lsp-mode.el"))

;; uncomment if you have installed lsp-java from MELPA
;;(load (concat config-path "/use-of-lsp-java.el"))

;; uncomment if you have installed lsp-latex from MELPA
;;(load (concat config-path "/use-of-lsp-latex.el"))

;; before discovering treemacs, I used sr-speedbar
;; so you can uncomment if you have installed sr-speedbal.el
;; from https://www.emacswiki.org/emacs/download/sr-speedbar.el
;; it will use and configure the sr-speedbar
;; it's a file tree, a speedbar exist natively in emacs
;; but sr-speedbar a better version of the native one
;;(load (concat config-path "/use-of-sr-speedbar.el"))

;; before discovering company, I used auto-complete
;; so you uncomment this if you have installed auto-complete from MELPA
;;(load (concat config-path "/use-of-auto-complete.el"))

;; uncomment if you have installed bison-mode.el
;; form https://github.com/Wilfred/bison-mode
;; I prefere using c and c++ modes for bison
;; but you can use this if you want
;;(load (concat config-path "/use-of-bison-mode.el"))

;;(display-graphic-p &optional DISPLAY)
(if (display-graphic-p)
    (progn
      ;; si fenetrer
      (invert-face 'default) ;; dark mode
      ;;(set-background-dark-blue)
      ;;(add-to-list 'default-frame-alist '(background-color . "#171421"))
      ;;(add-hook 'prog-mode-hook #'(set-background-color "#171421"))
      ;;(add-hook 'prog-mode-hook (lambda () (set-background-color "#171421")))
      ;;(set-frame-font "Source Code Pro 11" nil t) ;; font
      (set-face-attribute 'default nil :height 110)
      (tool-bar-mode -1)
      (set-scroll-bar-mode 'left)
      )
  ;; si dans le terminal
  ;;(set-background-black)
  ;;(add-to-list 'default-frame-alist '(background-color . "#000000"))
  (require 'mouse)
  (xterm-mouse-mode t)
  )

(add-hook 'emacs-startup-hook
          (lambda ()
            (set-background-dark-blue)
            ))


(menu-bar-mode -1)

;; to use MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(show-paren-mode)
;;(add-hook 'find-file-hook (lambda () (linum-mode 1))) ;; line numbering
;;(global-display-line-numbers-mode 1)
;; line numbering
(global-display-line-numbers-mode)
;;(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;;(add-hook 'latex-mode-hook #'display-line-numbers-mode)

(add-hook 'latex-mode-hook #'visual-line-mode) ;; line that break smoothly in latex-mode
(column-number-mode t) ;; display column number bellow
(size-indication-mode t) ;; display buffer size bellow

;; highlight current line
;;(global-hl-line-mode 1)

;; enable camelCase
(add-hook 'prog-mode-hook 'subword-mode)

;;-------------------------------------
;; Non printable character
;; founded and modified from https://irfu.cea.fr/Pisp/vianney.lebouteiller/emacs.html#org4fa4284
;; show white spaces
(require 'whitespace)
(global-whitespace-mode 1)

(defun toggle-whitespace ()
  " Toggle the display of whitespaces "
  (interactive)
  (if whitespace-on
      (setq whitespace-on nil)
    (setq whitespace-on t)
    )
  (update-background)
  )

(global-set-key (kbd "C-c w") 'toggle-whitespace)

(progn
  ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  )

;;-------------------------------------
;; to move region
;; from https://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs

(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key (kbd "M-<left>") 'move-text-up)
(global-set-key (kbd "M-<right>") 'move-text-down)

;; for scrolling befor the end/start of the buffer
(setq scroll-step 1)
(setq scroll-margin 5)

;;-------------------------------------
;; Add mods
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-mode))
(add-to-list 'auto-mode-alist '("\\.ypp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.lpp\\'" . c++-mode))
;;(add-to-list 'auto-mode-alist '("\\.php\\'" . mhtml-mode))

;;-------------------------------------
;; Bordel

;;(show-paren-mode t) ;; show parenthesis mode
;;(setq line-number-mode t) ;; line number

;;(global-set-key (kbd "C-z") 'undo-only) ;; pour le ctrl-z
;;(when (require 'redo nil 'noerror)
;;	 (global-set-key (kbd "C-S-s") 'redo)) ;; pour le redo

;;(setq-default indent-tabs-mode nil) ;; remplacer les tabs par des espaces
;;(setq-default indent-tabs-mode t) ;; remet les tabs en tab

;; (setq auto-mode-alist '(("\\.ad[bs]\\'"   . ada-mode)
;;                         ("\\.awk\\'"      . awk-mode)
;;                         ("\\.c\\'"        . c-mode)
;;                         ("\\.lex\\'"      . c-mode)
;;                         ("\\.[cy]\\'"     . c++-mode)
;;                         ("\\.h\\'"        . c-mode) ;; befor it was c++-mode
;;                         ("\\.hxx\\'"      . c++-mode)
;;                         ("\\.[CH]\\'"     . c++-mode)
;;                         ("\\.java\\'"     . java-mode)
;;                         ("\\.cc\\'"       . c++-mode)
;;                         ("\\.hh\\'"       . c++-mode)
;;                         ("\\.cxx\\'"      . c++-mode)
;;                         ("\\.cpp\\'"      . c++-mode)
;;                         ("\\.rc\\'"       . c++-mode) ;; resource files
;;                         ("\\.rcv\\'"      . c++-mode)
;;                         ("\\.m\\'"        . matlab-mode)
;;                         ("\\.p[lm]\\'"    . perl-mode)
;;                         ("\\.cgi\\'"      . perl-mode)
;;                         ("\\.f\\'"      . fortran-mode)
;;                         ("\\.F\\'"      . fortran-mode)
;;                         ("\\.f90\\'"      . f90-mode)
;;                         ("\\.F90\\'"      . f90-mode)
;;                         ("\\.el\\'"       . emacs-lisp-mode)
;;                         ("\\.emacs\\'"    . emacs-lisp-mode)
;;                         ("\\.tex\\'"      . LaTeX-mode)
;;                         ("\\.bib\\'"      . bibtex-mode)
;;                         ("[Mm]akefile\\'" . makefile-mode)
;;                         ("\\.mak\\'"      . makefile-mode)
;;                         ("\\[Mm]akefile.\\'" . makefile-mode)
;;                         ("\\.bat\\'"      . shell-script-mode)
;;                         ("\\.tar\\'"      . tar-mode)
;;                         ("\\.php\\'"     . php-mode)
;;                         ("\\.html\\'"     . html-mode)
;;                         ("\\.jnlp\\'"     . html-mode)
;;                         ("\\.xml\\'"     . html-mode)
;;                         ("\\.pddl\\'"     . lisp-mode)
;;                         ("\\.css\\'"      . css-mode)
;;                         ("\\.py\\'"       . python-mode)
;;                         ("\\.yml\\'"      . yaml-mode)
;;                         ("\\.lisp\\'"     . lisp-mode)
;;                         ("\\.js\\'"       . js-mode)
;;                         ("\\.ts\\'"       . js-mode)
;;                         ))
