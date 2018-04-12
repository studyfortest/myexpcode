% calculate the cost of current solution
% Input
% Output
% For example
% let undeg(S) denotes the number of nodes undominated by S
% cost = |S| + undeg(S);
function  res = CalCost(S,model)
    
    if S
        G = graph(model.net_matrix);
        C = [];
        for v = S
            C = union(C,G.neighbors(v));
        end
        C = union(C,S);
        U = setdiff(model.nodes,C);
        res = length(S) + length(U); 
    else
        res = model.size;
    end


end

