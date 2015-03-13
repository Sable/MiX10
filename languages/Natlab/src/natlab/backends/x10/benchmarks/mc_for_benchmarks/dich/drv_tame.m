function  [U] = dirich(f1, f2, f3, f4, a, b, h, tol, max1)
  [mc_t15] = mrdivide(a, h);          % mc_t15=(double,[1, 1],{REAL})
  [mc_t14] = fix(mc_t15);             % mc_t14=(double,[1, 1],{REAL})
  mc_t85 = 1;                         % mc_t85=(double,1.0,[1, 1],{REAL})
  [n] = plus(mc_t14, mc_t85);         % n=(double,[1, 1],{REAL})
  [mc_t17] = mrdivide(b, h);          % mc_t17=(double,[1, 1],{REAL})
  [mc_t16] = fix(mc_t17);             % mc_t16=(double,[1, 1],{REAL})
  mc_t86 = 1;                         % mc_t86=(double,1.0,[1, 1],{REAL})
  [m] = plus(mc_t16, mc_t86);         % m=(double,[1, 1],{REAL})
  mc_t26 = a;                         % mc_t26=(double,4.0,[1, 1],{REAL})
  [mc_t27] = plus(f1, f2);            % mc_t27=(double,[1, 1],{REAL})
  [mc_t22] = mtimes(mc_t26, mc_t27);  % mc_t22=(double,[1, 1],{REAL})
  mc_t24 = b;                         % mc_t24=(double,4.0,[1, 1],{REAL})
  [mc_t25] = plus(f3, f4);            % mc_t25=(double,[1, 1],{REAL})
  [mc_t23] = mtimes(mc_t24, mc_t25);  % mc_t23=(double,[1, 1],{REAL})
  [mc_t18] = plus(mc_t22, mc_t23);    % mc_t18=(double,[1, 1],{REAL})
  mc_t87 = 2;                         % mc_t87=(double,2.0,[1, 1],{REAL})
  [mc_t20] = mtimes(mc_t87, a);       % mc_t20=(double,[1, 1],{REAL})
  mc_t88 = 2;                         % mc_t88=(double,2.0,[1, 1],{REAL})
  [mc_t21] = mtimes(mc_t88, b);       % mc_t21=(double,[1, 1],{REAL})
  [mc_t19] = plus(mc_t20, mc_t21);    % mc_t19=(double,[1, 1],{REAL})
  [ave] = mrdivide(mc_t18, mc_t19);   % ave=(double,[1, 1],{REAL})
  mc_t28 = ave;                       % mc_t28=(double,[1, 1],{REAL})
  [mc_t29] = ones(n, m);              % mc_t29=(double,[?, ?],{REAL})
  [U] = mtimes(mc_t28, mc_t29);       % U=(double,[?, ?],{REAL})
  mc_t90 = 1;                         % mc_t90=(double,1.0,[1, 1],{REAL})
  for l = (mc_t90 : m);
    mc_t89 = 1;                         % mc_t89=(double,1.0,[1, 1],{REAL})
    U(mc_t89, l) = f3;                  % U=(double,[?, ?],{REAL})
    U(n, l) = f4;                       % U=(double,[?, ?],{REAL})
  end
  mc_t92 = 1;                         % mc_t92=(double,1.0,[1, 1],{REAL})
  for k = (mc_t92 : n);
    mc_t91 = 1;                         % mc_t91=(double,1.0,[1, 1],{REAL})
    U(k, mc_t91) = f1;                  % U=(double,[?, ?],{REAL})
    U(k, m) = f2;                       % U=(double,[?, ?],{REAL})
  end
  mc_t93 = 1;                         % mc_t93=(double,1.0,[1, 1],{REAL})
  mc_t94 = 2;                         % mc_t94=(double,2.0,[1, 1],{REAL})
  [mc_t31] = U(mc_t93, mc_t94);       % mc_t31=(double,[1, 1],{REAL})
  mc_t95 = 2;                         % mc_t95=(double,2.0,[1, 1],{REAL})
  mc_t96 = 1;                         % mc_t96=(double,1.0,[1, 1],{REAL})
  [mc_t32] = U(mc_t95, mc_t96);       % mc_t32=(double,[1, 1],{REAL})
  [mc_t30] = plus(mc_t31, mc_t32);    % mc_t30=(double,[1, 1],{REAL})
  mc_t97 = 2;                         % mc_t97=(double,2.0,[1, 1],{REAL})
  [mc_t4] = mrdivide(mc_t30, mc_t97); % mc_t4=(double,[1, 1],{REAL})
  mc_t98 = 1;                         % mc_t98=(double,1.0,[1, 1],{REAL})
  mc_t99 = 1;                         % mc_t99=(double,1.0,[1, 1],{REAL})
  U(mc_t98, mc_t99) = mc_t4;          % U=(double,[?, ?],{REAL})
  mc_t100 = 1;                        % mc_t100=(double,1.0,[1, 1],{REAL})
  [mc_t36] = minus(m, mc_t100);       % mc_t36=(double,[1, 1],{REAL})
  mc_t101 = 1;                        % mc_t101=(double,1.0,[1, 1],{REAL})
  [mc_t34] = U(mc_t101, mc_t36);      % mc_t34=(double,[1, 1],{REAL})
  mc_t102 = 2;                        % mc_t102=(double,2.0,[1, 1],{REAL})
  [mc_t35] = U(mc_t102, m);           % mc_t35=(double,[1, 1],{REAL})
  [mc_t33] = plus(mc_t34, mc_t35);    % mc_t33=(double,[1, 1],{REAL})
  mc_t103 = 2;                        % mc_t103=(double,2.0,[1, 1],{REAL})
  [mc_t5] = mrdivide(mc_t33, mc_t103); % mc_t5=(double,[1, 1],{REAL})
  mc_t104 = 1;                        % mc_t104=(double,1.0,[1, 1],{REAL})
  U(mc_t104, m) = mc_t5;              % U=(double,[?, ?],{REAL})
  mc_t105 = 1;                        % mc_t105=(double,1.0,[1, 1],{REAL})
  [mc_t40] = minus(n, mc_t105);       % mc_t40=(double,[1, 1],{REAL})
  mc_t106 = 1;                        % mc_t106=(double,1.0,[1, 1],{REAL})
  [mc_t38] = U(mc_t40, mc_t106);      % mc_t38=(double,[1, 1],{REAL})
  mc_t107 = 2;                        % mc_t107=(double,2.0,[1, 1],{REAL})
  [mc_t39] = U(n, mc_t107);           % mc_t39=(double,[1, 1],{REAL})
  [mc_t37] = plus(mc_t38, mc_t39);    % mc_t37=(double,[1, 1],{REAL})
  mc_t108 = 2;                        % mc_t108=(double,2.0,[1, 1],{REAL})
  [mc_t6] = mrdivide(mc_t37, mc_t108); % mc_t6=(double,[1, 1],{REAL})
  mc_t109 = 1;                        % mc_t109=(double,1.0,[1, 1],{REAL})
  U(n, mc_t109) = mc_t6;              % U=(double,[?, ?],{REAL})
  mc_t110 = 1;                        % mc_t110=(double,1.0,[1, 1],{REAL})
  [mc_t46] = minus(n, mc_t110);       % mc_t46=(double,[1, 1],{REAL})
  mc_t47 = m;                         % mc_t47=(double,[1, 1],{REAL})
  [mc_t42] = U(mc_t46, mc_t47);       % mc_t42=(double,[1, 1],{REAL})
  mc_t44 = n;                         % mc_t44=(double,[1, 1],{REAL})
  mc_t111 = 1;                        % mc_t111=(double,1.0,[1, 1],{REAL})
  [mc_t45] = minus(m, mc_t111);       % mc_t45=(double,[1, 1],{REAL})
  [mc_t43] = U(mc_t44, mc_t45);       % mc_t43=(double,[1, 1],{REAL})
  [mc_t41] = plus(mc_t42, mc_t43);    % mc_t41=(double,[1, 1],{REAL})
  mc_t112 = 2;                        % mc_t112=(double,2.0,[1, 1],{REAL})
  [mc_t7] = mrdivide(mc_t41, mc_t112); % mc_t7=(double,[1, 1],{REAL})
  U(n, m) = mc_t7;                    % U=(double,[?, ?],{REAL})
  [mc_t59] = pi();                    % mc_t59=(double,3.141592653589793,[1, 1],{REAL})
  mc_t113 = 1;                        % mc_t113=(double,1.0,[1, 1],{REAL})
  [mc_t60] = minus(n, mc_t113);       % mc_t60=(double,[1, 1],{REAL})
  [mc_t58] = mrdivide(mc_t59, mc_t60); % mc_t58=(double,[1, 1],{REAL})
  [mc_t53] = cos(mc_t58);             % mc_t53=(double,[1, 1],{REAL})
  [mc_t56] = pi();                    % mc_t56=(double,3.141592653589793,[1, 1],{REAL})
  mc_t114 = 1;                        % mc_t114=(double,1.0,[1, 1],{REAL})
  [mc_t57] = minus(m, mc_t114);       % mc_t57=(double,[1, 1],{REAL})
  [mc_t55] = mrdivide(mc_t56, mc_t57); % mc_t55=(double,[1, 1],{REAL})
  [mc_t54] = cos(mc_t55);             % mc_t54=(double,[1, 1],{REAL})
  [mc_t52] = plus(mc_t53, mc_t54);    % mc_t52=(double,[1, 1],{REAL})
  mc_t115 = 2;                        % mc_t115=(double,2.0,[1, 1],{REAL})
  [mc_t51] = mpower(mc_t52, mc_t115); % mc_t51=(double,[1, 1],{REAL})
  mc_t116 = 4;                        % mc_t116=(double,4.0,[1, 1],{REAL})
  [mc_t50] = minus(mc_t116, mc_t51);  % mc_t50=(double,[1, 1],{REAL})
  [mc_t49] = sqrt(mc_t50);            % mc_t49=(double,[1, 1],{REAL})
  mc_t117 = 2;                        % mc_t117=(double,2.0,[1, 1],{REAL})
  [mc_t48] = plus(mc_t117, mc_t49);   % mc_t48=(double,[1, 1],{REAL})
  mc_t118 = 4;                        % mc_t118=(double,4.0,[1, 1],{REAL})
  [w] = mrdivide(mc_t118, mc_t48);    % w=(double,[1, 1],{REAL})
  err = 1;                            % err=(double,1.0,[1, 1],{REAL})
  cnt = 0;                            % cnt=(double,0.0,[1, 1],{REAL})
  [mc_t10] = gt(err, tol);            % mc_t10=(logical,[1, 1],{REAL})
  if mc_t10
    [mc_t11] = le(cnt, max1);           % mc_t11=(logical,[1, 1],{REAL})
    [mc_t9] = and(mc_t10, mc_t11);      % mc_t9=(logical,[1, 1],{REAL})
  else
    mc_t9 = mc_t10;                     % mc_t9=(logical,[1, 1],{REAL})
  end
  while mc_t9
    err = 0;                            % err=(double,0.0,[1, 1],{REAL})
    mc_t119 = 1;                        % mc_t119=(double,1.0,[1, 1],{REAL})
    [mc_t84] = minus(m, mc_t119);       % mc_t84=(double,[1, 1],{REAL})
    mc_t129 = 2;                        % mc_t129=(double,2.0,[1, 1],{REAL})
    for l = (mc_t129 : mc_t84);
      mc_t120 = 1;                        % mc_t120=(double,1.0,[1, 1],{REAL})
      [mc_t83] = minus(n, mc_t120);       % mc_t83=(double,[1, 1],{REAL})
      mc_t128 = 2;                        % mc_t128=(double,2.0,[1, 1],{REAL})
      for k = (mc_t128 : mc_t83);
        mc_t62 = w;                         % mc_t62=(double,[1, 1],{REAL})
        mc_t79 = k;                         % mc_t79=(double,[1, 1],{REAL})
        mc_t121 = 1;                        % mc_t121=(double,1.0,[1, 1],{REAL})
        [mc_t80] = plus(l, mc_t121);        % mc_t80=(double,[1, 1],{REAL})
        [mc_t75] = U(mc_t79, mc_t80);       % mc_t75=(double,[1, 1],{REAL})
        mc_t77 = k;                         % mc_t77=(double,[1, 1],{REAL})
        mc_t122 = 1;                        % mc_t122=(double,1.0,[1, 1],{REAL})
        [mc_t78] = minus(l, mc_t122);       % mc_t78=(double,[1, 1],{REAL})
        [mc_t76] = U(mc_t77, mc_t78);       % mc_t76=(double,[1, 1],{REAL})
        [mc_t71] = plus(mc_t75, mc_t76);    % mc_t71=(double,[1, 1],{REAL})
        mc_t123 = 1;                        % mc_t123=(double,1.0,[1, 1],{REAL})
        [mc_t73] = plus(k, mc_t123);        % mc_t73=(double,[1, 1],{REAL})
        mc_t74 = l;                         % mc_t74=(double,[1, 1],{REAL})
        [mc_t72] = U(mc_t73, mc_t74);       % mc_t72=(double,[1, 1],{REAL})
        [mc_t67] = plus(mc_t71, mc_t72);    % mc_t67=(double,[1, 1],{REAL})
        mc_t124 = 1;                        % mc_t124=(double,1.0,[1, 1],{REAL})
        [mc_t69] = minus(k, mc_t124);       % mc_t69=(double,[1, 1],{REAL})
        mc_t70 = l;                         % mc_t70=(double,[1, 1],{REAL})
        [mc_t68] = U(mc_t69, mc_t70);       % mc_t68=(double,[1, 1],{REAL})
        [mc_t64] = plus(mc_t67, mc_t68);    % mc_t64=(double,[1, 1],{REAL})
        [mc_t66] = U(k, l);                 % mc_t66=(double,[1, 1],{REAL})
        mc_t125 = 4;                        % mc_t125=(double,4.0,[1, 1],{REAL})
        [mc_t65] = mtimes(mc_t125, mc_t66); % mc_t65=(double,[1, 1],{REAL})
        [mc_t63] = minus(mc_t64, mc_t65);   % mc_t63=(double,[1, 1],{REAL})
        [mc_t61] = mtimes(mc_t62, mc_t63);  % mc_t61=(double,[1, 1],{REAL})
        mc_t126 = 4;                        % mc_t126=(double,4.0,[1, 1],{REAL})
        [relx] = mrdivide(mc_t61, mc_t126); % relx=(double,[1, 1],{REAL})
        [mc_t81] = U(k, l);                 % mc_t81=(double,[1, 1],{REAL})
        mc_t82 = relx;                      % mc_t82=(double,[1, 1],{REAL})
        [mc_t8] = plus(mc_t81, mc_t82);     % mc_t8=(double,[1, 1],{REAL})
        U(k, l) = mc_t8;                    % U=(double,[?, ?],{REAL})
        [mc_t13] = abs(relx);               % mc_t13=(double,[1, 1],{REAL})
        [mc_t127] = le(err, mc_t13);        % mc_t127=(logical,[1, 1],{REAL})
        if mc_t127
          [err] = abs(relx);                  % err=(double,[1, 1],{REAL})
        else
        end
      end
    end
    mc_t130 = 1;                        % mc_t130=(double,1.0,[1, 1],{REAL})
    [cnt] = plus(cnt, mc_t130);         % cnt=(double,[1, 1],{REAL})
  end
