close all;
clear variables;
%% 1.a.ii
N = [9, 2.25];
sizeFactor = 50;
for l=1:length(N)
    size_x_n = sizeFactor*N(l);
    x_n = build_signal_1(N(l),floor(size_x_n));
    plots_for_1(x_n,N(l));
end
%% 2.c
% for signal 1 - Ts = 6
[x_c_1,t1,x_n_1,t_s1] = sample_x1(2,30);
figure;
plot(t1,x_c_1,'DisplayName','x_c_1');
hold on;
stem(t_s1,x_n_1,'filled','DisplayName','x_n_1');
title('Continuous Vs Discrete, Signal x_c_1')
grid on; legend
%%
% for signal 2 - Ts = 6
[x_c_2,t2, x_n_2,t_s2] = sample_x2(6,10);
figure;
plot(t2,x_c_2,'DisplayName','x_c_2');
hold on;
stem(t_s2,x_n_2,'filled','DisplayName','x_n_2');
title('Continuous Vs Discrete, Signal x_c_2')
grid on; legend

%%
% for signal 3 - Ts = 12
[x_c_3,t3,x_n_3,t_s3] = sample_x3(2,30);
figure;
plot(t3,x_c_3,'DisplayName','x_c_3');
hold on;
stem(t_s3,x_n_3,'filled','DisplayName','x_n_3');
title('Continuous Vs Discrete, Signal x_c_3')
grid on; legend

%% 2.d
ts1 = 4;ts2 = 8;tFactor=10;
% signal 1
[x_c_1_t1,t1,x_n_1_ts1, ~] = sample_x1(ts1,tFactor);
[x_c_1_t2,t2,x_n_1_ts2, ~] = sample_x1(ts2,tFactor);
figure;
subplot(1,2,1);
plot_ABS_DTFT(x_n_1_ts1,0, '|X_n_1(e^j^\omega)|, T_s = 4')
subplot(1,2,2);
plot_ABS_DTFT(x_n_1_ts2,0, '|X_n_1(e^j^\omega)|, T_s = 8')
% signal 2
[x_c_2_t1,~,x_n_2_ts1, ~] = sample_x2(ts1,tFactor);
[x_c_2_t2,~,x_n_2_ts2, ~] = sample_x2(ts2,tFactor);
figure;
subplot(1,2,1);
plot_ABS_DTFT(x_n_2_ts1,0, '|X_n_2(e^j^\omega)|, T_s = 4')
subplot(1,2,2);
plot_ABS_DTFT(x_n_2_ts2,0, '|X_n_2(e^j^\omega)|, T_s = 8')
% signal 3
[x_c_3_t1,t13,x_n_3_ts1, ~] = sample_x3(ts1,tFactor);
[x_c_3_t2,t23,x_n_3_ts2, ~] = sample_x3(ts2,tFactor);
figure;
subplot(1,2,1);
plot_ABS_DTFT(x_n_3_ts1,0, '|X_n_3(e^j^\omega)|, T_s = 4')
subplot(1,2,2);
plot_ABS_DTFT(x_n_3_ts2,0, '|X_n_3(e^j^\omega)|, T_s = 8')
%% 2.e
sinc_reconstruction(x_n_1_ts1,ts1,x_c_1_t1,t1,x_n_1_ts2,ts2,x_c_1_t2,t2, 'Signal 1');
sinc_reconstruction(x_n_2_ts1,ts1,x_c_2_t1, t1,x_n_2_ts2,ts2,x_c_2_t2,t2, 'Signal 2');
sinc_reconstruction(x_n_3_ts1,ts1,x_c_3_t1,t13,x_n_3_ts2,ts2,x_c_3_t2,t23, 'Signal 3');
%% 3.c
x_n_20 = ones(20,1);
x_n_50 = ones(50, 1);
x_n_20_dft = abs(fft(x_n_20));
x_n_50_dft = abs(fft(x_n_50));
figure;
subplot(2,2,1);
stem(0:(length(x_n_50_dft)-1),x_n_50_dft);grid on;
title('|X_n_5_0(e^j^\omega)|')
subplot(2,2,2)
stem(0:(length(x_n_50)-1),x_n_50);grid on;
title('x_n_5_0[n]')
subplot(2,2,3);
stem(0:(length(x_n_20_dft)-1),x_n_20_dft);grid on;
title('|X_n_2_0(e^j^\omega)|')
subplot(2,2,4)
stem(0:(length(x_n_20)-1),x_n_20);grid on;
title('x_n_2_0[n]')
%% 3.d
x_p1 = [x_n_50;zeros(5,1)];
x_p2 = [x_n_50;zeros(10,1)];
x_p1_dft = abs(fft(x_p1));
x_p2_dft= abs(fft(x_p2));
figure;
subplot(2,2,1);
stem(0:(length(x_p1_dft)-1),x_p1_dft);grid on;
title('|X_p_,_k_=_5(e^j^\omega)|')
subplot(2,2,2)
stem(0:(length(x_p1)-1),x_p1);grid on;
title('x_p_,_k_=_5[n]')
subplot(2,2,3);
stem(0:(length(x_p2_dft)-1),x_p2_dft);grid on;
title('|X_p_,_k_=_1_0(e^j^\omega)|')
subplot(2,2,4)
stem(0:(length(x_p2)-1),x_p2);grid on;
title('x_p_,_k_=_1_0[n]')

