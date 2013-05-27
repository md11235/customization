;;;; in paredit-mode Common Lisp: #P "" => #P""
(push #'(lambda (endp delimiter)
          (if (and (not endp)
                   (eq ?\" (char-syntax delimiter)))
              (if (and (member major-mode '(slime-repl-mode lisp-mode))
                       (string-equal (upcase (buffer-substring-no-properties (- (point) 2) (point)))
                                     "#P"))
                  nil
                t)
              t))
      paredit-space-for-delimiter-predicates)
      
