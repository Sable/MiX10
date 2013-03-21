function [y] = drv_bubble(n)
 A = (rand (1,n));
 A = 100*A;
 y = bubble(A);
end
