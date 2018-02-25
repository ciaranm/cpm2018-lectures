% graph colouring optimisation problem

int: n;                       % number of vertices
array[1..n, 1..n] of 0..1: A; % adjacency

array[1..n] of var 1..n: v;   % v[i] = j means vertex i has colour j

% adjacent vertices must have different colours
constraint forall(i, j in 1..n where i < j /\ A[i, j] = 1)(v[i] != v[j]);

% objective is to minimise chi
var 1..n: chi;
constraint chi = max(v);

% make a copy of v, sorted to have highest degree first
array[1..n] of var 1..n: sorted_v = sort_by(v, [-sum(row(A, w)) | w in 1..n]);

% smallest domain first, tie-breaking on highest degree, lowest colour first
solve ::int_search(sorted_v, first_fail, indomain, complete) minimize chi;

% symmetry: colours are equivalent. make colours appear in order in sorted_v.
include "value_precede_chain.mzn";
constraint value_precede_chain([i | i in 1..n], sorted_v);
