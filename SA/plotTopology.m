% plot the topology of a given graph
function plotTopology(adj_matrix,pos_matrix)
    figure;
    scatter(pos_matrix(:,1),pos_matrix(:,2));
    figure;
    gplot(adj_matrix,pos_matrix,'-o');

end

