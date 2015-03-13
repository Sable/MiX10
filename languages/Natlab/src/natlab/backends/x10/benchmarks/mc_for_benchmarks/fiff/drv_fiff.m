function [time, output] = drv_fiff(scale)

a = 2.5;
b = 1.5;
c = 0.5;
n = 3500;
m = 3500;

tic;
for x=1:scale
  U = finediff(a, b, c, n, m);
end

time = toc;
%disp ( U(300,3));
output=U;

