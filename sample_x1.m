function [x_c_1,t,x_n_1,t_s] = sample_x1(ts,tFactor)
t = linspace(-tFactor*ts,tFactor*ts,1e4);
t_s = -tFactor*ts:ts:tFactor*ts;
x_c_1 = sinc(t./4);
x_n_1 = sinc(t_s./4);
end

