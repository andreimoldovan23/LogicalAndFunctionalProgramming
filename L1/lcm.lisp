;;;;calculate the lcm of all numerical atoms from a nonlinear list

;;;returns the gcd of 2 numbers
(defun getGcd (x y)
    (cond 
        ((> x y) (getGcd (- x y) y))
        ((< x y) (getGcd x (- y x)))
        (t x)
    )
)

;;;returns the lcm of 2 numbers
(defun getLcm (x y)
    (/ (* x y) (getGcd x y)))

;;;returns the lcm of all numbers from a nonlinear list
(defun lcmList (l final)
    (cond 
        ((and (not (null l)) (numberp (car l))) (lcmList (cdr l) (getLcm (car l) final)))
        ((null l) final)
        (t (lcmList (cdr l) final))
    )
)

;;;wrapper function to return the lcm of all numbers from a nonlinear list
(defun lcmWrap(l) (lcmList l 1))


(defvar *l* (list 3 5 25 'A 'C 'D 3 15 45 75 'X))
(format t "The LCM of all the numbers in the list is: ~a ~%" (lcmWrap *l*))