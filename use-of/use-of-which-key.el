(require 'which-key)

(which-key-mode)
;;(which-key-setup-minibuffer)
(which-key-setup-side-window-bottom)

(which-key-add-key-based-replacements
  "C-c l" "long lines"
  "C-c n" "line numbering"
  "C-c +" "increment"
  "C-c + +" "increment of n"
  "C-c c" "complete"
  "C-c g" "goto"
  "C-c m" "make"
  "C-c p" "print completion")
