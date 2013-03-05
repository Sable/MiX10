% args: {A=(double,[1, 5],{REAL})}
function  [x] = ranges(A)
  mc_t0 = 3;                          % mc_t0=(double,3.0,[1, 1],{REAL})
  mc_t1 = 4;                          % mc_t1=(double,4.0,[1, 1],{REAL})
  mc_t2 = 5;                          % mc_t2=(double,5.0,[1, 1],{REAL})
  [x] = ones(mc_t0, mc_t1, mc_t2);    % x=(double,[3, 4, 5],{REAL})
  mc_t3 = 1;                          % mc_t3=(double,1.0,[1, 1],{REAL})
  mc_t4 = 3;                          % mc_t4=(double,3.0,[1, 1],{REAL})
  [y] = x(mc_t3, :, mc_t4);           % y=(double,[1, 1],{REAL})
end
% results: [(double,[3, 4, 5],{REAL})]