% Get the distance matrix of V
% dismat is the distance matrix of all nodes
% i is the level of DS(dominating set)
function dis_part = distance_matrix(V,dismat,i)
    % if the distance between u and v is smaller than i
    % the num is 1
    dismat = dismat<=i;
    dismat = dismat - eye(length(dismat));
    % distance matrix of set V is a subset of adj
    
    dis_part = dismat(V,V);