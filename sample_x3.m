function [x_c_3,t,x_n_3,t_s] = sample_x3(ts,tFactor)
t = linspace(-tFactor*ts,tFactor*ts,1e4);
t_s = -tFactor*ts:ts:tFactor*ts;
x_c_3 = cos((pi/2).*t);
x_n_3 = cos((pi/2).*t_s);
end

