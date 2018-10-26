
% Esegue le stime secondo i due algoritmi separatamente per ogni input.
% L'output è una tabella (Formato / Metodo) dei K ottenuti.
% (Il tempo di esecuzione è di circa 4 secondi)

R = zeros(3, 2);

tic;

R(1, 1) = run('hierarchical', 'raw'         , 0);
R(2, 1) = run('hierarchical', 'normalized'  , 0);
R(3, 1) = run('hierarchical', 'standardized', 0);

R(1, 2) = run('partitional', 'raw'          , 0);
R(2, 2) = run('partitional', 'normalized'   , 0);
R(3, 2) = run('partitional', 'standardized' , 0);

toc

R
