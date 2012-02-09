(cl:in-package :srfi-63.internal)

(def-suite srfi-63)

(in-suite srfi-63)

(test equal?
  (is-true (equal? 'a 'a))
  (is-true (equal? '(a) '(a)))
  (is-true (equal? '(a (b) c)
                   '(a (b) c)))
  (is-true (equal? "abc" "abc"))
  (is-true (equal? 2 2))
  (is-true (equal? (make-vector 5 'a)
                   (make-vector 5 'a)))
  (is-true (equal? (make-array (a:fixn32b 4) 5 3)
                   (make-array (a:fixn32b 4) 5 3))))

(test fred
  (let* ((fred (make-array '#(nil) 8 8))
         (freds-diagonal
          (make-shared-array fred (lambda (i) (list i i)) 8))
         freds-center)
    (array-set! freds-diagonal 'foo 3)
    (is (eq 'foo (array-ref fred 3 3)))
    (setq freds-center
          (make-shared-array fred (lambda (i j) (list (+ 3 i) (+ 3 j)))
                             2 2))
    (is (eq 'foo (array-ref freds-center 0 0)))))

(test array-dimensions
  (is (equal (array-dimensions (make-array '#() 3 5))
             '(3 5))))

;;; eof
