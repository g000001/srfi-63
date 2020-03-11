;;;; package.lisp

(cl:in-package :cl-user)


(defpackage "https://github.com/g000001/srfi-63"
  (:use)
  (:export
   array? equal? array-rank array-dimensions make-array make-shared-array
   list->array array->list vector->array array->vector array-in-bounds?
   array-ref array-set!)
  (:export
   a$floc128b a$floc64b a$floc32b a$floc16b a$flor128b a$flor64b
   a$flor32b a$flor16b
   a$floq128d a$floq64d a$floq32d a$fixz64b a$fixz32b a$fixz16b
   a$fixz8b a$fixn64b
   a$fixn32b a$fixn16b a$fixn8b a$bool))


(defpackage "https://github.com/g000001/srfi-63#internals"
  (:use
   "https://github.com/g000001/srfi-63"
   "https://github.com/g000001/srfi-9"
   "https://github.com/g000001/srfi-4"
   "https://github.com/g000001/srfi-23"
   cl 
   fiveam)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-23" 
   error)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-63"
   array-rank
   array-dimensions
   make-array )
  (:shadow lambda loop map))


;;; *EOF*
