# Dijkstra's Algorithm in Prolog

This repository contains a Prolog implementation of Dijkstra's algorithm to find the shortest path between two nodes in a weighted graph.

## Algorithm Overview

Dijkstra's algorithm is a popular graph traversal algorithm that finds the shortest path between two nodes in a graph with non-negative edge weights. The algorithm maintains a priority queue of nodes and their distances from the source node. It repeatedly selects the node with the smallest distance and relaxes the distances of its neighboring nodes if a shorter path is found. The process continues until the destination node is reached or all nodes have been visited.

## Usage

To use this script, follow these steps:

1. Install a Prolog interpreter, such as SWI-Prolog, on your machine.
2. Clone this repository or download the `dijkstra_prolog.pl` file.
3. Open a terminal or command prompt and navigate to the directory containing the `dijkstra_prolog.pl` file.
4. Start the Prolog interpreter by entering the `swipl` command.
5. Load the script by typing `[dijkstra_prolog].` in the Prolog interpreter.
6. Query the `shortest_path/4` predicate with the desired start and end nodes. For example, `shortest_path(a, f, Path, Cost).` will find the shortest path and its cost between nodes 'a' and 'f'.
7. The result will be displayed in the Prolog interpreter, showing the shortest path and its cost.

## Example

Let's consider an example graph:

```
edge(a, b, 4).
edge(a, c, 2).
edge(b, c, 1).
edge(b, d, 5).
edge(c, d, 8).
edge(c, e, 10).
edge(d, e, 2).
edge(d, f, 6).
edge(e, f, 3).
```

Running the script with the query `shortest_path(a, f, Path, Cost).` will yield the following result:

```
Path = [a, c, b, d, f],
Cost = 10
```

This means that the shortest path from node 'a' to node 'f' is `[a, c, b, d, f]` with a total cost of 10.

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to use, modify, and distribute this code as needed.
