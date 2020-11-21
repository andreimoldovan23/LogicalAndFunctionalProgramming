/* Predicate for checking if a number is prime or not */
%has_no_divisors(X: integer, Y: integer)
%flow model(i, i)
has_no_divisors(X, Y) :-
    Y =< div(X, 2), !, not(0 is mod(X, Y)),
    has_no_divisors(X, Y+1).

has_no_divisors(X, Y).

%is_prime(E: integer)
%flow model(i)
is_prime(X) :- X > 3, has_no_divisors(X, 2).
is_prime(X) :- X = 2; X =3.


/* Predicate for duplicating the prime numbers inside a list */
%duplicate(L: list, Res: list)
%flow model(i, o)
duplicate([H|T], ResList) :-
    is_prime(H), !,
    duplicate(T, NewResList),
    ResList = [H, H | NewResList].

duplicate([H|T], ResList) :-
    duplicate(T, NewResList),
    ResList = [H | NewResList].

duplicate([], ResList) :-
    ResList = [].


/* Predicate for checking if a variable is a list */
%is_list(A: atom)
%flow model(i)
is_list(L) :-
    L = [H|T].


/* Predicate for duplicating the prime numbers from the inner lists of a list */
%duplicateInnerLists(L: list, Res: list)
%flow model(i, o)
duplicateInnerLists([H|T], Res) :-
    is_list(H), !,
    duplicateInnerLists(T, NewResList),
    duplicate(H, L),
    Res = [L | NewResList].

duplicateInnerLists([H|T], Res) :-
    duplicateInnerLists(T, NewResList),
    Res = [H|NewResList].

duplicateInnerLists([], Res) :-
    Res = [].
