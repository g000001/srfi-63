;;;; srfi-63.asd -*- Mode: Lisp;-*-

(cl:in-package :asdf)

(defsystem :srfi-63
  :version "20200312"
  :description "SRFI 63 for CL: Homogeneous and Heterogeneous Arrays"
  :long-description "SRFI 63 for CL: Homogeneous and Heterogeneous Arrays
https://srfi.schemers.org/srfi-63"
  :author "Aubrey Jaffer"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:fiveam :srfi-9 :srfi-23 :srfi-4)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-63")
               (:file "test")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-63))))
  (let ((name "https://github.com/g000001/srfi-63")
        (nickname :srfi-63))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-63))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-63#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-63)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*

