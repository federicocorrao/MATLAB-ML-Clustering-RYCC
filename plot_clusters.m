
function plot_clusters(X, Labels, Coord)
% disegna cluster con colori diversi

    hold on
    set(gca,'LineStyle', '*');
    styles = [ 'r'; 'b'; 'g'; 'm'; 'c'; 'k'; 'y' ];

    T = labels_to_cell(X, Labels);      % ottengo una cell con i cluster
    K = length(T);
    
    for i = 1 : K
        % plot3(T{i}(:, 1), T{i}(:, 2), T{i}(:, 5), styles(i));
        % plot3(T{i}(:, 1), T{i}(:, 2), T{i}(:, 4), styles(i));
        % plot3(T{i}(:, 2), T{i}(:, 3), T{i}(:, 4), styles(i));
        % plot3(T{i}(:, 2), T{i}(:, 3), T{i}(:, 5), styles(i));
        % plot3(T{i}(:, 2), T{i}(:, 3), T{i}(:, 1), styles(i));
        plot3(T{i}(:, Coord(1)), T{i}(:, Coord(2)), T{i}(:, Coord(3)), styles(i)); 
    end

end

