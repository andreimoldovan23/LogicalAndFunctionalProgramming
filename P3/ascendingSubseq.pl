/*Observation: the elements in the subsequences should maintain the relative order from the original list*/

/* Predicate for obtaining in one output variable an element and 
in the other output variable the rest of the list*/
%flowmodel(i, o, o)
%getElem(L: list, Elem: number, Result: list)
getElem([H | T], H, []).
    

getElem([H | T], E, [H | R]) :-
    getElem(T, E, R).


/*Predicate for building all ascending subsequence with a given maximum element from a list*/
%flowmodel(i, i, o)
%buildAscending(L: list, Collector: list, Result: list)
buildAscending(_, [H, H1 | T], R) :-
    R = [H, H1 | T].

buildAscending(L, [H | T], Rez) :-
    getElem(L, H1, T1),
    H1 < H,
    buildAscending(T1, [H1 | [H | T]], Rez).


/*Predicate for building all ascending subsequences of a list*/
%flowmodel(i, o)
%buildAll(L: list, Result: list)
buildAll(L, R) :-
    getElem(L, H1, T1),
    buildAscending(T1, [H1], R).
