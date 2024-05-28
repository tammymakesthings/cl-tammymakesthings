#+ecl (setf compiler:*user-cc-flags* "-Wno-shift-negative-value")

(ql:quickload :tammymakesthings)
(time (asdf:test-system :tammymakesthings))
(quit)
