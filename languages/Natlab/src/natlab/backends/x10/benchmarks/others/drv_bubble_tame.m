% args: {A=(double,[1, 5],{REAL})}
function  [y] = drv_bubble(A)
  [x, n] = bubble(A);                 % x=(double,[1, 5],{REAL}), n=(double,[1, 1],{REAL})
  y = x;                              % y=(double,[1, 5],{REAL})
end
% results: [(double,[1, 5],{REAL})]% args: {A=(double,[1, 5],{REAL})}
function  [x, n] = bubble(A)
  [n] = length(A);                    % n=(double,[1, 1],{REAL})
  mc_t8 = 1;                          % mc_t8=(double,1.0,[1, 1],{REAL})
  [mc_t7] = minus(n, mc_t8);          % mc_t7=(double,[1, 1],{REAL})
  mc_t15 = 1;                         % mc_t15=(double,1.0,[1, 1],{REAL})
  for j = (mc_t15 : mc_t7);
    mc_t9 = 1;                          % mc_t9=(double,1.0,[1, 1],{REAL})
    [mc_t6] = minus(n, mc_t9);          % mc_t6=(double,[1, 1],{REAL})
    mc_t14 = 1;                         % mc_t14=(double,1.0,[1, 1],{REAL})
    for i = (mc_t14 : mc_t6);
      [mc_t0] = A(i);                     % mc_t0=(double,[1, 1],{REAL})
      mc_t10 = 1;                         % mc_t10=(double,1.0,[1, 1],{REAL})
      [mc_t4] = plus(i, mc_t10);          % mc_t4=(double,[1, 1],{REAL})
      [mc_t1] = A(mc_t4);                 % mc_t1=(double,[1, 1],{REAL})
      [mc_t13] = gt(mc_t0, mc_t1);        % mc_t13=(logical,[1, 1],{REAL})
      if mc_t13
        [temp] = A(i);                      % temp=(double,[1, 1],{REAL})
        mc_t11 = 1;                         % mc_t11=(double,1.0,[1, 1],{REAL})
        [mc_t5] = plus(i, mc_t11);          % mc_t5=(double,[1, 1],{REAL})
        [mc_t2] = A(mc_t5);                 % mc_t2=(double,[1, 1],{REAL})
        A(i) = mc_t2;                       % A=(double,[1, 5],{REAL})
        mc_t12 = 1;                         % mc_t12=(double,1.0,[1, 1],{REAL})
        [mc_t3] = plus(i, mc_t12);          % mc_t3=(double,[1, 1],{REAL})
        A(mc_t3) = temp;                    % A=(double,[1, 5],{REAL})
      else
      end
    end
  end
  x = A;                              % x=(double,[1, 5],{REAL})
end
% results: [(double,[1, 5],{REAL}), (double,[1, 1],{REAL})]