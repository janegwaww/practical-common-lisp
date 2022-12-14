(defun head ()
  (block nil
    (format t "Here we go.")
    (return 'done)))

(defun tag-block ()
  (let ((x 0))
    (tagbody
       (setf x 0)
     top
       (setf x (+ x 1))
       (format t "~a " x)
       (if (< x 10) (go top)))))

(setf path (make-pathname :name "myfile"))
(setf str (open path :direction :output
                     :if-exists :supersede))
(format str "something~%")
(close str)
