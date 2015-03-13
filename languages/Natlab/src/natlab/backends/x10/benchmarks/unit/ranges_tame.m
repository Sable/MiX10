% args: {A=(double,[10, 10],{REAL})}
function  [x] = ranges(A)
  mc_t1 = 3;                          % mc_t1=(double,3.0,[1, 1],{REAL})
  mc_t2 = 4;                          % mc_t2=(double,4.0,[1, 1],{REAL})
  mc_t3 = 5;                          % mc_t3=(double,5.0,[1, 1],{REAL})
  [x] = ones(mc_t1, mc_t2, mc_t3);    % x=(double,[3, 4, 5],{REAL})
  mc_t4 = 1;                          % mc_t4=(double,1.0,[1, 1],{REAL})
  mc_t5 = 4;                          % mc_t5=(double,4.0,[1, 1],{REAL})
  [mc_t0] = colon(mc_t4, mc_t5);      % mc_t0=(double,[1, 4],{REAL})
  mc_t6 = 1;                          % mc_t6=(double,1.0,[1, 1],{REAL})
  [y] = x(mc_t6, mc_t0, :);           % y=(double,[1, 4, 5],{REAL})
end
% results: [(double,[3, 4, 5],{REAL})]