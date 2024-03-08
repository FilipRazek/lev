(defpackage :compute
  (:use :cl)
  (:export :levenshtein))

(defpackage :run
  (:use :cl :compute)
  (:export :run))

(defpackage :test
  (:use :cl :compute)
  (:export :test))

(load "compute.lisp")
(load "run.lisp")
(load "test.lisp")

