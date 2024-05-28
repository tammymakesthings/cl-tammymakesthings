(asdf:defsystem :tammymakesthings
  :name "tammymakesthings"
  :description "My personal utility library."

  :author "Tammy Cravit <tammy@tammymakesthings.com>"

  :license "MIT"
  :version "0.0.1"

  :in-order-to ((asdf:test-op (asdf:test-op :tammymakesthings/test)))

  :depends-on (
               #+sbcl :sb-sprof
               :alexandria
               :cl-ppcre
               :external-program
               :flexi-streams
               :iterate
               :pileup
               :named-readtables
               )

  :components
  ((:module "src"
    :components (
                 (:file "package")
                 (:file "base" :depends-on ("package"))
                 ))))

(asdf:defsystem :tammymakesthings/test
  :description "Test suite for tammymakesthings."

  :author "Tammy Cravit <tammy@tammymakesthings.com>"
  :license "MIT"

  :depends-on (
	       :tammymakesthings 
	       :fiveam
	       )

  :serial t
  :components (
	       (:module "test"
                :serial t
                :components (
			     (:file "package")
                             (:file "base")
			     )))

  :perform (asdf:test-op (op system)
             (funcall (read-from-string "fiveam:run! 'tammymakesthings"))))
