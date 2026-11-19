% Directed edges
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').

edge('Al-Qatif', 'Madinah').
edge('Al-Qatif', 'Dammam').

edge('Dammam', 'Al-Qatif').
edge('Dammam', 'Riyadh').

edge('Riyadh', 'Dammam').

% Path finding rules
travel(From, To, Path) :-
    path(From, To, [From], RevPath),
    reverse(RevPath, Path).

% Base case: reached destination
path(To, To, Visited, Visited).

% Recursive step: follow a directed edge to an unvisited city
path(Current, To, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
