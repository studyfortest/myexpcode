% Compute the minimum extended dominating set of adj by greedy method
% For our purpose, wo extend the concept of dominating set.
% ------------- import ---------------------------------
% For a given graph G = (V,E), a subset S_1 belongs to V
% every node not in S can connect at least one member of S within
% a few hops(i).
% For example, the nodes not in S_1 can connect at least one member
% of S_1 within 1 hop, it is also the traditional dominating set.
% --------------------------------------------------------
% Input: adj adjaceny matrix of a connected graph G, i the level of DS
% Output: ds the minimum dominating set of G
function ds = greedy_extend_DS(adj,i)
    % set of uncoverd nodes
    U = 1:length(adj);
    % backup for all nodes
    V = 1:length(adj);
    % C is the set of nodes num of present adjaceny matrix
    C = V;
    ds = [];
    % compute the shortest paths of all pairs of nodes
    G = graph(adj);
    all_dis_mat = distances(G);
    
    % When the number of uncoverd nodes is zeor, the loop will stop.
    while U
        % the distance matrix of C
        part_dis_mat = distance_matrix(C,all_dis_mat,i);
        % generalized degrees(are also the nodes whose distances are 
        % smaller than i) of all nodes
        deg = sum(part_dis_mat,2); 
        % select the node whose generalized degree is the biggest,
        % loc represent the location  of the biggest one
        [num,loc] = max(deg);
        % Get the real position of C, because new adjaceny matrix is
        % changed
        real_loc = C(loc);
        ds = union(ds,real_loc); % add the node to DS
        % get the new DS node and its neighbors
        S = union(loc,cal_neighbors(loc,part_dis_mat));
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

