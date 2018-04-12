% initial a network model according to parameters
% Input: M, N, C, L
% M is the size of a area
% N is the number of nodes in the area
% C is the cover range of each node 
% L is the smallest distance between all pairs of nodes
% Output: net_matrix, pos_matrix
% net_matrix is adjaceny matrix of G
% pos_matrix is location matrix of G
% For example
function model = InitNetwork(M,N,C,L)
    model.area = M;
    model.size = N;
    model.nodes = 1:N;
    model.cover = C;
    model.con = L;
    

     % the coverage of node can not smaller than L
    if C<L
        fprintf('C must be bigger than L');
        return;
    end
    % the container of N nodes
    Z = zeros(N,2);
    % create a point randomly
    T = rand(1,2)*M;
    % put the first node T to Z
    Z(1,:) = T;
    
    % ----------- add nodes one by one ------------
    for i = 2:N
        u = true;
        v = false;
        % only the distances between all the nodes are smaller than L
        % the loop will be stop
        while u || v       
        
            T = rand(1,2)*M;        
            % u is true if new added node is too far to all node
            u = true;
            for j = 1:i-1
                if pdist([T;Z(j,:)],'euclidean') < C
                    u = false;
                end
            end       
            % v is true if if new added node is too near to one node
            v = false;
            for j = 1:i-1
                if pdist([T;Z(j,:)],'euclidean') < L
                    v = true;
                end
            end       
        end    
        Z(i,:) = T;
    end
    
    dis = pdist(Z);
    dismat = squareform(dis);
    adjmat = dismat < C;
    model.net_matrix = adjmat - eye(N);
    model.pos_matrix = Z;
end

