
function [ Y ] = PCA( X )
% Analisi delle componenti principali

    sig = cov(X);
    [V, D] = eig(sig);              % autovalori m. covarianza
    d = diag(D);

    [s, i] = sort(d, 'descend');    % ordinamento autovalori

    S = cumsum(s);
    t = sum(s);

    v = S./t;

    % troviamo il numero di componenti che spiegano il 95% della varianza
    m = min(find(v >= 0.95));

    M = V(:, i(1:m))'; % M è la nostra trasfomazione
    
    Y = X * M'; % Y è il nuovo spazio ottenuto applicando M a X   
    
end

