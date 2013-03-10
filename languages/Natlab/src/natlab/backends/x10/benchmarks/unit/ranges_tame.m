% args: {A=(double,[1, 1],{REAL})}
function  [x] = ranges(A)
  mc_t1 = 3;                          % mc_t1=(double,3.0,[1, 1],{REAL})
  mc_t2 = 4;                          % mc_t2=(double,4.0,[1, 1],{REAL})
  mc_t3 = 5;                          % mc_t3=(double,5.0,[1, 1],{REAL})
  [x] = ones(mc_t1, mc_t2, mc_t3);    % x=(double,[3, 4, 5],{REAL})
  mc_t4 = 1;                          % mc_t4=(double,1.0,[1, 1],{REAL})
  mc_t5 = 4;                          % mc_t5=(double,4.0,[1, 1],{REAL})
  [mc_t0] = colon(mc_t4, mc_t5);      % mc_t0=(double,[1, 4],{REAL})
  mc_t6 = 1;                          % mc_t6=(double,1.0,[1, 1],{REAL})
  [y] = x(mc_t6, mc_t0, :);           % y=(double,[1, 1],{REAL})
  forTest1(x); % [] = ...             
end
% results: [(double,[3, 4, 5],{REAL})]% args: {a=(double,[3, 4, 5],{REAL})}
function  [x] = forTest1(a)
  y = a;                              % y=(double,[3, 4, 5],{REAL})
  mc_t10 = 1;                         % mc_t10=(double,1.0,[1, 1],{REAL})
  mc_t11 = 10;                        % mc_t11=(double,10.0,[1, 1],{REAL})
  for b = (mc_t10 : mc_t11);
    mc_t8 = 3;                          % mc_t8=(double,3.0,[1, 1],{REAL})
    [a] = plus(a, mc_t8);               % a=(double,[3, 4, 5],{REAL})
    mc_t9 = 2;                          % mc_t9=(double,2.0,[1, 1],{REAL})
    [a] = plus(a, mc_t9);               % a=(double,[3, 4, 5],{REAL})
  end
  c = 1;                              % c=(double,1.0,[1, 1],{REAL})
  mc_t12 = 2;                         % mc_t12=(double,2.0,[1, 1],{REAL})
  [d] = plus(c, mc_t12);              % d=(double,[1, 1],{REAL})
  x = a;                              % x=(double,[3, 4, 5],{REAL})
end
% results: [(double,[3, 4, 5],{REAL})]