
function [ tr ] = tr_scattering(X)
    % Traccia dello scattering del cluster/dataset X
    
    N = size(X, 1);                     % numero elementi
    m = mean(X);                        % baricentro
    tr = 0;
    
    for i = 1 : N                       % per ogni elemento
        v = X(i, :) - m;
        tr = tr + ( v * (v'));
    end
end

