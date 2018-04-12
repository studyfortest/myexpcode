% judge whether the nodes_set is a DS or not 
% DS: dominating set
% Input: adj, the adjaceny matrix of a given graph G
%        nodes_set, a subset of V generated randomly
% Output: flag, 1 denotes the nodes_set is a DS
%               0 denotes the nodes_set is not a DS
function flag = isSatisfied(adj,nodes_set)
%     all nodes in adj
    U = 1:length(adj);
    
    % whether cover all the nodes in adj or not 
    for i=1:length(nodes_set)
%         S = union(nodes_set(i),calNeighbors(nodes_set(i),adj));
        S = [nodes_set(i) calNeighbors(nodes_set(i),adj)];
        U = setdiff(U,S);
    end
    
    % if cover all nodes in adj, return 1; else return 0
    if U
        flag = 0;
    else
        flag = 1;
    end



end

