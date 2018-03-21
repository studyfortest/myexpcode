% Compute the neighbors of node v with adjaceny matrix adj
function nei = cal_neighbors(v,adj)
    % if the value between two nodes is one, they are connectd
    nei = find(adj(v,:)==1);