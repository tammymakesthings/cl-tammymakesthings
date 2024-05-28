(defpackage :tammymakesthings.internal
  (:use :cl))

(in-package :tammymakesthings.internal)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun external-symbols (package)
    (let ((symbols nil))
      (do-external-symbols (s (find-package package) symbols)
        (push s symbols)))))

(defmacro defpackage-inheriting (name parent-packages &rest args)
  `(defpackage ,name
     ,@args
     ,@(loop :for parent-package :in parent-packages
             :collect `(:use ,parent-package)
             :collect `(:export ,@(external-symbols parent-package)))))


(defpackage :tammymakesthings.base
  (:use :cl)
  (:documentation "A few utilities re-exported from Alexandria, plus some other basic stuff.")
  (:import-from :alexandria
    :compose 
    :curry 
    :rcurry
    :with-gensyms 
    :once-only
    :ensure-list
    )
  (:export
    :tammymakesthings

    :compose :curry :rcurry
    :with-gensyms :once-only
    :ensure-list

    :timing ; both profiling and iterate use this symbol

    :symb :mkstr))

(defpackage-inheriting :tammymakesthings
  (
   :tammymakesthings.base
   )
  (:use :cl :iterate :tammymakesthings.base)
  (:documentation
    "This package exports all of the symbols in the other packages.

  If you just want to get everything you can `:use` this one and be done with
  it.  Otherwise you can `:use` only the ones you need."))


;;;; Remember to add it to the docs!
