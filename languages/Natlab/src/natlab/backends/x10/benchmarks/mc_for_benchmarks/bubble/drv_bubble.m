function [] = drv_bubble(scale)
 A = (rand (1,scale));
 A = 100*A;
 tic
 bubble(A);
 toc
 
end
