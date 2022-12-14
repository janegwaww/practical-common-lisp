

# exercises 3

1.  [Show the following lists in box notation:](#org5fba1a2)
2.  [Write a version of union that preserves the order of the elements in the original lists:](#org2e0d973)
3.  [Define a function that takes a list and&#x2026;](#orgf30173f)
4.  [Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?](#org2f9ec31)
5.  [Suppose the function `pos+` takes a list and&#x2026;](#org2555a7f)
6.  [After years of deliberation,&#x2026;](#orgb5a2beb)
7.  [Modify the program in Figure 3.6 to&#x2026;](#org1e189b0)
8.  [Define a function that takes a list and prints it in dot notation:](#org222ce4e)
9.  [Write a program to find the&#x2026;](#org4be2675)


<a id="org5fba1a2"></a>

## Show the following lists in box notation:

1.  `(a b (c d))`
    
        +-----+-----+      \ +----+----+     \ +----+-----+
        |  a  |     |-------X|  b |    |------X|    | nil |
        +-----+-----+      / +----+----+     / +--+-+-----+
                                                  |
                                               +--+-+----+     \ +----+----+
                                               |  c |    +------X|  d | nil|
                                               +----+----+     / +----+----+

2.  `(a (b (c (d))))`
    
        +-----+----+    \ +----+----+    \ +----+----+    \ +----+----+       +----+----+       +----+----+      +----+----+
        |  a  |    |-----X|    |nil |  +--X|  b |    |-----X|    |nil |   +---+  c |    +-------+    |nil |   +--+ d  |nil |
        +-----+----+    / +--+-+----+  | / +----+----+    / +--+-+----+   |   +----+----+       +--+-+----+   |  +----+----+
                             |         |                       |          |                        |          |
                             +---------+                       +----------+                        +----------+

3.  `(((a b) c) d)`
    
        +----+----+       \ +----+----+  /     +----+----+   \ +----+----+  /    +----+----+     \  +----+----+
        |  a |    |--------X| b  |nil |-X------+    |    +----X|  c |nil |-X-----+    |    +------X |  d | nil|
        +----+----+       / +----+----+  \     +----+----+   / +----+----+  \    +----+----+     /  +----+----+

4.  `(a (b . c) . d)`
    
        +----+----+     \ +---+----+
        |  a |    +------X|   |  d |
        +----+----+     / +-+-+--+-+
                            |
                            | +---+----+
                            +-+ b |  c |
                              +---+----+


<a id="org2e0d973"></a>

## Write a version of union that preserves the order of the elements in the original lists:

    (defun new-union (l1 l2)
      (reverse (remove-duplicates (reverse (append (copy-list l1) (copy-list l2))))))


<a id="orgf30173f"></a>

## Define a function that takes a list and&#x2026;

Define a function that takes a list and returns a list indicating the
number of times each (eql) element appears, sorted from most common
element to least common:

    ;;; compre
    
    (defun compre (lst)
      (if (consp lst)
          (compr (car lst) 1 (cdr lst))
          lst))
    
    ;; return compressed list
    (defun compr (elt n lst)
      (if (null lst)
          (list (cons elt n))
          (let ((next (car lst)))
            (if (eql next elt)
                (compr elt (+ n 1) (cdr lst))
                (if (member elt (cdr lst))
                    (compr elt n (append (cdr lst) (list next)))
                    (cons (cons elt n)
                          (compr next 1 (cdr lst))))))))
    
    ;;; sort
    
    ;; item largest in list
    (defun new-compare (item lst)
      (if (null lst)
          t
          (if (>= (cdr item) (cdar lst))
              (new-compare item (cdr lst)))))
    
    ;; return largest item
    (defun biggest (lst)
      (if (null (cdr lst))
          (car lst)
          (if (new-compare (car lst) (cdr lst))
              (car lst)
              (biggest (cdr lst)))))
    
    ;; return list except largest item
    (defun rest-big (lst)
      (if (= (cdr (car lst)) (cdr (biggest lst)))
          (cdr lst)
          (rest-big (append (cdr lst) (list (car lst))))))
    
    ;; sorting
    (defun new-sort (lst)
      (if (null (cdr lst))
          lst
          (let ((item (car lst))
                (big (biggest lst)))
            (if (= (cdr item) (cdr big))
                (cons item (new-sort (cdr lst)))
                (new-sort (cons big (rest-big lst)))))))
    
    ;;; main
    
    ;; > (occurrences ' ( a b a d a c d e a )
    ;; ((A . 4) (C . 2) (D . 2) (B . 1))
    (defun occurrences (lst)
      (new-sort (compre lst)))


<a id="org2f9ec31"></a>

## Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?

Because two lists is different object, they allocates two pointers.


<a id="org2555a7f"></a>

## Suppose the function `pos+` takes a list and&#x2026;

Suppose the function pos+ takes a list and returns a list of each element
plus its position:

    ;;> (pos+ '( 7 5 1 4 ) )
    ;;(7 6 3 7)

Define this function using (a)recursion, (b)iteration, (c)mapcar.

    ;;; a) recursion
    
    (defun rec-pos+ (lst)
      (rec-pos-mid 0 lst))
    
    (defun rec-pos-mid (n lst)
      (if (null lst)
          nil
          (cons (+ (car lst) n) (rec-pos-mid (+ n 1) (cdr lst)))))
    
    ;;; b) iteration
    
    (defun ite-pos+ (lst)
      (let ((r '()))
        (do ((elt lst (cdr elt))
             (n 0 (+ n 1)))
            ((null elt) nil)
          (push (+ (car elt) n) r))
        (reverse r)))
    
    ;;; c) mapcar
    
    (defun map-pos+ (lst)
      (let ((n 0))
        (mapcar #'(lambda (x) (and
                               (setf n (+ n 1))
                               (+ x (- n 1))
                               ))
                lst)))


<a id="orgb5a2beb"></a>

## After years of deliberation,&#x2026;

After years of deliberation, a government commission has decided that lists should be represented by using the cdr to point to the first element and the car to point to the rest of the list. Define the government versions of the following functions:

    ;;; a) cons
    
    (defun new-cons (l r)
      (lambda (x)
        (if (= x 1)
            r
            l)))
    
    ;; car
    (defun new-car (fn)
      (funcall fn 1))
    
    ;; cdr
    (defun new-cdr (fn)
      (funcall fn 2))
    
    ;;; b) list
    
    (defun new-list (&rest params)
      (if (consp params)
          (get-list params)
          params))
    
    (defun get-list (lst)
      (if (null lst)
          nil
          (new-cons (car lst)
                    (get-list (cdr lst)))))
    
    ;;; c) length
    
    (defun new-length (lst)
      (if (null lst)
          0
          (+ 1 (new-length (new-car lst)))))
    
    ;;; d) member
    
    (defun new-member (elt lst)
      (if (null lst)
          nil
          (if (eql elt (new-cdr lst))
              t
              (new-member elt (new-car lst )))))


<a id="org1e189b0"></a>

## Modify the program in Figure 3.6 to&#x2026;

Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted lists.)

    (defun compress (x)
      (if (consp x)
          (compr (cons (car x) 1) (cdr x))
          x))
    
    (defun compr (elt 1st)
      (if (null 1st)
          (list elt)
          (let ((next (car 1st))
                (item (car elt))
                (num (cdr elt)))
            (if (eql next item)
                (compr (cons next (+ num 1)) (cdr 1st))
                (cons (cons item num)
                      (compr (cons next 1) (cdr 1st)))))))


<a id="org222ce4e"></a>

## Define a function that takes a list and prints it in dot notation:

    ;;> (showdots '(a b c))
    ;;(A . (B . (C . NIL)))
    ;;NIL
    (defun showdots (lst)
      (do ((str lst (cdr str)))
          ((null str) (format t "nil)"))
        (format t "(~a . " (car str))))
    (showdots '(1 2 3))


<a id="org4be2675"></a>

## Write a program to find the&#x2026;

Write a program to find the `longest` finite path through a network represented as in Section 3.15. The network may contain cycles.

    (defun longest-path (start end net)
      (find-longest (bfs end (list (list start)) net)))
    
    (defun find-longest (lst)
      (find-longest-item (car lst) (cdr lst)))
    
    (defun find-longest-item (item lst)
      (if (null lst)
          item
          (if (>= (length item) (length (car lst)))
              (find-longest-item item (cdr lst))
              (find-longest-item (car lst) (cdr lst)))))
    
    (defun bfs (end queue net)
      (if (null queue)
          nil
          (let ((path (car queue)))
            (let ((node (car path)))
              (if (eql node end)
                  (cons (reverse path)
                        (bfs end
                             (append (cdr queue)
                                     (new-paths path node net))
                             net))
                  (bfs end
                       (append (cdr queue)
                               (new-paths path node net))
                       net))))))
    
    (defun new-paths (path node net)
      (mapcar #'(lambda (n)
                  (cons n path))
              (cdr (assoc node net))))

