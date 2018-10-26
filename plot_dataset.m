
function plot_dataset(X, Coord)
% disegna tutti i punti dell'insieme (nero)

    hold on
    plot3(X(:, Coord(1)), X(:, Coord(2)), X(:, Coord(3)), 'k*');

end
