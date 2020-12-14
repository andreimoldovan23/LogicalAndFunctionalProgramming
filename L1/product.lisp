;;;;calculate the product of even numerical atoms from all levels of a heterogeneus list

(defun getProductEven (l)
    (cond 
            ((null l) 1)
            ((and (numberp (car l)) (equal 0 (mod (car l) 2))) (* (car l) (getProductEven (cdr l))))
            ((listp (car l)) (* (getProductEven (car l)) (getProductEven (cdr l))))
            (t (getProductEven (cdr l)))
    )    
)

(defvar *l* (list 2 3 5 '(2 4 2) '(3 7 5) 2 '(6 9) 3))
(format t "The product of even atoms from list ~a is: ~a ~%" *l* (getProductEven *l*))