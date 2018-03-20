function [adj_mat,pos_mat] = generate_nodes(N, L, coverage_range)
% ref input 50,50,20
% non-overlap distance > 5
% coverage_range ; % the shorter, the deeper tree
% == random coordination == 
distinct_BOUND = 1;
Z = zeros(N,2);
T = rand(1,2)*L;
Z(1,:) = T;
for i = 2:N
    u = true;
    v = false;               
    while u || v       
      
        T = rand(1,2)*L;        
        % u is true if new added node is too far to all node
        u = true;
        for j = 1:i-1
            if pdist([T;Z(j,:)],'euclidean') < coverage_range
                u = false;
            end
        end       
        % v is true if if new added node is too near to one node
        v = false;
        for j = 1:i-1
            if pdist([T;Z(j,:)],'euclidean') < distinct_BOUND
                v = true;
            end
        end       
    end    
    Z(i,:) = T;
end
% == figure raw nodes ==
figure;
scatter(Z(:,1),Z(:,2));
s = sprintf('N-%d,L-%d, cr-%d nodes', N, L, coverage_range);
title(s); 
s1 = sprintf('N%d_L%d_cr-%d_nodes.png', N, L, coverage_range);
print(gcf,'-dpng',s1);
figure;
dis = pdist(Z);
dismat = squareform(dis);
adjmat = dismat < 2;
save adjmat;
load adjmat;
adj_mat = adjmat - eye(N);
pos_mat = Z;
gplot(adj_mat,Z,'-o');
hold on
myx = Z(:,1);
myy = Z(:,2);
for kk = 1:N
    k = num2str(kk);
    k = ['',k];
   
    text(myx(kk),myy(kk),k);
end


