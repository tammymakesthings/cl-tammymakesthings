(defpackage :tammymakesthings.test
  (:use :cl :fiveam :tammymakesthings :iterate)
  )

(setf fiveam:*run-test-when-defined* t)
(setf fiveam:*on-failure* :backtrace)
(setf fiveam:*on-error* :backtrace)
