% args: {p=(double,[10, 10],{REAL})}
function  [x, y] = simplest(p)
  x = 3;                              % x=(double,3.0,[1, 1],{REAL})
  mc_t0 = 10;                         % mc_t0=(double,10.0,[1, 1],{REAL})
  [p] = ones(mc_t0);                  % p=(double,[10, 10],{REAL})
  mc_t2 = 1;                          % mc_t2=(double,1.0,[1, 1],{REAL})
  mc_t3 = 10;                         % mc_t3=(double,10.0,[1, 1],{REAL})
  for i = (mc_t2 : mc_t3);
    [x] = p(:, i);                      % x=(double,[10, 1],{REAL})
    mc_t1 = 3;                          % mc_t1=(double,3.0,[1, 1],{REAL})
    [x] = plus(x, mc_t1);               % x=(double,[10, 1],{REAL})
  end
  y = p;                              % y=(double,[10, 10],{REAL})
end
% results: [(double,[?, 1],{REAL}), (double,[10, 10],{REAL})]