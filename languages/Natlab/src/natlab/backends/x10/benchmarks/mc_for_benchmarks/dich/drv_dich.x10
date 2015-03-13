class testclass{
	static def dirich (f1: Double, f2: Double, f3: Double, f4: Double, a: Double, b: Double, h: Double, tol: Double, max1: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file finds the Dirichlet solution to
//%	Laplace's equation
//%
//%			u  (x, y)+u  (x, y) = 0,
//%			 xx	   yy
//%
//%	with the boundary conditions
//%
//%		u(x, 0) = f1, u(x, b) = f2 for all 0 <= x <= a, and
//%
//%		u(0, y) = f3, u(a, y) = f4 for all 0 <= y <= b.
//%
//%	The subscripts xx and yy indicate the second partial
//%	derivatives of u(x, y) with respect to x and y respectively.
//%
//%	Invocation:
//%		>> U = dirich(f1, f2, f3, f4, a, b, h, tol, max1)
//%
//%		where
//%
//%		i. f1 is lower-edge boundary value,
//%
//%		i. f2 is the upper-edge boundary value,
//%
//%		i. f3 is the left-edge boundary value,
//%
//%		i. f4 is the right-edge boundary value,
//%
//%		i. a is the extent of the abscissa,
//%
//%		i. b is the extent of the ordinate,
//%
//%		i. h is the step size,
//%
//%		i. tol is the convergence tolerance,
//%
//%		i. max1 is the maximum number of iterations,
//%
//%		o. U is the solution matrix.
//%
//%	Requirements:
//%		None.
//%
//%	Examples:
//%		>> U = dirich(20, 180, 80, 0, 4, 4, 0.1, 0.0001, 200)
//%
//%	Source:
//%		Numerical Methods: MATLAB Programs,
//%		(c) John H. Mathews, 1995.
//%
//%		Accompanying text:
//%		Numerical Methods for Mathematics, Science and
//%		Engineering, 2nd Edition, 1992.
//%
//%		Prentice Hall, Englewood Cliffs,
//%		New Jersey, 07632, USA.
//%
//%		Also part of the FALCON project.
//%
//%	Author:
//%		John H. Mathews (mathews@fullerton.edu).
//%
//%	Date:
//%		March 1995.
//%
//%-----------------------------------------------------------------------
var mc_t15: Double = mrdivide(a, h);
var mc_t14: Double = fix(mc_t15);
var mc_t85: Double = 1;
var n: Double = Mix10.plus(mc_t14, mc_t85);
var mc_t17: Double = mrdivide(b, h);
var mc_t16: Double = fix(mc_t17);
var mc_t86: Double = 1;
var m: Double = Mix10.plus(mc_t16, mc_t86);
var mc_t26: Double = a;
var mc_t27: Double = Mix10.plus(f1, f2);
var mc_t22: Double = mtimes(mc_t26, mc_t27);
var mc_t24: Double = b;
var mc_t25: Double = Mix10.plus(f3, f4);
var mc_t23: Double = mtimes(mc_t24, mc_t25);
var mc_t18: Double = Mix10.plus(mc_t22, mc_t23);
var mc_t87: Double = 2;
var mc_t20: Double = mtimes(mc_t87, a);
var mc_t88: Double = 2;
var mc_t21: Double = mtimes(mc_t88, b);
var mc_t19: Double = Mix10.plus(mc_t20, mc_t21);
var ave: Double = mrdivide(mc_t18, mc_t19);
var mc_t28: Double = ave;
val mc_t29: Array[Double] = new Array[Double](ones(n, m));
val U: Array[Double] = new Array[Double](mtimes(mc_t28, mc_t29));
var mc_t90: Double = 1;
var l: Double;
var mc_t89: Double;
	    for (l = mc_t90 ;
(l <= m);l = (l + 1))
	        {
mc_t89 = 1 ;
U(mc_t89 as Int, l as Int) = f3 ;
U(n as Int, l as Int) = f4 ;
}
var mc_t92: Double = 1;
var k: Double;
var mc_t91: Double;
	    for (k = mc_t92 ;
(k <= n);k = (k + 1))
	        {
mc_t91 = 1 ;
U(k as Int, mc_t91 as Int) = f1 ;
U(k as Int, m as Int) = f2 ;
}
var mc_t93: Double = 1;
var mc_t94: Double = 2;
var mc_t31: Double;
mc_t31 = U(mc_t93 as Int, mc_t94as Int) ;
var mc_t95: Double = 2;
var mc_t96: Double = 1;
var mc_t32: Double;
mc_t32 = U(mc_t95 as Int, mc_t96as Int) ;
var mc_t30: Double = Mix10.plus(mc_t31, mc_t32);
var mc_t97: Double = 2;
var mc_t4: Double = mrdivide(mc_t30, mc_t97);
var mc_t98: Double = 1;
var mc_t99: Double = 1;
U(mc_t98 as Int, mc_t99 as Int) = mc_t4 ;
var mc_t100: Double = 1;
var mc_t36: Double = Mix10.minus(m, mc_t100);
var mc_t101: Double = 1;
var mc_t34: Double;
mc_t34 = U(mc_t101 as Int, mc_t36as Int) ;
var mc_t102: Double = 2;
var mc_t35: Double;
mc_t35 = U(mc_t102 as Int, mas Int) ;
var mc_t33: Double = Mix10.plus(mc_t34, mc_t35);
var mc_t103: Double = 2;
var mc_t5: Double = mrdivide(mc_t33, mc_t103);
var mc_t104: Double = 1;
U(mc_t104 as Int, m as Int) = mc_t5 ;
var mc_t105: Double = 1;
var mc_t40: Double = Mix10.minus(n, mc_t105);
var mc_t106: Double = 1;
var mc_t38: Double;
mc_t38 = U(mc_t40 as Int, mc_t106as Int) ;
var mc_t107: Double = 2;
var mc_t39: Double;
mc_t39 = U(n as Int, mc_t107as Int) ;
var mc_t37: Double = Mix10.plus(mc_t38, mc_t39);
var mc_t108: Double = 2;
var mc_t6: Double = mrdivide(mc_t37, mc_t108);
var mc_t109: Double = 1;
U(n as Int, mc_t109 as Int) = mc_t6 ;
var mc_t110: Double = 1;
var mc_t46: Double = Mix10.minus(n, mc_t110);
var mc_t47: Double = m;
var mc_t42: Double;
mc_t42 = U(mc_t46 as Int, mc_t47as Int) ;
var mc_t44: Double = n;
var mc_t111: Double = 1;
var mc_t45: Double = Mix10.minus(m, mc_t111);
var mc_t43: Double;
mc_t43 = U(mc_t44 as Int, mc_t45as Int) ;
var mc_t41: Double = Mix10.plus(mc_t42, mc_t43);
var mc_t112: Double = 2;
var mc_t7: Double = mrdivide(mc_t41, mc_t112);
U(n as Int, m as Int) = mc_t7 ;
var mc_t59: Double = pi();
var mc_t113: Double = 1;
var mc_t60: Double = Mix10.minus(n, mc_t113);
var mc_t58: Double = mrdivide(mc_t59, mc_t60);
var mc_t53: Double = cos(mc_t58);
var mc_t56: Double = pi();
var mc_t114: Double = 1;
var mc_t57: Double = Mix10.minus(m, mc_t114);
var mc_t55: Double = mrdivide(mc_t56, mc_t57);
var mc_t54: Double = cos(mc_t55);
var mc_t52: Double = Mix10.plus(mc_t53, mc_t54);
var mc_t115: Double = 2;
var mc_t51: Double = mpower(mc_t52, mc_t115);
var mc_t116: Double = 4;
var mc_t50: Double = Mix10.minus(mc_t116, mc_t51);
var mc_t49: Double = sqrt(mc_t50);
var mc_t117: Double = 2;
var mc_t48: Double = Mix10.plus(mc_t117, mc_t49);
var mc_t118: Double = 4;
var w: Double = mrdivide(mc_t118, mc_t48);
var err: Double = 1;
var cnt: Double = 0;
var mc_t10: Boolean = Mix10.gt(err, tol);
var mc_t11: Boolean;
var mc_t9: Boolean;
	    if (mc_t10)
	        {
mc_t11 = le(cnt, max1) ;
mc_t9 = and(mc_t10, mc_t11) ;
}
else 
	        {
mc_t9 = mc_t10 ;
}
var mc_t119: Double;
var mc_t84: Double;
var mc_t129: Double;
var mc_t120: Double;
var mc_t83: Double;
var mc_t128: Double;
var mc_t62: Double;
var mc_t79: Double;
var mc_t121: Double;
var mc_t80: Double;
var mc_t75: Double;
var mc_t77: Double;
var mc_t122: Double;
var mc_t78: Double;
var mc_t76: Double;
var mc_t71: Double;
var mc_t123: Double;
var mc_t73: Double;
var mc_t74: Double;
var mc_t72: Double;
var mc_t67: Double;
var mc_t124: Double;
var mc_t69: Double;
var mc_t70: Double;
var mc_t68: Double;
var mc_t64: Double;
var mc_t66: Double;
var mc_t125: Double;
var mc_t65: Double;
var mc_t63: Double;
var mc_t61: Double;
var mc_t126: Double;
var relx: Double;
var mc_t81: Double;
var mc_t82: Double;
var mc_t8: Double;
var mc_t13: Double;
var mc_t127: Boolean;
var mc_t130: Double;
	    while (mc_t9)
	       {
err = 0 ;
mc_t119 = 1 ;
mc_t84 = Mix10.minus(m, mc_t119) ;
mc_t129 = 2 ;
var l: Double;
	       for (l = mc_t129 ;
(l <= mc_t84);l = (l + 1))
	           {
mc_t120 = 1 ;
mc_t83 = Mix10.minus(n, mc_t120) ;
mc_t128 = 2 ;
var k: Double;
	           for (k = mc_t128 ;
(k <= mc_t83);k = (k + 1))
	               {
mc_t62 = w ;
mc_t79 = k ;
mc_t121 = 1 ;
mc_t80 = Mix10.plus(l, mc_t121) ;
mc_t75 = U(mc_t79 as Int, mc_t80as Int) ;
mc_t77 = k ;
mc_t122 = 1 ;
mc_t78 = Mix10.minus(l, mc_t122) ;
mc_t76 = U(mc_t77 as Int, mc_t78as Int) ;
mc_t71 = Mix10.plus(mc_t75, mc_t76) ;
mc_t123 = 1 ;
mc_t73 = Mix10.plus(k, mc_t123) ;
mc_t74 = l ;
mc_t72 = U(mc_t73 as Int, mc_t74as Int) ;
mc_t67 = Mix10.plus(mc_t71, mc_t72) ;
mc_t124 = 1 ;
mc_t69 = Mix10.minus(k, mc_t124) ;
mc_t70 = l ;
mc_t68 = U(mc_t69 as Int, mc_t70as Int) ;
mc_t64 = Mix10.plus(mc_t67, mc_t68) ;
mc_t66 = U(k as Int, las Int) ;
mc_t125 = 4 ;
mc_t65 = mtimes(mc_t125, mc_t66) ;
mc_t63 = Mix10.minus(mc_t64, mc_t65) ;
mc_t61 = mtimes(mc_t62, mc_t63) ;
mc_t126 = 4 ;
relx = mrdivide(mc_t61, mc_t126) ;
//...
mc_t81 = U(k as Int, las Int) ;
mc_t82 = relx ;
mc_t8 = Mix10.plus(mc_t81, mc_t82) ;
U(k as Int, l as Int) = mc_t8 ;
mc_t13 = abs(relx) ;
mc_t127 = le(err, mc_t13) ;
	               if (mc_t127)
	                   {
err = abs(relx) ;
}
else 
	                   {
}
}
}
mc_t130 = 1 ;
cnt = Mix10.plus(cnt, mc_t130) ;
}
	    return U;
}

}	static def drv_dich (scale: Double)
	    {
//%
//%  Driver for the Dirichlet solution to Laplace's equation.
//%
//%t1 = clock;
var a: Double = 4;
var b: Double = 4;
var h: Double = 0.03;
var mc_t1: Double = 5;
var mc_t0: Double = uminus(mc_t1);
var mc_t2: Double = 10;
var tol: Double = mpower(mc_t2, mc_t0);
var max1: Double = 1000;
var f1: Double = 20;
var f2: Double = 180;
var f3: Double = 80;
var f4: Double = 0;
var mc_t3: Double = 1;
var time: Double;
val U: Array[Double];
	    for (time = mc_t3 ;
(time <= scale);time = (time + 1))
	        {
U = dirich(f1, f2, f3, f4, a, b, h, tol, max1) ;
}
//%t2 = clock;
//% Compute the running time in seconds
//%time = (t2-t1)*[0 0 86400 3600 60 1]';
time = 777 ;
//% Store the benchmark output
//%output = {mean(U(:))};
val output: Array[Double] = new Array[Double](U);
//% No validation performed
val valid: Array[String] = new Array[String]('N/A');
	    return [time,output,valid];
}

}