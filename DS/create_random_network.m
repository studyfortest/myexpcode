% Generate a random topology in area MxM consisting of N nodes whose
% coverage is C
% Input:  M size of the area
%         N number of nodes
%         C the coverage of each node
%         L the smallest distance between two nodes in order to prevent too
%         nearly
% Output: net_matrix the ajaceny matrix of the created random network
%         pos_matrix the postion of all the nodes in the network 
% ref input 15,100,2,1
function [net_matrix,pos_matrix] = create_random_network(M,N,C,L)
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
    % ------------ all the nodes are created --------------
    
    % figure the nodes postion
    figure;
    scatter(Z(:,1),Z(:,2));
    s = sprintf('M-%d,N-%d, cr-%d nodes', M, N, C);
    title(s); 
    s1 = sprintf('M%d_N%d_cr-%d_nodes.png', M, N, C);
    print(gcf,'-dpng',s1);
    
    % plot the topology according to adjaceny matrix
    figure;
    dis = pdist(Z);
    dismat = squareform(dis);
    adjmat = dismat < C;
    net_matrix = adjmat - eye(N);
    pos_matrix = Z;
    gplot(net_matrix,pos_matrix,'-o');
%     hold on
%     myx = Z(:,1);
%     myy = Z(:,2);
%     for kk = 1:N
%         k = num2str(kk);
%         k = ['',k];
% 
%         text(myx(kk),myy(kk),k);
%     end
    

end

