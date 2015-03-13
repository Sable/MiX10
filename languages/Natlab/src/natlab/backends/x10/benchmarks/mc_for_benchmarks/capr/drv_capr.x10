class testclass{
	static def drv_capr (scale: Double)
	    {
//%
//%  Driver to compute the capacitance of a transmission line using
//%  finite difference and Gauss-Seidel iteration.
//%
//%t1 = clock;
var mc_t2: Double = 0.3257463;
var mc_t3: Double = 2;
var a: Double = mtimes(mc_t2, mc_t3);
//% the numbers in parentheses are "rand's" made deterministic
var mc_t4: Double = 8.65;
var mc_t5: Double = 0.04039;
var b: Double = mtimes(mc_t4, mc_t5);
var mc_t6: Double = 3.29;
var mc_t7: Double = 0.55982;
var c: Double = mtimes(mc_t6, mc_t7);
var mc_t8: Double = 0.727561;
var mc_t9: Double = 6.171;
var d: Double = mtimes(mc_t8, mc_t9);
var mc_t10: Double = 56.0980;
var mc_t11: Double = 0.36;
var mc_t0: Double = mtimes(mc_t10, mc_t11);
var n: Double = floor(mc_t0);
var tol: Double = 1.3e-13;
//% Tolerance.
var rel: Double = 0.90;
//% Relaxation parameter.
var mc_t12: Double = 10;
var mc_t1: Double = mtimes(scale, mc_t12);
var mc_t13: Double = 1;
var time: Double;
var cap: Double;
	    for (time = mc_t13 ;
(time <= mc_t1);time = (time + 1))
	        {
cap = capacitor(a, b, c, d, n, tol, rel) ;
}
//%t2 = clock;
//% Compute the running time in seconds
//%time = (t2-t1)*[0 0 86400 3600 60 1]';
//% Store the benchmark output
//%output = {mean(cap(:))};
//% No validation performed
//%valid = 'N/A';
	    return cap;
}

}	static def linspace (d1: Double, d2: Double, n: Double)
	    {
//%-----------------------------------------------------------------------
//%LINSPACE Linearly spaced vector.
//%   LINSPACE(x1, x2) generates a row vector of n linearly
//%   equally spaced points between x1 and x2.
//%
//%   See also LOGSPACE, :.
//%
//%   Copyright 1984-2001 The MathWorks, Inc.
//%   $Revision: 5.11 $  $Date: 2001/04/15 12:02:30 $
//%-----------------------------------------------------------------------
var mc_t174: Double = d1;
var mc_t181: Double = 2;
var mc_t180: Double = Mix10.minus(n, mc_t181);
var mc_t182: Double = 0;
var mc_t178: Array[Double] = new Array[Double](colon(mc_t182, mc_t180));
var mc_t179: Double = Mix10.minus(d2, d1);
var mc_t176: Array[Double] = new Array[Double](mtimes(mc_t178, mc_t179));
var mc_t183: Double = 1;
var mc_t177: Double = Mix10.minus(n, mc_t183);
var mc_t175: Array[Double] = new Array[Double](mrdivide(mc_t176, mc_t177));
var mc_t172: Array[Double] = new Array[Double](Mix10.plus(mc_t174, mc_t175));
var mc_t173: Double = d2;
var y: Array[Double] = new Array[Double](horzcat(mc_t172, mc_t173));
	    return y;
}

}	static def seidel (f: Array[Double], mask: Array[Double], n: Double, m: Double, na: Double, mb: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file makes one Seidel iteration.
//%
//%	Invocation:
//%		>> g = seidel(f, mask, n, m, na, mb)
//%
//%		where
//%
//%		i. f is the potential array,
//%
//%		i. mask is the mask array,
//%
//%		i. n is the number of points along the x-axis,
//%
//%		i. m is the number of points along the height of
//%		   the outer conductor,
//%
//%		i. na is the number of points along the width of
//%		   the inner conductor,
//%
//%		i. mb is the number of points along the height of
//%		   the inner conductor,
//%
//%		o. g is the updated potential array.
//%
//%	Requirements:
//%		None.
//%
//%	Source:
//%		Computational Electromagnetics - EEK 170 course at
//%		http://www.elmagn.chalmers.se/courses/CEM/.
//%
//%-----------------------------------------------------------------------
var mc_t159: Double = 2;
var ii: Double;
var mc_t158: Double;
var mc_t90: Double;
var mc_t92: Double;
var mc_t153: Double;
var mc_t109: Double;
var mc_t110: Double;
var mc_t105: Double;
var mc_t154: Double;
var mc_t107: Double;
var mc_t108: Double;
var mc_t106: Double;
var mc_t101: Double;
var mc_t103: Double;
var mc_t155: Double;
var mc_t104: Double;
var mc_t102: Double;
var mc_t97: Double;
var mc_t99: Double;
var mc_t156: Double;
var mc_t100: Double;
var mc_t98: Double;
var mc_t96: Double;
var mc_t157: Double;
var mc_t94: Double;
var mc_t95: Double;
var mc_t93: Double;
var mc_t91: Double;
var mc_t87: Double;
	    for (ii = mc_t159 ;
(ii <= n);ii = (ii + 1))
	        {
mc_t158 = 2 ;
var jj: Double;
	        for (jj = mc_t158 ;
(jj <= m);jj = (jj + 1))
	            {
mc_t90 = f(ii as Int, jjas Int) ;
mc_t92 = mask(ii as Int, jjas Int) ;
mc_t153 = 1 ;
mc_t109 = Mix10.minus(ii, mc_t153) ;
mc_t110 = jj ;
mc_t105 = f(mc_t109 as Int, mc_t110as Int) ;
mc_t154 = 1 ;
mc_t107 = Mix10.plus(ii, mc_t154) ;
mc_t108 = jj ;
mc_t106 = f(mc_t107 as Int, mc_t108as Int) ;
mc_t101 = Mix10.plus(mc_t105, mc_t106) ;
mc_t103 = ii ;
mc_t155 = 1 ;
mc_t104 = Mix10.minus(jj, mc_t155) ;
mc_t102 = f(mc_t103 as Int, mc_t104as Int) ;
mc_t97 = Mix10.plus(mc_t101, mc_t102) ;
mc_t99 = ii ;
mc_t156 = 1 ;
mc_t100 = Mix10.plus(jj, mc_t156) ;
mc_t98 = f(mc_t99 as Int, mc_t100as Int) ;
mc_t96 = Mix10.plus(mc_t97, mc_t98) ;
mc_t157 = 0.25 ;
mc_t94 = mtimes(mc_t157, mc_t96) ;
mc_t95 = f(ii as Int, jjas Int) ;
mc_t93 = Mix10.minus(mc_t94, mc_t95) ;
mc_t91 = mtimes(mc_t92, mc_t93) ;
mc_t87 = Mix10.plus(mc_t90, mc_t91) ;
f(ii as Int, jj as Int) = mc_t87 ;
}
}
ii = 1 ;
//% Symmetry on left boundary ii-1 -> ii+1.
var mc_t165: Double = 2;
var jj: Double;
var mc_t111: Double;
var mc_t113: Double;
var mc_t160: Double;
var mc_t130: Double;
var mc_t131: Double;
var mc_t126: Double;
var mc_t161: Double;
var mc_t128: Double;
var mc_t129: Double;
var mc_t127: Double;
var mc_t122: Double;
var mc_t124: Double;
var mc_t162: Double;
var mc_t125: Double;
var mc_t123: Double;
var mc_t118: Double;
var mc_t120: Double;
var mc_t163: Double;
var mc_t121: Double;
var mc_t119: Double;
var mc_t117: Double;
var mc_t164: Double;
var mc_t115: Double;
var mc_t116: Double;
var mc_t114: Double;
var mc_t112: Double;
var mc_t88: Double;
	    for (jj = mc_t165 ;
(jj <= m);jj = (jj + 1))
	        {
mc_t111 = f(ii as Int, jjas Int) ;
mc_t113 = mask(ii as Int, jjas Int) ;
mc_t160 = 1 ;
mc_t130 = Mix10.plus(ii, mc_t160) ;
mc_t131 = jj ;
mc_t126 = f(mc_t130 as Int, mc_t131as Int) ;
mc_t161 = 1 ;
mc_t128 = Mix10.plus(ii, mc_t161) ;
mc_t129 = jj ;
mc_t127 = f(mc_t128 as Int, mc_t129as Int) ;
mc_t122 = Mix10.plus(mc_t126, mc_t127) ;
mc_t124 = ii ;
mc_t162 = 1 ;
mc_t125 = Mix10.minus(jj, mc_t162) ;
mc_t123 = f(mc_t124 as Int, mc_t125as Int) ;
mc_t118 = Mix10.plus(mc_t122, mc_t123) ;
mc_t120 = ii ;
mc_t163 = 1 ;
mc_t121 = Mix10.plus(jj, mc_t163) ;
mc_t119 = f(mc_t120 as Int, mc_t121as Int) ;
mc_t117 = Mix10.plus(mc_t118, mc_t119) ;
mc_t164 = 0.25 ;
mc_t115 = mtimes(mc_t164, mc_t117) ;
mc_t116 = f(ii as Int, jjas Int) ;
mc_t114 = Mix10.minus(mc_t115, mc_t116) ;
mc_t112 = mtimes(mc_t113, mc_t114) ;
mc_t88 = Mix10.plus(mc_t111, mc_t112) ;
f(ii as Int, jj as Int) = mc_t88 ;
}
jj = 1 ;
//% Symmetry on lower boundary jj-1 -> jj+1.
var mc_t171: Double = 2;
var ii: Double;
var mc_t132: Double;
var mc_t134: Double;
var mc_t166: Double;
var mc_t151: Double;
var mc_t152: Double;
var mc_t147: Double;
var mc_t167: Double;
var mc_t149: Double;
var mc_t150: Double;
var mc_t148: Double;
var mc_t143: Double;
var mc_t145: Double;
var mc_t168: Double;
var mc_t146: Double;
var mc_t144: Double;
var mc_t139: Double;
var mc_t141: Double;
var mc_t169: Double;
var mc_t142: Double;
var mc_t140: Double;
var mc_t138: Double;
var mc_t170: Double;
var mc_t136: Double;
var mc_t137: Double;
var mc_t135: Double;
var mc_t133: Double;
var mc_t89: Double;
	    for (ii = mc_t171 ;
(ii <= n);ii = (ii + 1))
	        {
mc_t132 = f(ii as Int, jjas Int) ;
mc_t134 = mask(ii as Int, jjas Int) ;
mc_t166 = 1 ;
mc_t151 = Mix10.minus(ii, mc_t166) ;
mc_t152 = jj ;
mc_t147 = f(mc_t151 as Int, mc_t152as Int) ;
mc_t167 = 1 ;
mc_t149 = Mix10.plus(ii, mc_t167) ;
mc_t150 = jj ;
mc_t148 = f(mc_t149 as Int, mc_t150as Int) ;
mc_t143 = Mix10.plus(mc_t147, mc_t148) ;
mc_t145 = ii ;
mc_t168 = 1 ;
mc_t146 = Mix10.plus(jj, mc_t168) ;
mc_t144 = f(mc_t145 as Int, mc_t146as Int) ;
mc_t139 = Mix10.plus(mc_t143, mc_t144) ;
mc_t141 = ii ;
mc_t169 = 1 ;
mc_t142 = Mix10.plus(jj, mc_t169) ;
mc_t140 = f(mc_t141 as Int, mc_t142as Int) ;
mc_t138 = Mix10.plus(mc_t139, mc_t140) ;
mc_t170 = 0.25 ;
mc_t136 = mtimes(mc_t170, mc_t138) ;
mc_t137 = f(ii as Int, jjas Int) ;
mc_t135 = Mix10.minus(mc_t136, mc_t137) ;
mc_t133 = mtimes(mc_t134, mc_t135) ;
mc_t89 = Mix10.plus(mc_t132, mc_t133) ;
f(ii as Int, jj as Int) = mc_t89 ;
}
	    return f;
}

}	static def capacitor (a: Double, b: Double, c: Double, d: Double, n: Double, tol: Double, rel: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file computes the capacitance
//%	per unit length of a coaxial pair of rectangles.
//%
//%	Invocation:
//%		>> cap = capacitor(a, b, c, d, n, tol, rel)
//%
//%		where
//%
//%		i. a is the width of the inner conductor,
//%
//%		i. b is the height of the inner conductor,
//%
//%		i. c is the width of the outer conductor,
//%
//%		i. d is the height of the outer conductor,
//%
//%		i. n is the number of points along the x-axis,
//%
//%		i. tol is the tolerance,
//%
//%		i. rel is the relaxation parameter,
//%
//%		o. cap is the capacitance per unit length.
//%
//%	Requirements:
//%		None.
//%
//%	Examples:
//%		>> cap = capacitor(1, 2, 2, 3, 50, 1e-9, 1.90)
//%
//%	Source:
//%		Computational Electromagnetics - EEK 170 course at
//%		http://www.elmagn.chalmers.se/courses/CEM/.
//%
//%-----------------------------------------------------------------------
var mc_t42: Double = 0.5;
var mc_t16: Double = mtimes(mc_t42, c);
var mc_t17: Double = n;
var h: Double = mrdivide(mc_t16, mc_t17);
//% Grid size.
var mc_t43: Double = 0.5;
var mc_t19: Double = mtimes(mc_t43, a);
var mc_t20: Double = h;
var mc_t18: Double = mrdivide(mc_t19, mc_t20);
var na: Double = round(mc_t18);
var mc_t44: Double = 0.5;
var mc_t21: Double = mtimes(mc_t44, c);
var mc_t45: Double = 1;
var mc_t22: Double = Mix10.plus(n, mc_t45);
var mc_t46: Double = 0;
var x: Array[Double] = new Array[Double](linspace(mc_t46, mc_t21, mc_t22));
var mc_t47: Double = 0.5;
var mc_t24: Double = mtimes(mc_t47, d);
var mc_t25: Double = h;
var mc_t23: Double = mrdivide(mc_t24, mc_t25);
var m: Double = round(mc_t23);
var mc_t48: Double = 0.5;
var mc_t27: Double = mtimes(mc_t48, b);
var mc_t28: Double = h;
var mc_t26: Double = mrdivide(mc_t27, mc_t28);
var mb: Double = round(mc_t26);
var mc_t49: Double = 0.5;
var mc_t29: Double = mtimes(mc_t49, d);
var mc_t50: Double = 1;
var mc_t30: Double = Mix10.plus(m, mc_t50);
var mc_t51: Double = 0;
var y: Array[Double] = new Array[Double](linspace(mc_t51, mc_t29, mc_t30));
//% Initialize potential and mask array.
var mc_t52: Double = 1;
var mc_t31: Double = Mix10.plus(n, mc_t52);
var mc_t53: Double = 1;
var mc_t32: Double = Mix10.plus(m, mc_t53);
var f: Array[Double] = new Array[Double](zeros(mc_t31, mc_t32));
var mc_t54: Double = 1;
var mc_t35: Double = Mix10.plus(n, mc_t54);
var mc_t55: Double = 1;
var mc_t36: Double = Mix10.plus(m, mc_t55);
var mc_t33: Array[Double] = new Array[Double](ones(mc_t35, mc_t36));
var mc_t34: Double = rel;
var mask: Array[Double] = new Array[Double](mtimes(mc_t33, mc_t34));
var mc_t56: Double = 1;
var mc_t38: Double = Mix10.plus(na, mc_t56);
var mc_t61: Double = 1;
var ii: Double;
var mc_t57: Double;
var mc_t37: Double;
var mc_t60: Double;
var mc_t58: Double;
var mc_t59: Double;
	    for (ii = mc_t61 ;
(ii <= mc_t38);ii = (ii + 1))
	        {
mc_t57 = 1 ;
mc_t37 = Mix10.plus(mb, mc_t57) ;
mc_t60 = 1 ;
var jj: Double;
	        for (jj = mc_t60 ;
(jj <= mc_t37);jj = (jj + 1))
	            {
mc_t58 = 0 ;
mask(ii as Int, jj as Int) = mc_t58 ;
mc_t59 = 1 ;
f(ii as Int, jj as Int) = mc_t59 ;
}
}
var oldcap: Double = 0;
var mc_t63: Double = 1;
var mc_t64: Double = 1000;
var iter: Double;
var cap: Double;
var mc_t41: Double;
var mc_t39: Double;
var mc_t40: Double;
var mc_t14: Double;
var mc_t62: Boolean;
	    for (iter = mc_t63 ;
(iter <= mc_t64);iter = (iter + 1))
	        {
f = seidel(f, mask, n, m, na, mb) ;
cap = gauss(n, m, h, f) ;
mc_t41 = Mix10.minus(cap, oldcap) ;
mc_t39 = abs(mc_t41) ;
mc_t40 = cap ;
mc_t14 = rdivide(mc_t39, mc_t40) ;
mc_t62 = lt(mc_t14, tol) ;
	        if (mc_t62)
	            {
}
else 
	            {
oldcap = cap ;
}
}
	    return cap;
}

}	static def linspace (d1: Double, d2: Double, n: Double)
	    {
//%-----------------------------------------------------------------------
//%LINSPACE Linearly spaced vector.
//%   LINSPACE(x1, x2) generates a row vector of n linearly
//%   equally spaced points between x1 and x2.
//%
//%   See also LOGSPACE, :.
//%
//%   Copyright 1984-2001 The MathWorks, Inc.
//%   $Revision: 5.11 $  $Date: 2001/04/15 12:02:30 $
//%-----------------------------------------------------------------------
var mc_t174: Double = d1;
var mc_t181: Double = 2;
var mc_t180: Double = Mix10.minus(n, mc_t181);
var mc_t182: Double = 0;
var mc_t178: Array[Double] = new Array[Double](colon(mc_t182, mc_t180));
var mc_t179: Double = Mix10.minus(d2, d1);
var mc_t176: Array[Double] = new Array[Double](mtimes(mc_t178, mc_t179));
var mc_t183: Double = 1;
var mc_t177: Double = Mix10.minus(n, mc_t183);
var mc_t175: Array[Double] = new Array[Double](mrdivide(mc_t176, mc_t177));
var mc_t172: Array[Double] = new Array[Double](Mix10.plus(mc_t174, mc_t175));
var mc_t173: Double = d2;
var y: Array[Double] = new Array[Double](horzcat(mc_t172, mc_t173));
	    return y;
}

}	static def gauss (n: Double, m: Double, h: Double, f: Array[Double])
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file computes capacitance from the
//%	potential.
//%
//%	Invocation:
//%		>> cap = gauss(n, m, h, f)
//%
//%		where
//%
//%		i. n is the number of points along the x-axis,
//%
//%		i. m is the number of points along the height of
//%		   the outer conductor,
//%
//%		i. f is the potential array,
//%
//%		i. h is the grid size,
//%
//%		o. cap is the capacitance.
//%
//%	Requirements:
//%		None.
//%
//%	Source:
//%		Computational Electromagnetics - EEK 170 course at
//%		http://www.elmagn.chalmers.se/courses/CEM/.
//%
//%-----------------------------------------------------------------------
var q: Double = 0;
var mc_t81: Double = 1;
var ii: Double;
var mc_t65: Double;
var mc_t68: Double;
var mc_t79: Double;
var mc_t70: Double;
var mc_t71: Double;
var mc_t69: Double;
var mc_t67: Double;
var mc_t80: Double;
var mc_t66: Double;
	    for (ii = mc_t81 ;
(ii <= n);ii = (ii + 1))
	        {
mc_t65 = q ;
mc_t68 = f(ii as Int, mas Int) ;
mc_t79 = 1 ;
mc_t70 = Mix10.plus(ii, mc_t79) ;
mc_t71 = m ;
mc_t69 = f(mc_t70 as Int, mc_t71as Int) ;
mc_t67 = Mix10.plus(mc_t68, mc_t69) ;
mc_t80 = 0.5 ;
mc_t66 = mtimes(mc_t67, mc_t80) ;
q = Mix10.plus(mc_t65, mc_t66) ;
}
var mc_t84: Double = 1;
var jj: Double;
var mc_t72: Double;
var mc_t75: Double;
var mc_t77: Double;
var mc_t82: Double;
var mc_t78: Double;
var mc_t76: Double;
var mc_t74: Double;
var mc_t83: Double;
var mc_t73: Double;
	    for (jj = mc_t84 ;
(jj <= m);jj = (jj + 1))
	        {
mc_t72 = q ;
mc_t75 = f(n as Int, jjas Int) ;
mc_t77 = n ;
mc_t82 = 1 ;
mc_t78 = Mix10.plus(jj, mc_t82) ;
mc_t76 = f(mc_t77 as Int, mc_t78as Int) ;
mc_t74 = Mix10.plus(mc_t75, mc_t76) ;
mc_t83 = 0.5 ;
mc_t73 = mtimes(mc_t74, mc_t83) ;
q = Mix10.plus(mc_t72, mc_t73) ;
}
var mc_t85: Double = 4;
var cap: Double = mtimes(q, mc_t85);
//% Four quadrants.
var mc_t86: Double = 8.854187;
cap = mtimes(cap, mc_t86) ;
	    return cap;
}

}