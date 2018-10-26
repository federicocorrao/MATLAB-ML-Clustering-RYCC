
function plot_scatt_index(S, I)
% grafico indice errore quadratico / scattering    

    title('i');
    xlabel('# of clusters');
    ylabel('Rw / R');
    
    plot(S, 'b');
    hold on
    plot(S, 'ro');
    plot(I, S(I), 'r*');
    
end
