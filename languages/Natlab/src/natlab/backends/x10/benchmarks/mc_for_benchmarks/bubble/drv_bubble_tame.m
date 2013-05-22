% args: {scale=(double,[1, 1],{REAL})}
function  [] = drv_bubble(scale)
  mc_t0 = 1;                          % mc_t0=(double,1.0,[1, 1],{REAL})
  [A] = rand(mc_t0, scale);           % A=(double,[1, ?],{REAL})
  mc_t1 = 100;                        % mc_t1=(double,100.0,[1, 1],{REAL})
  [A] = mtimes(mc_t1, A);             % A=(double,[1, ?],{REAL})
  bubble(A); % [] = ...               
end
% results: []% args: {A=(double,[1, ?],{REAL})}
function  [x] = bubble(A)
  [n] = length(A);                    % n=(double,[1, 1],{REAL})
  mc_t11 = 1;                         % mc_t11=(double,1.0,[1, 1],{REAL})
  [mc_t10] = minus(n, mc_t11);        % mc_t10=(double,[1, 1],{REAL})
  mc_t18 = 1;                         % mc_t18=(double,1.0,[1, 1],{REAL})
  for j = (mc_t18 : mc_t10);
    mc_t12 = 1;                         % mc_t12=(double,1.0,[1, 1],{REAL})
    [mc_t9] = minus(n, mc_t12);         % mc_t9=(double,[1, 1],{REAL})
    mc_t17 = 1;                         % mc_t17=(double,1.0,[1, 1],{REAL})
    for i = (mc_t17 : mc_t9);
      [mc_t3] = A(i);                     % mc_t3=(double,[1, 1],{REAL})
      mc_t13 = 1;                         % mc_t13=(double,1.0,[1, 1],{REAL})
      [mc_t7] = plus(i, mc_t13);          % mc_t7=(double,[1, 1],{REAL})
      [mc_t4] = A(mc_t7);                 % mc_t4=(double,[1, 1],{REAL})
      [mc_t16] = gt(mc_t3, mc_t4);        % mc_t16=(logical,[1, 1],{REAL})
      if mc_t16
        [temp] = A(i);                      % temp=(double,[1, 1],{REAL})
        mc_t14 = 1;                         % mc_t14=(double,1.0,[1, 1],{REAL})
        [mc_t8] = plus(i, mc_t14);          % mc_t8=(double,[1, 1],{REAL})
        [mc_t5] = A(mc_t8);                 % mc_t5=(double,[1, 1],{REAL})
        A(i) = mc_t5;                       % A=(double,[1, ?],{REAL})
        mc_t15 = 1;                         % mc_t15=(double,1.0,[1, 1],{REAL})
        [mc_t6] = plus(i, mc_t15);          % mc_t6=(double,[1, 1],{REAL})
        A(mc_t6) = temp;                    % A=(double,[1, ?],{REAL})
      else
      end
    end
  end
  x = A;                              % x=(double,[1, ?],{REAL})
end
% results: [(double,[1, ?],{REAL})]