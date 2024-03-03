(defun array-0-n (n)
  (let ((a (make-array (1+ n))))
    (loop for i from 0 to n do (setf (aref a i) i))
    a))

(defun bool->int (b)
  (if b 1 0))

(defun lev (a b)
  (let ((m (length a)) (n (length b)))
    (let ((v0 (array-0-n n))
          (v1 (make-array (1+ n) :initial-element 0)))
      (replace v1 v0)
      (loop for i from 0 below m do
        (loop for j from 0 below n for v0j = (aref v0 j) and v1j = (aref v1 j) do
          (let ((deletion-cost (1+ v0j))
                (insertion-cost (1+ v1j))
                (substitution-cost (+ v0j (bool->int (char/= (aref a i) (aref b j))))                                       ))
              (let ((minimal-cost (min deletion-cost insertion-cost substitution-cost)))
                (setf (aref v1 (1+ j)) minimal-cost))))
        (rotatef v0 v1))
      (aref v0 n))))
