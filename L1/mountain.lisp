;;;;check if a linear list has a mountain aspect

;;;tests if a list has a mountain aspect
(defun mountain (l flag)
    (cond 
        ((null (cdr l)) t)
        ((and (not (equal flag -1)) (> (car l) (car (cdr l)))) (mountain (cdr l) 0))
        ((and (not (equal flag 0)) (< (car l) (car (cdr l)))) (mountain (cdr l) 1))
    )
)

;;;wrapper function, also takes care of the printing
(defun isMountain (l) 
    (cond
        ((equal (mountain l -1) nil) (format t "The list ~a is not a mountain ~%" l))
        (t (format t "The list ~a is a mountain ~%" l))
    )
)

(defvar *l* (list 4 3 2))
(isMountain *l*)

