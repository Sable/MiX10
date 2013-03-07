% args: {A=(double,5.0,[1, 1],{REAL})}
function  [x] = ranges(A)
  mc_t5 = 3;                          % mc_t5=(double,3.0,[1, 1],{REAL})
  mc_t6 = 4;                          % mc_t6=(double,4.0,[1, 1],{REAL})
  mc_t7 = 5;                          % mc_t7=(double,5.0,[1, 1],{REAL})
  [x] = ones(mc_t5, mc_t6, mc_t7);    % x=(double,[3, 4, 5],{REAL})
  mc_t8 = 1;                          % mc_t8=(double,1.0,[1, 1],{REAL})
  mc_t9 = 4;                          % mc_t9=(double,4.0,[1, 1],{REAL})
  [mc_t4] = colon(mc_t8, mc_t9);      % mc_t4=(double,[1, 4],{REAL})
  mc_t10 = 1;                         % mc_t10=(double,1.0,[1, 1],{REAL})
  [y] = x(mc_t10, mc_t4, :);          % y=(double,[1, 1],{REAL})
end
% results: [(double,[3, 4, 5],{REAL})]% args: {a=(double,[1, 1],{REAL})}
function  [] = main(a)
  mc_t1 = 5;                          % mc_t1=(double,5.0,[1, 1],{REAL})
  ranges(mc_t1); % [] = ...           
  mc_t2 = 2;                          % mc_t2=(double,2.0,[1, 1],{REAL})
  mc_t3 = 3;                          % mc_t3=(double,3.0,[1, 1],{REAL})
  [y] = ones(mc_t2, mc_t3);           % y=(double,[2, 3],{REAL})
end
% results: []