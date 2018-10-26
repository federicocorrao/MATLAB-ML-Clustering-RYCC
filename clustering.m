
function [ R ] = clustering(X, Type, K)
% Effettua il clustering secondo il metodo desiderato, ritorna etichette
% X � la matrice delle caratteristiche
% Type pu� essere 'partitional', 'hierarchical'
% K � richiesto solo per 'partitional' (k-means)
% L'uso di R varia a seconda del metodo utilizzato

    if strcmp(Type, 'partitional') == 1
    
        R = kmeans(X, K, 'distance', 'correlation', 'start', 'cluster', 'emptyaction', 'drop');
       
    elseif strcmp(Type, 'hierarchical') == 1
       
        R = linkage(X, 'average', 'correlation');
        
    else % ...
    end

end
