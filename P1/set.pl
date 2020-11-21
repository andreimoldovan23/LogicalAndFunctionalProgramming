/* Predicate for testing if a list is a set */
%is_set(L: list)
%flow model(i)
is_set([]).

is_set([H|T]) :-
    findElem(H, T),
    is_set(T).

/* Predicate for checking if an element appears in a list */
%findElem(X: integer, L: list)
%flow model(i, i)
findElem(X, []).

findElem(X, [H|T]) :-
    \+(X = H),
    findElem(X, T).