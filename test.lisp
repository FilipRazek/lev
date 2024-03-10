(in-package :test)

(load "compute.lisp")

(defun test ()
  (assert (= (compute:levenshtein "Sunday" "Saturday") 3))
  (assert (= (compute:levenshtein "kitten" "sitting") 3))
  (assert (= (compute:levenshtein "rosettacode" "raisethysword") 8))
  (assert (= (compute:levenshtein "back" "book") 2))
  (assert (= (compute:levenshtein "hello" "hell") 1))
  (assert (= (compute:levenshtein "hell" "hello") 1))
  (princ "All tests passed!"))
