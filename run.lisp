(in-package :run)

(defun run ()
  (print (compute:levenshtein "kitten" "sitting")))
