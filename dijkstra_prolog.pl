% Define the graph and its weighted edges
edge(a, b, 4).
edge(a, c, 2).
edge(b, c, 1).
edge(b, d, 5).
edge(c, d, 8).
edge(c, e, 10).
edge(d, e, 2).
edge(d, f, 6).
edge(e, f, 3).

% Predicate to find the shortest path using Dijkstra's algorithm
shortest_path(Start, End, Path, Cost) :-
	% Initialize the distances with infinity for all nodes
	findall(Node-Distance, (edge(Start, Node, _), Distance = inf), Distances),
	% Set the distance of the start node to 0
	select(Start-_, Distances, Start-0, UpdatedDistances),
	% Call the helper predicate to find the shortest path
	shortest_path_helper(Start, End, UpdatedDistances, [], Path, Cost).

% Helper predicate to find the shortest path
shortest_path_helper(End, End, _, AccPath, Path, Cost) :-
	reverse([End | AccPath], Path), % Reverse the accumulated path
	Cost is 0.
shortest_path_helper(Start, End, Distances, AccPath, Path, Cost) :-
	% Find the node with the minimum distance
	select(Node-Distance, Distances, MinNode-MinDistance, RestDistances),
	% Find the neighboring nodes and their distances
	findall(NextNode-NextDistance, (edge(Node, NextNode, EdgeWeight), NextDistance is MinDistance + EdgeWeight), Neighbors),
	% Update the distances if the new path is shorter
	update_distances(Neighbors, RestDistances, UpdatedDistances),
	% Add the current node to the accumulated path
	shortest_path_helper(Start, End, UpdatedDistances, [Node | AccPath], Path, Cost).

% Helper predicate to update the distances if a shorter path is found
update_distances([], Distances, Distances).
update_distances([Node-Distance | Rest], Distances, UpdatedDistances) :-
	(   select(Node-OldDistance, Distances, Node-NewDistance, RestDistances)
	->  (   Distance < OldDistance
		->  UpdatedDistances = [Node-Distance | NewDistances]
		;   UpdatedDistances = [Node-OldDistance | NewDistances]
		)
	;   UpdatedDistances = [Node-Distance | RestDistances]
	),
	update_distances(Rest, Distances, NewDistances).
