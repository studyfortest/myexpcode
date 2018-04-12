% use SA to find the minimum dominating set of G = (V,E)
% Input
% Output
% For example
tic
T0 = 500; % initial temperature
r = 0.997; % temperature damping rate
Ts = 1; % stop temperature
iter = 1;

model = InitNetwork(15,93,2,1);


flag = 0; % a new soluation flag, if flag=1, accept a new soluation
% 
% while(1)
%     % find a random dominating set
%     DS = randomMDS(adj);
%     if(isSatisfied(adj,DS))
%         break;
%     end
% end
% DS = randomMDS(model.net_matrix);
DS = greedy_DS(model.net_matrix);
% DS = [];
cost = CalCost(DS,model);

% start the process of seeking the MDS
T = T0; % initial temperature
count = 1; % count the times
minCost = cost;
minDS = DS;

maxIterate = 2100;
costArray = zeros(maxIterate,1);

% simulating annealing 
while(T > Ts)
    % each T can find iter times
    for k = 1:iter
        mode = randi([1 3]);
        newDS = CreateNeiSol(DS,model,mode);
        newCost = CalCost(newDS,model);
        delta = newCost - cost;

        if(delta<0)
            cost = newCost;
            DS = newDS;
        else
            p=exp(-delta/T);
            if rand() <= p 
                 cost = newCost;
                 DS = newDS;
            end
        end

    end

    costArray(count) = cost;
    if cost<minCost
        minCost = cost;
        minDS = DS;
        flag = 1;
    end

    T = T*r; %  annealing
    disp(['Iteration ' num2str(count) ': BestCost = ' num2str(minCost) ': CurrentCost = ' num2str(cost) ' T = ' num2str(T)]);
    count = count + 1;


%     if(flag == 1)
%         plotSolution(minRoute,model);
%         flag = 0;
%     end
    plot(costArray);
    pause(0.0001);
end
toc

