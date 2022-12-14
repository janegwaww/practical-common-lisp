;; a) copy-list
(defun new-copy-list (lst)
  (and (listp lst)
       (reduce
        #'(lambda (k v)
            (if (listp k)
                (append k (list v))
                (list k v)))
        lst)))

;; b) reverse(for lists)
(defun new-reverse (lst)
  (and (listp lst)
       (reduce #'(lambda (k v)
                   (if (listp k)
                       (append (list v) k)
                       (list v k)))
               lst)))
