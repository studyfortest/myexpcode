function ds = greedy_DS(adj)
% set of uncoverd nodes
U = 1:length(adj);
ds = [];
k = 1;
while U
    deg = sum(adj,2); % degrees of all the nodes
    [num,loc] = max(deg) % select the node whose degree is biggest
    if num == 0
    ds = union(ds,loc); % add the node to DS
    S = union(loc,cal_neighbors(loc,adj));
    U = setdiff(U,S); % remove the node and it's neighbors
    adj(S,:) = 0;
    adj(:,S) = 0;
    k = k+1;
    if k == 25
        break;
    end
   
  
end


