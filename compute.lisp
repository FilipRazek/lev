(in-package :compute)

(defun array-0-n (n)
  (let ((a (make-array (1+ n))))
    (loop for i from 0 to n do (setf (aref a i) i))
    a))

(defun bool->int (b)
  (if b 1 0))

(defun levenshtein (a b)
  (let ((n (length b)) (m (length a)))
    (let ((v0 (array-0-n n))
          (v1 (make-array (1+ n))))
      (loop for char-a across a for i from 1 upto m do
        (setf (aref v1 0) i)
        (loop for j from 1 upto n
              for v0j across v0
              for v1j across v1
              for char-b across b
              for deletion-cost = (1+ (aref v0 j))
              for insertion-cost = (1+ v1j)
              for substitution-cost = (+ v0j (bool->int (char/= char-a char-b))) do
            (setf (aref v1 j) (min deletion-cost insertion-cost substitution-cost)))
        (rotatef v0 v1))
      (aref v0 n))))
