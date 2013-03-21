class testclass{
	static def drv_fiff (scale: Double)
	    {
var a: Double = 2.5;
var b: Double = 1.5;
var c: Double = 0.5;
var n: Double = 3500;
var m: Double = 3500;
var mc_t0: Double = 1;
var x: Double;
val U: Array[Double];
	    for (x = mc_t0 ;
(x <= scale);x = (x + 1))
	        {
U = finediff(a, b, c, n, m) ;
}
var time: Double = 777;
val output: Array[Double] = new Array[Double](U);
	    return [time,output];
}

}	static def finediff (a: Double, b: Double, c: Double, n: Double, m: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file finds the finite-difference solution
//%	to the wave equation
//%
//%			     2
//%		u  (x, t) = c u  (x, t),
//%		 tt	       xx
//%
//%	with the boundary conditions
//%
//%		u(0, t) = 0, u(a, t) = 0 for all 0 <= t <= b,
//%
//%		u(x, 0) = sin(pi*x)+sin(2*pi*x), for all 0 < x < a,
//%
//%		u (x, 0) = 0 for all 0 < x < a.
//%		 t
//%
//%	The subscripts t, tt and xx denote the first and second
//%	partial derivatives of u(x, t) with respect to t and x.
//%
//%	Invocation:
//%		>> U = finediff(a, b, c, n, m)
//%
//%		where
//%
//%		i. a is the displacement,
//%
//%		i. b is the time duration,
//%
//%		i. c is the square root of the
//%		   constant in the wave equation,
//%
//%		i. n is the number of grid points over [0, a],
//%
//%		i. m is the number of grid points over [0, b],
//%
//%		o. U is the solution matrix.
//%
//%	Requirements:
//%		None.
//%
//%	Examples:
//%		>> U = finediff(2.5, 1.5, 0.5, 451, 451)
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
var mc_t4: Double = a;
var mc_t94: Double = 1;
var mc_t5: Double = Mix10.minus(n, mc_t94);
var h: Double = mrdivide(mc_t4, mc_t5);
var mc_t6: Double = b;
var mc_t95: Double = 1;
var mc_t7: Double = Mix10.minus(m, mc_t95);
var k: Double = mrdivide(mc_t6, mc_t7);
var mc_t8: Double = mtimes(c, k);
var mc_t9: Double = h;
var r: Double = mrdivide(mc_t8, mc_t9);
var mc_t96: Double = 2;
var r2: Double = mpower(r, mc_t96);
var mc_t97: Double = 2;
var mc_t10: Double = mpower(r, mc_t97);
var mc_t98: Double = 2;
var r22: Double = mrdivide(mc_t10, mc_t98);
var mc_t99: Double = 2;
var mc_t11: Double = mpower(r, mc_t99);
var mc_t100: Double = 1;
var s1: Double = Mix10.minus(mc_t100, mc_t11);
var mc_t101: Double = 2;
var mc_t13: Double = mpower(r, mc_t101);
var mc_t102: Double = 2;
var mc_t12: Double = mtimes(mc_t102, mc_t13);
var mc_t103: Double = 2;
var s2: Double = Mix10.minus(mc_t103, mc_t12);
val U: Array[Double] = new Array[Double](zeros(n, m));
var mc_t104: Double = 1;
var mc_t74: Double = Mix10.minus(n, mc_t104);
var mc_t117: Double = 2;
var i1: Double;
var mc_t25: Double;
var mc_t26: Double;
var mc_t23: Double;
var mc_t105: Double;
var mc_t24: Double;
var mc_t22: Double;
var mc_t14: Double;
var mc_t21: Double;
var mc_t106: Double;
var mc_t19: Double;
var mc_t20: Double;
var mc_t17: Double;
var mc_t107: Double;
var mc_t18: Double;
var mc_t16: Double;
var mc_t15: Double;
var mc_t1: Double;
var mc_t108: Double;
var mc_t59: Double;
var mc_t72: Double;
var mc_t73: Double;
var mc_t70: Double;
var mc_t109: Double;
var mc_t71: Double;
var mc_t69: Double;
var mc_t61: Double;
var mc_t68: Double;
var mc_t110: Double;
var mc_t66: Double;
var mc_t67: Double;
var mc_t64: Double;
var mc_t111: Double;
var mc_t65: Double;
var mc_t63: Double;
var mc_t62: Double;
var mc_t60: Double;
var mc_t27: Double;
var mc_t29: Double;
var mc_t57: Double;
var mc_t58: Double;
var mc_t55: Double;
var mc_t56: Double;
var mc_t54: Double;
var mc_t46: Double;
var mc_t53: Double;
var mc_t112: Double;
var mc_t51: Double;
var mc_t52: Double;
var mc_t49: Double;
var mc_t50: Double;
var mc_t48: Double;
var mc_t47: Double;
var mc_t39: Double;
var mc_t44: Double;
var mc_t45: Double;
var mc_t42: Double;
var mc_t113: Double;
var mc_t43: Double;
var mc_t41: Double;
var mc_t40: Double;
var mc_t31: Double;
var mc_t38: Double;
var mc_t114: Double;
var mc_t36: Double;
var mc_t37: Double;
var mc_t34: Double;
var mc_t115: Double;
var mc_t35: Double;
var mc_t33: Double;
var mc_t32: Double;
var mc_t30: Double;
var mc_t28: Double;
var mc_t2: Double;
var mc_t116: Double;
	    for (i1 = mc_t117 ;
(i1 <= mc_t74);i1 = (i1 + 1))
	        {
mc_t25 = pi() ;
mc_t26 = h ;
mc_t23 = mtimes(mc_t25, mc_t26) ;
mc_t105 = 1 ;
mc_t24 = Mix10.minus(i1, mc_t105) ;
mc_t22 = mtimes(mc_t23, mc_t24) ;
mc_t14 = sin(mc_t22) ;
mc_t21 = pi() ;
mc_t106 = 2 ;
mc_t19 = mtimes(mc_t106, mc_t21) ;
mc_t20 = h ;
mc_t17 = mtimes(mc_t19, mc_t20) ;
mc_t107 = 1 ;
mc_t18 = Mix10.minus(i1, mc_t107) ;
mc_t16 = mtimes(mc_t17, mc_t18) ;
mc_t15 = sin(mc_t16) ;
mc_t1 = Mix10.plus(mc_t14, mc_t15) ;
mc_t108 = 1 ;
U(i1 as Int, mc_t108 as Int) = mc_t1 ;
mc_t59 = s1 ;
mc_t72 = pi() ;
mc_t73 = h ;
mc_t70 = mtimes(mc_t72, mc_t73) ;
mc_t109 = 1 ;
mc_t71 = Mix10.minus(i1, mc_t109) ;
mc_t69 = mtimes(mc_t70, mc_t71) ;
mc_t61 = sin(mc_t69) ;
mc_t68 = pi() ;
mc_t110 = 2 ;
mc_t66 = mtimes(mc_t110, mc_t68) ;
mc_t67 = h ;
mc_t64 = mtimes(mc_t66, mc_t67) ;
mc_t111 = 1 ;
mc_t65 = Mix10.minus(i1, mc_t111) ;
mc_t63 = mtimes(mc_t64, mc_t65) ;
mc_t62 = sin(mc_t63) ;
mc_t60 = Mix10.plus(mc_t61, mc_t62) ;
mc_t27 = mtimes(mc_t59, mc_t60) ;
mc_t29 = r22 ;
mc_t57 = pi() ;
mc_t58 = h ;
mc_t55 = mtimes(mc_t57, mc_t58) ;
mc_t56 = i1 ;
mc_t54 = mtimes(mc_t55, mc_t56) ;
mc_t46 = sin(mc_t54) ;
mc_t53 = pi() ;
mc_t112 = 2 ;
mc_t51 = mtimes(mc_t112, mc_t53) ;
mc_t52 = h ;
mc_t49 = mtimes(mc_t51, mc_t52) ;
mc_t50 = i1 ;
mc_t48 = mtimes(mc_t49, mc_t50) ;
mc_t47 = sin(mc_t48) ;
mc_t39 = Mix10.plus(mc_t46, mc_t47) ;
mc_t44 = pi() ;
mc_t45 = h ;
mc_t42 = mtimes(mc_t44, mc_t45) ;
mc_t113 = 2 ;
mc_t43 = Mix10.minus(i1, mc_t113) ;
mc_t41 = mtimes(mc_t42, mc_t43) ;
mc_t40 = sin(mc_t41) ;
mc_t31 = Mix10.plus(mc_t39, mc_t40) ;
mc_t38 = pi() ;
mc_t114 = 2 ;
mc_t36 = mtimes(mc_t114, mc_t38) ;
mc_t37 = h ;
mc_t34 = mtimes(mc_t36, mc_t37) ;
mc_t115 = 2 ;
mc_t35 = Mix10.minus(i1, mc_t115) ;
mc_t33 = mtimes(mc_t34, mc_t35) ;
mc_t32 = sin(mc_t33) ;
mc_t30 = Mix10.plus(mc_t31, mc_t32) ;
mc_t28 = mtimes(mc_t29, mc_t30) ;
mc_t2 = Mix10.plus(mc_t27, mc_t28) ;
mc_t116 = 2 ;
U(i1 as Int, mc_t116 as Int) = mc_t2 ;
//...
//...
}
var mc_t126: Double = 3;
var j1: Double;
var mc_t118: Double;
var mc_t93: Double;
var mc_t125: Double;
var mc_t89: Double;
var mc_t91: Double;
var mc_t119: Double;
var mc_t92: Double;
var mc_t90: Double;
var mc_t79: Double;
var mc_t81: Double;
var mc_t120: Double;
var mc_t87: Double;
var mc_t121: Double;
var mc_t88: Double;
var mc_t83: Double;
var mc_t122: Double;
var mc_t85: Double;
var mc_t123: Double;
var mc_t86: Double;
var mc_t84: Double;
var mc_t82: Double;
var mc_t80: Double;
var mc_t75: Double;
var mc_t77: Double;
var mc_t124: Double;
var mc_t78: Double;
var mc_t76: Double;
var mc_t3: Double;
	    for (j1 = mc_t126 ;
(j1 <= m);j1 = (j1 + 1))
	        {
mc_t118 = 1 ;
mc_t93 = Mix10.minus(n, mc_t118) ;
mc_t125 = 2 ;
var i1: Double;
	        for (i1 = mc_t125 ;
(i1 <= mc_t93);i1 = (i1 + 1))
	            {
mc_t89 = s2 ;
mc_t91 = i1 ;
mc_t119 = 1 ;
mc_t92 = Mix10.minus(j1, mc_t119) ;
mc_t90 = U(mc_t91 as Int, mc_t92as Int) ;
mc_t79 = mtimes(mc_t89, mc_t90) ;
mc_t81 = r2 ;
mc_t120 = 1 ;
mc_t87 = Mix10.minus(i1, mc_t120) ;
mc_t121 = 1 ;
mc_t88 = Mix10.minus(j1, mc_t121) ;
mc_t83 = U(mc_t87 as Int, mc_t88as Int) ;
mc_t122 = 1 ;
mc_t85 = Mix10.plus(i1, mc_t122) ;
mc_t123 = 1 ;
mc_t86 = Mix10.minus(j1, mc_t123) ;
mc_t84 = U(mc_t85 as Int, mc_t86as Int) ;
mc_t82 = Mix10.plus(mc_t83, mc_t84) ;
mc_t80 = mtimes(mc_t81, mc_t82) ;
mc_t75 = Mix10.plus(mc_t79, mc_t80) ;
mc_t77 = i1 ;
mc_t124 = 2 ;
mc_t78 = Mix10.minus(j1, mc_t124) ;
mc_t76 = U(mc_t77 as Int, mc_t78as Int) ;
mc_t3 = Mix10.minus(mc_t75, mc_t76) ;
U(i1 as Int, j1 as Int) = mc_t3 ;
//...
}
}
	    return U;
}

}