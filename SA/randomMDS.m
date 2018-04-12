% create a dominating set randomly
% Input: adj, the adjaceny matrix of G = (V,E)
% Output: random_DS, a random dominating set of G
function random_DS = randomMDS(adj)
    % the uncovered nodes
    U = 1:length(adj); 
    random_DS = [];
    while U
        % select a node in the uncovered node set randomly
        v = ceil(rand(1)*length(U));
        S = union(U(v),calNeighbors(U(v),adj));
        random_DS = union(U(v),random_DS);
        % delete the nodes covered by v from U
        U = setdiff(U,S);
    end

end

