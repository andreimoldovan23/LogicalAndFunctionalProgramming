/*
Main Predicate
*/
%removeElement(X: integer, L: list, R: list)
%flow model(i, i, o)
removeElement(X, [H|T], ResList) :-
    remove(X, 3, [H|T], ResList).

/* 
Predicate for removing a given number 
of occurences of a given element from a list 
*/
/* 
X the element to be removed,
NrApps the number of occurences to be removed,
*/

%remove(X: integer, NrApps: integer, L: list, Res: list)
%flow model(i, i, i, o)
remove(X, NrApps, [H|T], ResList) :-
    X = H, NrApps > 0, !,
    NewNrApps is NrApps-1,
    remove(X, NewNrApps, T, ResList).

remove(X, NrApps, [H|T], ResList) :-
    remove(X, NrApps, T, NewResList),
    ResList = [H|NewResList].

remove(_, _, [], ResList) :- 
    ResList = [].

