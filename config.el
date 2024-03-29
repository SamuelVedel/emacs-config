;;(load "~/config-emacs/python-mode.el")
(load "~/emacs-config/background.el")
(load "~/emacs-config/indent.el")
(load "~/emacs-config/comp.el")
(load "~/emacs-config/auto-comp.el")
(load "~/emacs-config/syntax-color.el")

;;(display-graphic-p &optional DISPLAY)
(if (display-graphic-p)
    (progn
      ;; si fenetrer
      (invert-face 'default) ;; dark mode
      (set-background-dark-blue)
      (add-to-list 'default-frame-alist '(background-color . "#171421"))
      )
  ;; si dans le terminal
  (set-background-black)
  (add-to-list 'default-frame-alist '(background-color . "#000000"))
  (require 'mouse)
  (xterm-mouse-mode t)
  )

(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(show-paren-mode)
(add-hook 'find-file-hook (lambda () (linum-mode 1))) ;; line numbering
(global-hl-line-mode 0)
(add-hook 'prog-mode-hook 'subword-mode) ;; enable camelCase

;;-------------------------------------
;; Non printable character
;; founded and modified from https://irfu.cea.fr/Pisp/vianney.lebouteiller/emacs.html#org4fa4284
;; show white spaces
(require 'whitespace)
(global-whitespace-mode 1)

(defun toggle-whitespace ()
  " Toggle the display of whitespaces "
  (interactive)
  (if global-whitespace-mode
      (global-whitespace-mode 0)
    (global-whitespace-mode 1)
    )
  )

(global-set-key (kbd "C-c w") 'toggle-whitespace)

(progn
  ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
  )

;;-------------------------------------
;; Add mods
(add-to-list 'auto-mode-alist
             '("\\.ts\\'"       . js-mode)
             )

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
