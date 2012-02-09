;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-63
  (:use)
  (:export
   :array? :equal? :array-rank :array-dimensions :make-array :make-shared-array
   :list->array :array->list :vector->array :array->vector :array-in-bounds?
   :array-ref :array-set!))

(defpackage :srfi-63.array
  (:use)
  (:nicknames :a)
  (:export
   :floc128b :floc64b :floc32b :floc16b :flor128b :flor64b :flor32b :flor16b
   :floq128d :floq64d :floq32d :fixz64b :fixz32b :fixz16b :fixz8b :fixn64b
   :fixn32b :fixn16b :fixn8b :bool))

(defpackage :srfi-63.internal
  (:use :srfi-63 :cl :fiveam :srfi-9 :srfi-63.array)
  (:shadowing-import-from :srfi-23 :error)
  (:shadowing-import-from :srfi-63
                          :array-rank
                          :array-dimensions
                          :make-array )
  (:shadow :lambda :loop :assoc :map :member))
