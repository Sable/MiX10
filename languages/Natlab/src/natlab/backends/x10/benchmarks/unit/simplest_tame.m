% args: {a=(double,[1, 1],{REAL})}
function  [x, y] = simplest(a)
  mc_t0 = 3;                          % mc_t0=(double,3.0,[1, 1],{REAL})
  [x] = plus(a, mc_t0);               % x=(double,[1, 1],{REAL})
  mc_t1 = 3;                          % mc_t1=(double,3.0,[1, 1],{REAL})
  [y] = minus(a, mc_t1);              % y=(double,[1, 1],{REAL})
  [b, c] = foo(x, y);                 % b=(double,[1, 1],{REAL}), c=(double,[1, 1],{REAL})
end
% results: [(double,[1, 1],{REAL}), (double,[1, 1],{REAL})]% args: {a=(double,[1, 1],{REAL}), b=(double,[1, 1],{REAL})}
function  [x, y] = foo(a, b)
  mc_t2 = 3;                          % mc_t2=(double,3.0,[1, 1],{REAL})
  [x] = plus(a, mc_t2);               % x=(double,[1, 1],{REAL})
  mc_t3 = 3;                          % mc_t3=(double,3.0,[1, 1],{REAL})
  [y] = minus(b, mc_t3);              % y=(double,[1, 1],{REAL})
end
% results: [(double,[1, 1],{REAL}), (double,[1, 1],{REAL})]