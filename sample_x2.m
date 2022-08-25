function [x_c_2,t,x_n_2,t_s] = sample_x2(ts,tFactor)
t = linspace(-tFactor*ts,tFactor*ts,1e3);
t_s = -tFactor*ts:ts:tFactor*ts;
x_c_2 = sinc(t./12).^2;
x_n_2 = sinc(t_s./12).^2;
end

