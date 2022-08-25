function sinc_reconstruction(x_n_ts1,ts1,x_c_t1,t1,x_n_ts2,ts2,x_c_t2,t2, titleStr)
x_c_ts1 = zeros(size(t1));
x_c_ts2 = zeros(size(t2));
for n=1:length(x_n_ts1)
    ind =  n - ceil(length(x_n_ts1)/2);
    x_c_ts1 = x_c_ts1 + sinc((t1 - ts1*ind)/ts1).*x_n_ts1(n);
    x_c_ts2 = x_c_ts2 + sinc((t2 - ts2*ind)/ts2).*x_n_ts2(n);
end

figure;
subplot(1,2,1);
plot(t2, x_c_ts2,'bo','DisplayName','x_r');
hold on;
plot(t2, x_c_t2,'r','DisplayName','x');
grid on;
title([titleStr ' Reconstruction vs Original, T_s=' num2str(ts2)]);legend;
subplot(1,2,2);
plot(t1, x_c_ts1, 'bo', 'DisplayName','x_r');
hold on;
plot(t1, x_c_t1,'r','DisplayName','x');
grid on;
title([titleStr ' Reconstruction vs Original, T_s=' num2str(ts1)]);legend;
end

