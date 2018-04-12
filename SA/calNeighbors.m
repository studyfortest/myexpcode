% compute the neighbors of v
% Input: v, a given node of V; adj, the adjaceny matrix of G
% Output: the node set of v's neighbors
function neibors = calNeighbors(v,adj)
     neibors = find(adj(v,:)==1);
end

