(in-package :run)

(load "compute.lisp")

(defun run ()
  (print (compute:levenshtein "kitten" "sitting")))
