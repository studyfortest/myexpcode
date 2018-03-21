% Compute the minimum dominating set of adj by greedy method
% Input: adj adjaceny matrix of a connected graph G
% Output: ds the minimum dominating set of G
function ds = greedy_DS(adj)
    % set of uncoverd nodes
    U = 1:length(adj);
    V = 1:length(adj);
    % C is the set of nodes num of present adjaceny matrix
    C = V;
    ds = [];
    % When the number of uncoverd nodes is zeor, the loop will stop.
    while U
        % the adjaceny matrix of C
        adj_mat = adjaceny_matrix(C,adj);
        % degrees of all the nodes
        deg = sum(adj_mat,2); 
        % select the node whose degree is biggest, loc represent the location 
        % of the biggest one
        [num,loc] = max(deg);
        % Get the real position of C, because new adjaceny matrix is
        % changed
        real_loc = C(loc);
        ds = union(ds,real_loc); % add the node to DS
        % get the new DS node and its neighbors
        S = union(loc,cal_neighbors(loc,adj_mat));
        % compute the real numbers of nodes according to C
        real_S = C(S);
        U = setdiff(U,real_S); % remove the node and it's neighbors
        C = U;
    end
    %{
    ds_pos = pos(ds,:);
    hold on
    scatter(ds_pos(:,1),ds_pos(:,2),40,'red','filled');
    %}

