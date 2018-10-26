
function [ tr ] = tr_within_scattering(X, Labels)
    % Errore quadratico totale di X
    % (è pari alla traccia dello scattering interno di X)
    
    C = labels_to_cell(X, Labels);      % prendo i cluster
    
    K = length(C);                      % numero di cluster
    
    errors = zeros(1, K);               % vettore errori quad. clusters

    % errore quadratico per ogni cluster
    
    % for k = 1 : K                     % per ogni cluster
    %   m = mean(C{k});                 % baricentro cluster k-esimo
        
    %    l = size(C{k}, 1);             % numero elementi cluster
        
    %    for i = 1 : l                  % per ogni elemento del cluster
    %        v = C{k}(i, :) - m;
    %        errors(k) = errors(k) + ( v * (v'));
    %    end
    % end
    
    % (si può esprimere in funzione di tr_scattering)
    
    for k = 1 : K
        errors(k) = tr_scattering(C{k});
    end
    
    % errore quadratico totale
    
    tr = sum(errors);
end
