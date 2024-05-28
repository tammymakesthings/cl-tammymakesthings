(in-package :tammymakesthings.test)

(def-suite* tammymakesthings
	    :description "Test suite for the tammymakesthings library")
(in-suite tammymakesthings)

(test suite-loads-successfully 
      (is (+ 1 2) 3))

