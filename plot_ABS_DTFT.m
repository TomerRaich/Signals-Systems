function plot_ABS_DTFT(x_n, d, titleSTR)
x_e_jw = fft(x_n);
n_fft = length(x_n);
w = 2*pi * (0:(n_fft-1)) / n_fft;
w2 = fftshift(w);
w3 = unwrap(w2 - 2*pi);
dtft_gain = abs(fftshift(x_e_jw)); 
figure;
if d
    stem(w3/pi,dtft_gain);
else
    plot(w3/pi,dtft_gain);
end
grid on;xlabel('radians / \pi')
title(titleSTR)
end

