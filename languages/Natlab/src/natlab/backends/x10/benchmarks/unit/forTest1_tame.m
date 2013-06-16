% args: {a=(double,[10, 10],{REAL})}
function  [x] = forTest1(a)
  y = a;                              % y=(double,[10, 10],{REAL})
  mc_t4 = 1;                          % mc_t4=(double,1.0,[1, 1],{REAL})
  mc_t5 = 10;                         % mc_t5=(double,10.0,[1, 1],{REAL})
  for b = (mc_t4 : mc_t5);
    mc_t0 = 3;                          % mc_t0=(double,3.0,[1, 1],{REAL})
    [a] = plus(a, mc_t0);               % a=(double,[10, 10],{REAL})
    mc_t1 = 2;                          % mc_t1=(double,2.0,[1, 1],{REAL})
    [a] = plus(a, mc_t1);               % a=(double,[10, 10],{REAL})
    mc_t3 = 5;                          % mc_t3=(double,5.0,[1, 1],{REAL})
    [mc_t2] = gt(a, mc_t3);             % mc_t2=(logical,[10, 10],{REAL})
    if mc_t2
      break;
    else
    end
  end
  c = 1;                              % c=(double,1.0,[1, 1],{REAL})
  mc_t6 = 2;                          % mc_t6=(double,2.0,[1, 1],{REAL})
  [d] = plus(c, mc_t6);               % d=(double,3.0,[1, 1],{REAL})
  x = a;                              % x=(double,[10, 10],{REAL})
end
% results: [(double,[10, 10],{REAL})]