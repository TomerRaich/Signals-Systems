function plots_for_1(x_n,N)
figure;
stem(0:(length(x_n)-1),imag(x_n),'filled','DisplayName','Im');
hold on; 
stem(0:(length(x_n)-1),real(x_n),'filled','DisplayName','Re');
title(['x_d[n], N=' num2str(N)])
grid on;legend
plot_ABS_DTFT(x_n, 0,['|X(e^j^\omega)|, N=' num2str(N)]);
end

