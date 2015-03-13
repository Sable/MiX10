% args: {x=(double,[1, 1],{COMPLEX}), max=(double,1000.0,[1, 1],{REAL})}
function  [out] = iterations(x, max)
  c = x;                              % c=(double,[1, 1],{COMPLEX})
  i = 0;                              % i=(double,0.0,[1, 1],{REAL})
  [mc_t43] = abs(x);                  % mc_t43=(double,[1, 1],{REAL})
  mc_t46 = 2;                         % mc_t46=(double,2.0,[1, 1],{REAL})
  [mc_t41] = lt(mc_t43, mc_t46);      % mc_t41=(logical,[1, 1],{REAL})
  if mc_t41
    [mc_t42] = lt(i, max);              % mc_t42=(logical,[1, 1],{REAL})
    [mc_t40] = and(mc_t41, mc_t42);     % mc_t40=(logical,[1, 1],{REAL})
  else
    mc_t40 = mc_t41;                    % mc_t40=(logical,[1, 1],{REAL})
  end
  while mc_t40
    [mc_t44] = mtimes(x, x);            % mc_t44=(double,[1, 1],{REAL})
    mc_t45 = c;                         % mc_t45=(double,[1, 1],{COMPLEX})
    [x] = plus(mc_t44, mc_t45);         % x=(double,[1, 1],{COMPLEX})
    mc_t47 = 1;                         % mc_t47=(double,1.0,[1, 1],{REAL})
    [i] = plus(i, mc_t47);              % i=(double,[1, 1],{REAL})
  end
  out = i;                            % out=(double,[1, 1],{REAL})
end
% results: [(double,[1, 1],{REAL})]% args: {x=(double,[1, 1],{COMPLEX}), max=(double,1000.0,[1, 1],{REAL})}
function  [out] = iterations(x, max)
  c = x;                              % c=(double,[1, 1],{COMPLEX})
  i = 0;                              % i=(double,0.0,[1, 1],{REAL})
  [mc_t43] = abs(x);                  % mc_t43=(double,[1, 1],{REAL})
  mc_t46 = 2;                         % mc_t46=(double,2.0,[1, 1],{REAL})
  [mc_t41] = lt(mc_t43, mc_t46);      % mc_t41=(logical,[1, 1],{REAL})
  if mc_t41
    [mc_t42] = lt(i, max);              % mc_t42=(logical,[1, 1],{REAL})
    [mc_t40] = and(mc_t41, mc_t42);     % mc_t40=(logical,[1, 1],{REAL})
  else
    mc_t40 = mc_t41;                    % mc_t40=(logical,[1, 1],{REAL})
  end
  while mc_t40
    [mc_t44] = mtimes(x, x);            % mc_t44=(double,[1, 1],{REAL})
    mc_t45 = c;                         % mc_t45=(double,[1, 1],{COMPLEX})
    [x] = plus(mc_t44, mc_t45);         % x=(double,[1, 1],{COMPLEX})
    mc_t47 = 1;                         % mc_t47=(double,1.0,[1, 1],{REAL})
    [i] = plus(i, mc_t47);              % i=(double,[1, 1],{REAL})
  end
  out = i;                            % out=(double,[1, 1],{REAL})
end
% results: [(double,[1, 1],{REAL})]% args: {N=(double,100.0,[1, 1],{REAL}), Nmax=(double,1000.0,[1, 1],{REAL})}
function  [set] = mandelbrot(N, Nmax)
  [mc_t13] = sqrt(N);                 % mc_t13=(double,[1, 1],{REAL})
  [side] = round(mc_t13);             % side=(double,[1, 1],{REAL})
  mc_t30 = 1;                         % mc_t30=(double,1.0,[1, 1],{REAL})
  [ya] = uminus(mc_t30);              % ya=(double,[1, 1],{REAL})
  yb = 1;                             % yb=(double,1.0,[1, 1],{REAL})
  mc_t31 = 1.5;                       % mc_t31=(double,1.5,[1, 1],{REAL})
  [xa] = uminus(mc_t31);              % xa=(double,[1, 1],{REAL})
  xb = .5;                            % xb=(double,0.5,[1, 1],{REAL})
  [mc_t14] = minus(xb, xa);           % mc_t14=(double,[1, 1],{REAL})
  mc_t32 = 1;                         % mc_t32=(double,1.0,[1, 1],{REAL})
  [mc_t15] = minus(side, mc_t32);     % mc_t15=(double,[1, 1],{REAL})
  [dx] = mrdivide(mc_t14, mc_t15);    % dx=(double,[1, 1],{REAL})
  [mc_t16] = minus(yb, ya);           % mc_t16=(double,[1, 1],{REAL})
  mc_t33 = 1;                         % mc_t33=(double,1.0,[1, 1],{REAL})
  [mc_t17] = minus(side, mc_t33);     % mc_t17=(double,[1, 1],{REAL})
  [dy] = mrdivide(mc_t16, mc_t17);    % dy=(double,[1, 1],{REAL})
  [set] = zeros(side, side);          % set=(double,[?, ?],{REAL})
  mc_t34 = 1;                         % mc_t34=(double,1.0,[1, 1],{REAL})
  [mc_t29] = minus(side, mc_t34);     % mc_t29=(double,[1, 1],{REAL})
  mc_t39 = 0;                         % mc_t39=(double,0.0,[1, 1],{REAL})
  for x = (mc_t39 : mc_t29);
    mc_t35 = 1;                         % mc_t35=(double,1.0,[1, 1],{REAL})
    [mc_t28] = minus(side, mc_t35);     % mc_t28=(double,[1, 1],{REAL})
    mc_t38 = 0;                         % mc_t38=(double,0.0,[1, 1],{REAL})
    for y = (mc_t38 : mc_t28);
      mc_t26 = xa;                        % mc_t26=(double,[1, 1],{REAL})
      [mc_t27] = mtimes(x, dx);           % mc_t27=(double,[1, 1],{REAL})
      [mc_t20] = plus(mc_t26, mc_t27);    % mc_t20=(double,[1, 1],{REAL})
      [mc_t22] = i();                     % mc_t22=(double,[1, 1],{COMPLEX})
      mc_t24 = ya;                        % mc_t24=(double,[1, 1],{REAL})
      [mc_t25] = mtimes(y, dy);           % mc_t25=(double,[1, 1],{REAL})
      [mc_t23] = plus(mc_t24, mc_t25);    % mc_t23=(double,[1, 1],{REAL})
      [mc_t21] = mtimes(mc_t22, mc_t23);  % mc_t21=(double,[1, 1],{COMPLEX})
      [mc_t18] = plus(mc_t20, mc_t21);    % mc_t18=(double,[1, 1],{COMPLEX})
      mc_t19 = Nmax;                      % mc_t19=(double,1000.0,[1, 1],{REAL})
      [mc_t10] = iterations(mc_t18, mc_t19); % mc_t10=(double,[1, 1],{REAL})
      mc_t36 = 1;                         % mc_t36=(double,1.0,[1, 1],{REAL})
      [mc_t11] = plus(y, mc_t36);         % mc_t11=(double,[1, 1],{REAL})
      mc_t37 = 1;                         % mc_t37=(double,1.0,[1, 1],{REAL})
      [mc_t12] = plus(x, mc_t37);         % mc_t12=(double,[1, 1],{REAL})
      set(mc_t11, mc_t12) = mc_t10;       % set=(double,[?, ?],{REAL})
    end
  end
