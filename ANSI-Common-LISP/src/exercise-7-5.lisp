(defun stream-subst (old new in out)
  (let* ((pos 0)
         (len (length old))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
        ((eql c :eof))
      (cond ((or (char= c #\*) (char= c (char old pos))) (incf pos)
             (cond ((= pos len)   ;3
                    (princ new out)
                    (setf pos 0)
                    (buf-clear buf))
                   ((not from-buf)  ;2
                    (buf-insert c buf))))
            ((zerop pos)   ;1
             (princ c out)
             (when from-buf
               (buf-pop buf)
               (buf-reset buf)))
            (t    ;4
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))
