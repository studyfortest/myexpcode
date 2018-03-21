% Get the adjaceny matrix of V
% adj is the adjaceny matrix of all nodes
function adj_part = adjaceny_matrix(V,adj)
    % adjaceny matrix of set V is a subset of adj
    adj_part = adj(V,V);