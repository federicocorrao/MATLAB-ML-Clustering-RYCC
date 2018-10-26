
function [ est_k ] = run(Type, Format, Silent)    

    RYCC;   % nota: questo è molto inefficiente

    if strcmp(Format, 'raw') == 1
       Dataset = rycc_raw;
       Coord = [2 3 1]; % dimensioni migliori per visualizzazione su grafico
    elseif strcmp(Format, 'normalized') == 1
        Dataset = rycc_normalized;
       Coord = [1 2 3];
    elseif strcmp(Format, 'standardized') == 1
        Dataset = rycc_standardized;
        Coord = [1 2 3];
    else
        disp('Formato non valido.');
        return;
    end
    
    if strcmp(Type, 'hierarchical') == 1
        est_k = stima_gerarchica(Dataset);
    elseif strcmp(Type, 'partitional') == 1
        est_k = stima_partizionale(Dataset);
    else
        disp('Metodo non valido.');
        return;
    end

    % test sul K stimato, con grafici
    
    if nargin == 2
        
        close all;
        figure('Position', [100 100 800 400]);
        
        % plot dataset (3 dimensioni)
        subplot(1, 2, 1); grid on; plot_dataset(PCA(Dataset), Coord);
        
        if strcmp(Type, 'hierarchical')
            H = clustering(Dataset, 'hierarchical');
            Labels = cluster(H, 'maxclust', est_k);
        else
            Labels = clustering(Dataset, 'partitional', est_k);
        end
        
        % plot dataset con cluster colorati
        subplot(1, 2, 2); grid on; plot_clusters(PCA(Dataset), Labels, Coord); 
       
        % plot features (ogni linea rappresenta un elemento)
        plot_elements(Dataset, Labels);
    end
    
end
