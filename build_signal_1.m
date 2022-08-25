function [x_n] = build_signal_1(N,size_x_n)
% FS coeffs
a_k = zeros(9,1);
for k=1:length(a_k)
    a_k(k) = k;
end
% construct the signal
x_n = zeros(size_x_n,1);
for n=0:(length(x_n)-1)
    for z=1:length(a_k)
        x_n(n+1) = x_n(n+1) + a_k(z)*exp(1i*(z-5)*(2*pi)*(n/N));
    end
end
end

