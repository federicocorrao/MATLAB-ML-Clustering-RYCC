
function plot_elements(X, Labels)
% E' un grafico delle features: una linea spezzata rappresenta un elemento
% (ciclo di vita di una cellula del dataset)

    styles = [ 'r'; 'b'; 'g'; 'm'; 'c'; 'k'; 'y' ];
    figure('Position', [300 300 800 600]);

    subplot(2, 3, 1)
    hold on
    
    N = size(X, 1);
    
    for i = 1 : N
        plot(X(i, :), styles(Labels(i)));
    end

    % grafici separati per cluster
    
    T = labels_to_cell(X, Labels);
    K = length(T);
    
    for k = 1 : K
        subplot(2, 3, k + 1);
        hold on
        
        A = T{k};
        l = size(A,1);  
        
        for i = 1 : l
            plot(A(i, :), styles(k));
        end
    end
    
end

