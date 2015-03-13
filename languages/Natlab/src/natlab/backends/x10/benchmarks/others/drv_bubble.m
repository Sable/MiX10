function [y] = drv_bubble(n)
 A = (rand (1,n));
 A = 100*A;
disp(A);
 y = bubble(A);
end
