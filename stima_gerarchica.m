
function [ est_k ] = stima_gerarchica(Dataset, Kmax)

    if nargin == 1                                  % limite default
        Kmax = 10;
    end
    
    Avg_Silhouettes = zeros(1, Kmax);               % vettore silhouettes medie
    Scattering = tr_scattering(Dataset);            % traccia scattering totale
    Within_Scatterings = zeros(1, Kmax);            % tracce scattering interni
    
    H = clustering(Dataset, 'hierarchical');        % effettuo cl. gerarchico
  
    for k = 1 : Kmax                                % fino al limite
        Labels = cluster(H, 'maxclust', k);         % estraggo clustering con k classi
        
        % calcolo indici valid. sul clustering
        
        Avg_Silhouettes(k) = mean(silhouette(Dataset, Labels, 'correlation'));
        Within_Scatterings(k) = tr_within_scattering(Dataset, Labels);
    end
    
    % indice scattering interno / scattering totale
    Sc_Ratio = Within_Scatterings ./ Scattering;
    % altro possibile indice
    MyIndex = Avg_Silhouettes + Sc_Ratio;
    
    [~ , est_k_sh] = max(Avg_Silhouettes);
    [~ , est_k_tr] = max(Sc_Ratio);
    [~ , est_k_my] = max(MyIndex);
    
    % scelgo l'indice: in questo caso silhouette
    est_k = est_k_sh;
    
    
    %%%%%
    % grafici per test
    %%%%%
    
    % figure;
    % subplot(1, 3, 1); plot_silhouettes(Avg_Silhouettes, est_k_sh);
    % subplot(1, 3, 2); plot_scatt_index(Sc_Ratio, est_k_tr);
    % subplot(1, 3, 3); plot_scatt_index(MyIndex, est_k_my);
    
end

