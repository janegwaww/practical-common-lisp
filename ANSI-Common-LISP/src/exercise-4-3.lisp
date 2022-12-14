;; define tree structure
(defstruct (node
            (:print-function
             (lambda (n s d)
               (format s "#<~a> (~a ~a ~a)"
                       (node-elt n)
                       (node-l n)
                       (node-m n)
                       (node-r n)))))
  elt (l nil) (m nil) (r nil))

;; a) a function to copy such a tree (so that no node in the copy is eql to a node in the original)
(defun copy-tre (tre)
  (copy-node tre))

;; b) a function that takes an object and such a tree, and returns true if the object is eql to the data field of one of the nodes
(defun tre-member (obj tre)
  (if (null tre)
      nil
      (let ((elt (node-elt tre)))
        (if (eql obj elt)
            t
            (or
             (tre-member obj (node-l tre))
             (tre-member obj (node-m tre))
             (tre-member obj (node-r tre)))))))
