
function [valid] = drv_mbrt(scale)

% computes mandelbrot set

N = round(6000*sqrt(scale));
Nmax = round(10^3*sqrt(scale));
tic
set=mandelbrot(N, Nmax);
toc
%output = set(:);
%disp(set(32,31));
valid = 'na';
end

