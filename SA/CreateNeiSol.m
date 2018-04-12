% create a neighbouring solution from current solution
% Input
% Output
% For example
function new_DS = CreateNeiSol(DS,model,mode)
    
     switch mode
         case 1
             new_DS = Add(DS,model);
         case 2
             new_DS = Delete(DS);
         case 3
             new_DS = Swap(DS,model);
     end
     
end

function new_DS = Add(DS,model)
  U = setdiff(model.nodes,DS);
  if U
      loc = randsample(length(U),1);
      new_DS = union(DS,U(loc));
  else
      new_DS = DS;
  end
end

function new_DS = Delete(DS)
  if ~isempty(DS)
      loc = randsample(length(DS),1);
      new_DS = setdiff(DS,DS(loc));
  else
      new_DS = DS;
  end
end

function new_DS = Swap(DS,model)

  if ~isempty(DS)
      U = setdiff(model.nodes,DS);
      if ~isempty(U)
          out_loc = randsample(length(U),1);
          u =  U(out_loc);
          new_DS = DS;
          loc = randsample(length(new_DS),1);
          new_DS(loc) = u;
      else 
          new_DS = DS;
      end
  else
      new_DS = DS;
  end
end

