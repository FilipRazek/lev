(defun array-0-n (n)
  (let ((a (make-array (1+ n))))
    (loop for i from 0 to n do (setf (aref a i) i))
    a))

(defun make-zero-array (m)
  (make-array m :initial-element 0))

(defun bool->int (b)
  (if b 1 0))

(defun lev (a b)
  (let ((n (length b)))
    (let ((v0 (array-0-n n))
          (v1 (make-zero-array (1+ n))))
      (replace v1 v0)
      (loop for char-a across a do
        (loop for j from 1 upto n
              for v0j across v0
              for v1j across v1
              for char-b across b
              for deletion-cost = (1+ v0j)
              for insertion-cost = (1+ v1j)
              for substitution-cost = (+ v0j (bool->int (char/= char-a char-b))) do
            (setf (aref v1 j) (min deletion-cost insertion-cost substitution-cost)))
        (rotatef v0 v1))
      (aref v0 n))))