end
% results: [(double,[?, ?],{REAL})]
% args: {scale=(double,[1, 1],{REAL})}
function  [time, output, valid] = drv_tame(scale)
  a = 4;                              % a=(double,4.0,[1, 1],{REAL})
  b = 4;                              % b=(double,4.0,[1, 1],{REAL})
  h = 0.03;                           % h=(double,0.03,[1, 1],{REAL})
  mc_t1 = 5;                          % mc_t1=(double,5.0,[1, 1],{REAL})
  [mc_t0] = uminus(mc_t1);            % mc_t0=(double,[1, 1],{REAL})
  mc_t2 = 10;                         % mc_t2=(double,10.0,[1, 1],{REAL})
  [tol] = mpower(mc_t2, mc_t0);       % tol=(double,[1, 1],{REAL})
  max1 = 1000;                        % max1=(double,1000.0,[1, 1],{REAL})
  f1 = 20;                            % f1=(double,20.0,[1, 1],{REAL})
  f2 = 180;                           % f2=(double,180.0,[1, 1],{REAL})
  f3 = 80;                            % f3=(double,80.0,[1, 1],{REAL})
  f4 = 0;                             % f4=(double,0.0,[1, 1],{REAL})
  mc_t3 = 1;                          % mc_t3=(double,1.0,[1, 1],{REAL})
  for time = (mc_t3 : scale);
    [U] = dirich(f1, f2, f3, f4, a, b, h, tol, max1); % U=(double,[?, ?],{REAL})
  end
  time = 777;                         % time=(double,777.0,[1, 1],{REAL})
  output = U;                         % output=(double,[?, ?],{REAL})
  valid = 'N/A';                      % valid=(char,N/A,[1, 3],{REAL})
end
% results: [(double,777.0,[1, 1],{REAL}), (double,[?, ?],{REAL}), (char,N/A,[1, 3],{REAL})]
