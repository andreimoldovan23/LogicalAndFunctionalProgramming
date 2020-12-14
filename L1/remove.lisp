;;;;remove all occurences of the maximum numerical atom from a heterogeneous list

;;;returns the first number from a list
(defun getFirstNumber (l) 
    (cond  
        ((null l) nil)
        ((numberp (car l)) (car l))
        (t (getFirstNumber (cdr l)))        
    )
)

;;;returns the maximum numerical value from a nonlinear list
(defun getMax (l maxx)
    (cond 
            ((equal maxx nil) nil)
            ((null l) maxx)
            ((and (numberp (car l)) (> (car l) maxx)) (getMax (cdr l) (car l)))
            ((getMax (cdr l) maxx))
    )    
)

;;;removes all occurences of the maximum numerical value from a nonlinear list
(defun removeMax (l maxx)
    (cond
        ((equal maxx nil) nil)
        ((null l) (list nil))
        ((equal (car l) maxx) (removeMax (cdr l) maxx))
        (t (cons (car l) (removeMax (cdr l) maxx)))
    )
)

;;;wrapper function
(defun removeOccurences (l) (removeMax l (getMax l (getFirstNumber l))))


(defvar *l* (list 'A 'B 12 3 4 'A 'B 45 3 8 45 'X 'Y 45))
(defvar *l-1* (list 'A 'B 'A 'B 'X 'Y))

(format t "List is: ~a ~%" *l*)
(format t "New list is: ~a ~%" (removeOccurences *l*))

(format t "List is: ~a ~%" *l-1*)
(format t "New list is: ~a ~%" (removeOccurences *l-1*))