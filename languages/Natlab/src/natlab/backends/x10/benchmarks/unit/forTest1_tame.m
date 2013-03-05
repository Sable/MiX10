% args: {a=(double,[1, 5],{REAL})}
function  [x] = forTest1(a)
  y = a;                              % y=(double,[1, 5],{REAL})
  mc_t2 = 1;                          % mc_t2=(double,1.0,[1, 1],{REAL})
  mc_t3 = 10;                         % mc_t3=(double,10.0,[1, 1],{REAL})
  for b = (mc_t2 : mc_t3);
    mc_t0 = 3;                          % mc_t0=(double,3.0,[1, 1],{REAL})
    [a] = plus(a, mc_t0);               % a=(double,[1, 5],{REAL})
    mc_t1 = 2;                          % mc_t1=(double,2.0,[1, 1],{REAL})
    [a] = plus(a, mc_t1);               % a=(double,[1, 5],{REAL})
  end
  c = 1;                              % c=(double,1.0,[1, 1],{REAL})
  mc_t4 = 2;                          % mc_t4=(double,2.0,[1, 1],{REAL})
  [d] = plus(c, mc_t4);               % d=(double,[1, 1],{REAL})
  x = a;                              % x=(double,[1, 5],{REAL})
end
% results: [(double,[1, 5],{REAL})]