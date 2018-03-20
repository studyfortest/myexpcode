function ds = greedy_new(adj)
% set of uncoverd nodes
U = 1:length(adj);
V = 1:length(adj);
C = V;
ds = [];
while U
    % the adjaceny matrix of C
    adj_mat = adjaceny_matrix(C,adj);
    % degrees of all the nodes
    deg = sum(adj_mat,2); 
    % select the node whose degree is biggest
    [num,loc] = max(deg);
    real_loc = C(loc);
    ds = union(ds,real_loc); % add the node to DS
    S = union(loc,cal_neighbors(loc,adj_mat));
    % compute the real numbers of nodes according to C
    real_S = C(S);
    U = setdiff(U,real_S); % remove the node and it's neighbors
    C = U
  
end
%{

hold on
scatter(test(:,1),test(:,2),40,'red','filled');
%}

