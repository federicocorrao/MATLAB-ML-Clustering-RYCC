
function [ T ] = labels_to_cell(X, Labels)
% Ritorna una cell di clusters a partire dal dataset e dalle etichette

    % K = max(Labels);
    K = length(unique(Labels));
    
    for i = 1 : K
        T{i} = X(Labels == i, :);
    end

end
