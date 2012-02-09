;;;; srfi-63.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)

(defsystem :srfi-63
  :serial t
  :depends-on (:fiveam :srfi-9 :srfi-23 :srfi-4)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-63")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-63))))
  (load-system :srfi-63)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-63.internal :srfi-63))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
