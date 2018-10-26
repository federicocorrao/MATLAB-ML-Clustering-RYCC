
function plot_silhouettes(S, I)
% grafico silhouettes (medie, relative ai Kmax clustering)

    title('i');
    xlabel('# of clusters');
    ylabel('Average Silhouettes');
    
    plot(S, 'b');
    hold on
    plot(S, 'ro');
    plot(I, S(I), 'r*');
    
end
