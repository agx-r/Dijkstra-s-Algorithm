% Example graph edges
edge(a, b, 1).
edge(a, c, 4).
edge(b, c, 2).
edge(b, d, 5).
edge(c, d, 1).

% Dijkstra's algorithm
dijkstra(Start, Goal, Path, Cost) :-
    dijkstra([[0, Start]], Goal, [], RevPath, Cost),
    reverse(RevPath, Path).

dijkstra([[Cost, Goal|Path]|_], Goal, _, [Goal|Path], Cost).
dijkstra([[Cost, Node|Path]|Queue], Goal, Visited, ResultPath, ResultCost) :-
    findall(
        [NewCost, Neighbor, Node|Path],
        (edge(Node, Neighbor, Weight), \+ member(Neighbor, Visited), NewCost is Cost + Weight),
        Neighbors),
    append(Queue, Neighbors, NewQueue),
    sort(NewQueue, SortedQueue),
    dijkstra(SortedQueue, Goal, [Node|Visited], ResultPath, ResultCost).

% Helper predicate to reverse a list
reverse(List, RevList) :- reverse(List, [], RevList).

reverse([], RevList, RevList).
reverse([H|T], Acc, RevList) :- reverse(T, [H|Acc], RevList).