end
% results: [(double,[?, ?],{REAL})]% args: {x=(double,[1, 1],{COMPLEX}), max=(double,1000.0,[1, 1],{REAL})}
function  [out] = iterations(x, max)
  c = x;                              % c=(double,[1, 1],{COMPLEX})
  i = 0;                              % i=(double,0.0,[1, 1],{REAL})
  [mc_t43] = abs(x);                  % mc_t43=(double,[1, 1],{REAL})
  mc_t46 = 2;                         % mc_t46=(double,2.0,[1, 1],{REAL})
  [mc_t41] = lt(mc_t43, mc_t46);      % mc_t41=(logical,[1, 1],{REAL})
  if mc_t41
    [mc_t42] = lt(i, max);              % mc_t42=(logical,[1, 1],{REAL})
    [mc_t40] = and(mc_t41, mc_t42);     % mc_t40=(logical,[1, 1],{REAL})
  else
    mc_t40 = mc_t41;                    % mc_t40=(logical,[1, 1],{REAL})
  end
  while mc_t40
    [mc_t44] = mtimes(x, x);            % mc_t44=(double,[1, 1],{REAL})
    mc_t45 = c;                         % mc_t45=(double,[1, 1],{COMPLEX})
    [x] = plus(mc_t44, mc_t45);         % x=(double,[1, 1],{COMPLEX})
    mc_t47 = 1;                         % mc_t47=(double,1.0,[1, 1],{REAL})
    [i] = plus(i, mc_t47);              % i=(double,[1, 1],{REAL})
  end
  out = i;                            % out=(double,[1, 1],{REAL})
end
% results: [(double,[1, 1],{REAL})]% args: {scale=(double,[1, 1],{REAL})}
function  [output, valid] = drv_mbrt(scale)
  [mc_t1] = sqrt(scale);              % mc_t1=(double,[1, 1],{REAL})
  mc_t5 = 6000;                       % mc_t5=(double,6000.0,[1, 1],{REAL})
  [mc_t0] = mtimes(mc_t5, mc_t1);     % mc_t0=(double,[1, 1],{REAL})
  [N] = round(mc_t0);                 % N=(double,[1, 1],{REAL})
  mc_t6 = 10;                         % mc_t6=(double,10.0,[1, 1],{REAL})
  mc_t7 = 3;                          % mc_t7=(double,3.0,[1, 1],{REAL})
  [mc_t3] = mpower(mc_t6, mc_t7);     % mc_t3=(double,[1, 1],{REAL})
  [mc_t4] = sqrt(scale);              % mc_t4=(double,[1, 1],{REAL})
  [mc_t2] = mtimes(mc_t3, mc_t4);     % mc_t2=(double,[1, 1],{REAL})
  [Nmax] = round(mc_t2);              % Nmax=(double,[1, 1],{REAL})
  mc_t8 = 100;                        % mc_t8=(double,100.0,[1, 1],{REAL})
  mc_t9 = 1000;                       % mc_t9=(double,1000.0,[1, 1],{REAL})
  [set] = mandelbrot(mc_t8, mc_t9);   % set=(double,[?, ?],{REAL})
  [output] = set(:);                  % output=(double,[?, ?],{REAL})
  valid = 'na';                       % valid=(char,na,[1, 2],{REAL})
end
% results: [(double,[?, ?],{REAL}), (char,na,[1, 2],{REAL})]