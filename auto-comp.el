;; Ajoute de la completion automatique

(defun print-out-completion ()
  "
  Insert in the buffer the name of
  the print function. Work with java-mode
  c-mode python-mode and js-mode
  "
  (interactive)
  (let ((print-str nil))
    (if (eq major-mode 'java-mode)
        (setq print-str "System.out.println")
      (if (eq major-mode 'c-mode)
          (setq print-str "printf")
        (if (eq major-mode 'python-mode)
            (setq print-str "print")
          (if (eq major-mode 'js-mode)
              (setq print-str "console.log")
            (if (eq major-mode'c++-mode)
                (setq print-str "std::cout<<")
            )))))
    (if (not print-str)
        (message "No known print function for %s" major-mode)
      (insert print-str)
      )))

(defun print-err-completion ()
  "
  Insert in the buffer the name of
  the print function. Work with java-mode
  c-mode python-mode and js-mode
  "
  (interactive)
  (let ((print-str nil))
    (if (eq major-mode 'java-mode)
        (setq print-str "System.err.println")
      (if (eq major-mode 'c-mode)
          (setq print-str "fprintf(stderr, ")
        (if (eq major-mode'c++-mode)
            (setq print-str "std::cerr<<")
          )))
    (if (not print-str)
        (message "No known error print function for %s" major-mode)
      (insert print-str)
      )))

(global-set-key (kbd "C-c p o") 'print-out-completion)
(global-set-key (kbd "C-c p e") 'print-err-completion)
