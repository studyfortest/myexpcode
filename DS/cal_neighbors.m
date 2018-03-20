% compute the neighbors of node v with adjaceny matrix adj
function nei = cal_neighbors(v,adj)
nei = find(adj(v,:)==1);