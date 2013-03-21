class testclass{
	static def drv_adpt (scale: Double)
	    {
//%
//% Driver for adaptive quadrature using Simpson's rule.
//%
//%t1 = clock;
var mc_t0: Double = 1;
var a: Double = uminus(mc_t0);
var b: Double = 6;
var sz_guess: Double = 1;
//%tol = 4e-13;
var tol: Double = 1;
var mc_t1: Double = 1;
var i: Double;
val SRmat: Array[Double];
var quad: Double;
var err: Double;
val _SRmat_quad_err: Array[Any];
	    for (i = mc_t1 ;
(i <= scale);i = (i + 1))
	        {
_SRmat_quad_err = adapt(a, b, sz_guess, tol) ;
SRmat = _SRmat_quad_err(0 as Int)as Array[Double] ;
quad = _SRmat_quad_err(1 as Int)as Double ;
err = _SRmat_quad_err(2 as Int)as Double ;
}
//%t2 = clock;
//% Compute the running time in seconds
//%time = (t2-t1)*[0, 0, 86400, 3600, 60, 1]';
var time: Double = 4;
//% Store the benchmark output
//%output = {mean(SRmat(:)), mean(quad(:)), mean(err(:))};
val output: Array[Double];
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(0);
output = new Array[Double](((SRmat.region.min(0))..SRmat.region.max(0))), p:point(1)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
//% No validation performed
val valid: Array[String] = new Array[String]('N/A');
	    return [time,output,valid];
}

}	static def adapt (a: Double, b: Double, sz_guess: Double, tol: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file finds the adaptive quadrature using
//%	Simpson's rule.
//%
//%	This MATLAB program is intended as a pedagogical example.
//%
//%	Invocation:
//%		>> [SRmat, quad, err] = adapt(a, b, sz_guess, tol)
//%
//%		where
//%
//%		i. a is the left endpoint of [a, b],
//%
//%		i. b is the right endpoint of [a, b],
//%
//%		i. sz_guess is the number of rows in SRmat,
//%
//%		i. tol is the convergence tolerance,
//%
//%		o. SRmat is the matrix of adaptive Simpson
//%		   quadrature values,
//%
//%		o. quad is the adaptive Simpson quadrature,
//%
//%		o. err is the error estimate.
//%
//%	Requirements:
//%		a <= b.
//%
//%	Examples:
//%		>> [SRmat, quad, err] = adapt(-1, 6, 1, 1.0000e-12)
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
var mc_t134: Double = 6;
val SRmat: Array[Double] = new Array[Double](zeros(sz_guess, mc_t134));
var iterating: Double = 0;
var done: Double = 1;
var mc_t7: Double = Mix10.minus(b, a);
var mc_t135: Double = 2;
var h: Double = mrdivide(mc_t7, mc_t135);
//% The step size.
var mc_t8: Double = Mix10.plus(a, b);
var mc_t136: Double = 2;
var c: Double = mrdivide(mc_t8, mc_t136);
//% The midpoint in the interval.
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
var mc_t16: Double = a;
var mc_t137: Double = 2;
var mc_t17: Double = power(a, mc_t137);
var mc_t15: Double = Mix10.minus(mc_t16, mc_t17);
var mc_t138: Double = 13;
var mc_t9: Double = times(mc_t138, mc_t15);
var mc_t139: Double = 3;
var mc_t13: Double = uminus(mc_t139);
var mc_t14: Double = a;
var mc_t12: Double = times(mc_t13, mc_t14);
var mc_t140: Double = 2;
var mc_t11: Double = rdivide(mc_t12, mc_t140);
var mc_t10: Double = exp(mc_t11);
var Fa: Double = times(mc_t9, mc_t10);
var mc_t25: Double = c;
var mc_t141: Double = 2;
var mc_t26: Double = power(c, mc_t141);
var mc_t24: Double = Mix10.minus(mc_t25, mc_t26);
var mc_t142: Double = 13;
var mc_t18: Double = times(mc_t142, mc_t24);
var mc_t143: Double = 3;
var mc_t22: Double = uminus(mc_t143);
var mc_t23: Double = c;
var mc_t21: Double = times(mc_t22, mc_t23);
var mc_t144: Double = 2;
var mc_t20: Double = rdivide(mc_t21, mc_t144);
var mc_t19: Double = exp(mc_t20);
var Fc: Double = times(mc_t18, mc_t19);
var mc_t34: Double = b;
var mc_t145: Double = 2;
var mc_t35: Double = power(b, mc_t145);
var mc_t33: Double = Mix10.minus(mc_t34, mc_t35);
var mc_t146: Double = 13;
var mc_t27: Double = times(mc_t146, mc_t33);
var mc_t147: Double = 3;
var mc_t31: Double = uminus(mc_t147);
var mc_t32: Double = b;
var mc_t30: Double = times(mc_t31, mc_t32);
var mc_t148: Double = 2;
var mc_t29: Double = rdivide(mc_t30, mc_t148);
var mc_t28: Double = exp(mc_t29);
var Fb: Double = times(mc_t27, mc_t28);
var mc_t37: Double = h;
var mc_t41: Double = Fa;
var mc_t149: Double = 4;
var mc_t42: Double = mtimes(mc_t149, Fc);
var mc_t39: Double = Mix10.plus(mc_t41, mc_t42);
var mc_t40: Double = Fb;
var mc_t38: Double = Mix10.plus(mc_t39, mc_t40);
var mc_t36: Double = mtimes(mc_t37, mc_t38);
var mc_t150: Double = 3;
var S: Double = mrdivide(mc_t36, mc_t150);
//% Simpson's rule.
val SRvec: Array[Double] = new Array[Double](horzcat(a, b, S, S, tol, tol));
var mc_t152: Double = 1;
var mc_t153: Double = 6;
val mc_t4: Array[Double] = new Array[Double](colon(mc_t152, mc_t153));
var mc_t154: Double = 1;
SRmat(mc_t154 as Int, mc_t4 as Int) = SRvec ;
var m: Double = 1;
var state: Double = iterating;
var mc_t213: Boolean = eq(state, iterating);
var n: Double;
var mc_t127: Double;
var mc_t155: Double;
var mc_t128: Double;
var mc_t212: Double;
var p: Double;
val SR0vec: Array[Double];
val mix10_pt_SRmat: Point;
var mc_t156: Double;
var err: Double;
var mc_t157: Double;
var mc_t211: Boolean;
val SR1vec: Array[Double];
val SR2vec: Array[Double];
var mc_t158: Double;
var mc_t159: Double;
var mc_t43: Double;
var mc_t160: Double;
var mc_t161: Double;
var mc_t162: Double;
var mc_t163: Double;
var tol2: Double;
var a0: Double;
var b0: Double;
var tol0: Double;
var mc_t44: Double;
var mc_t164: Double;
var mc_t45: Double;
var mc_t165: Double;
var c0: Double;
var mc_t53: Double;
var mc_t166: Double;
var mc_t54: Double;
var mc_t52: Double;
var mc_t167: Double;
var mc_t46: Double;
var mc_t168: Double;
var mc_t50: Double;
var mc_t51: Double;
var mc_t49: Double;
var mc_t169: Double;
var mc_t48: Double;
var mc_t47: Double;
var mc_t62: Double;
var mc_t170: Double;
var mc_t63: Double;
var mc_t61: Double;
var mc_t171: Double;
var mc_t55: Double;
var mc_t172: Double;
var mc_t59: Double;
var mc_t60: Double;
var mc_t58: Double;
var mc_t173: Double;
var mc_t57: Double;
var mc_t56: Double;
var mc_t71: Double;
var mc_t174: Double;
var mc_t72: Double;
var mc_t70: Double;
var mc_t175: Double;
var mc_t64: Double;
var mc_t176: Double;
var mc_t68: Double;
var mc_t69: Double;
var mc_t67: Double;
var mc_t177: Double;
var mc_t66: Double;
var mc_t65: Double;
var mc_t74: Double;
var mc_t78: Double;
var mc_t178: Double;
var mc_t79: Double;
var mc_t76: Double;
var mc_t77: Double;
var mc_t75: Double;
var mc_t73: Double;
var mc_t179: Double;
var mc_t80: Double;
var mc_t181: Double;
var mc_t81: Double;
var mc_t182: Double;
var mc_t89: Double;
var mc_t183: Double;
var mc_t90: Double;
var mc_t88: Double;
var mc_t184: Double;
var mc_t82: Double;
var mc_t185: Double;
var mc_t86: Double;
var mc_t87: Double;
var mc_t85: Double;
var mc_t186: Double;
var mc_t84: Double;
var mc_t83: Double;
var mc_t98: Double;
var mc_t187: Double;
var mc_t99: Double;
var mc_t97: Double;
var mc_t188: Double;
var mc_t91: Double;
var mc_t189: Double;
var mc_t95: Double;
var mc_t96: Double;
var mc_t94: Double;
var mc_t190: Double;
var mc_t93: Double;
var mc_t92: Double;
var mc_t107: Double;
var mc_t191: Double;
var mc_t108: Double;
var mc_t106: Double;
var mc_t192: Double;
var mc_t100: Double;
var mc_t193: Double;
var mc_t104: Double;
var mc_t105: Double;
var mc_t103: Double;
var mc_t194: Double;
var mc_t102: Double;
var mc_t101: Double;
var mc_t110: Double;
var mc_t114: Double;
var mc_t195: Double;
var mc_t115: Double;
var mc_t112: Double;
var mc_t113: Double;
var mc_t111: Double;
var mc_t109: Double;
var mc_t196: Double;
var mc_t198: Double;
var mc_t120: Double;
var mc_t199: Double;
var mc_t121: Double;
var mc_t118: Double;
var mc_t200: Double;
var mc_t119: Double;
var mc_t117: Double;
var mc_t116: Double;
var mc_t201: Double;
var mc_t210: Boolean;
var mc_t202: Double;
var mc_t122: Double;
var mc_t203: Double;
var mc_t123: Double;
var mc_t2: Double;
var mc_t204: Double;
var mc_t205: Double;
val mc_t124: Array[Double];
val mc_t3: Array[Double];
val mix10_pt_SRmat: Point;
var mc_t206: Double;
var mc_t125: Double;
var mc_t207: Double;
var mc_t126: Double;
val mc_t5: Array[Double];
var mc_t208: Double;
var mc_t209: Double;
var mc_t6: Double;
	    while (mc_t213)
	       {
n = m ;
mc_t127 = n ;
mc_t155 = 1 ;
mc_t128 = uminus(mc_t155) ;
mc_t212 = 1 ;
var l: Double;
	       for (l = mc_t127 ;
(l <= mc_t212);l = (l + 1))
	           {
p = l ;
	           mix10_pt_SRmat = Point.make(1-(p as Int), 0);
SR0vec = new Array[Double]((1..1)*((SRmat.region.min(1))..SRmat.region.max(1))), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
mc_t156 = 5 ;
err = SR0vec(mc_t156 as Int) ;
mc_t157 = 6 ;
tol = SR0vec(mc_t157 as Int) ;
mc_t211 = le(tol, err) ;
	           if (mc_t211)
	               {
state = done ;
SR1vec = SR0vec ;
SR2vec = SR0vec ;
mc_t158 = 1 ;
a = SR0vec(mc_t158 as Int) ;
//% Left endpoint.
mc_t159 = 2 ;
b = SR0vec(mc_t159 as Int) ;
//% Right endpoint.
mc_t43 = Mix10.plus(a, b) ;
mc_t160 = 2 ;
c = mrdivide(mc_t43, mc_t160) ;
//% Midpoint.
mc_t161 = 5 ;
err = SR0vec(mc_t161 as Int) ;
mc_t162 = 6 ;
tol = SR0vec(mc_t162 as Int) ;
mc_t163 = 2 ;
tol2 = mrdivide(tol, mc_t163) ;
a0 = a ;
b0 = c ;
tol0 = tol2 ;
mc_t44 = Mix10.minus(b0, a0) ;
mc_t164 = 2 ;
h = mrdivide(mc_t44, mc_t164) ;
mc_t45 = Mix10.plus(a0, b0) ;
mc_t165 = 2 ;
c0 = mrdivide(mc_t45, mc_t165) ;
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
mc_t53 = a0 ;
mc_t166 = 2 ;
mc_t54 = power(a0, mc_t166) ;
mc_t52 = Mix10.minus(mc_t53, mc_t54) ;
mc_t167 = 13 ;
mc_t46 = times(mc_t167, mc_t52) ;
mc_t168 = 3 ;
mc_t50 = uminus(mc_t168) ;
mc_t51 = a0 ;
mc_t49 = times(mc_t50, mc_t51) ;
mc_t169 = 2 ;
mc_t48 = rdivide(mc_t49, mc_t169) ;
mc_t47 = exp(mc_t48) ;
Fa = times(mc_t46, mc_t47) ;
mc_t62 = c0 ;
mc_t170 = 2 ;
mc_t63 = power(c0, mc_t170) ;
mc_t61 = Mix10.minus(mc_t62, mc_t63) ;
mc_t171 = 13 ;
mc_t55 = times(mc_t171, mc_t61) ;
mc_t172 = 3 ;
mc_t59 = uminus(mc_t172) ;
mc_t60 = c0 ;
mc_t58 = times(mc_t59, mc_t60) ;
mc_t173 = 2 ;
mc_t57 = rdivide(mc_t58, mc_t173) ;
mc_t56 = exp(mc_t57) ;
Fc = times(mc_t55, mc_t56) ;
mc_t71 = b0 ;
mc_t174 = 2 ;
mc_t72 = power(b0, mc_t174) ;
mc_t70 = Mix10.minus(mc_t71, mc_t72) ;
mc_t175 = 13 ;
mc_t64 = times(mc_t175, mc_t70) ;
mc_t176 = 3 ;
mc_t68 = uminus(mc_t176) ;
mc_t69 = b0 ;
mc_t67 = times(mc_t68, mc_t69) ;
mc_t177 = 2 ;
mc_t66 = rdivide(mc_t67, mc_t177) ;
mc_t65 = exp(mc_t66) ;
Fb = times(mc_t64, mc_t65) ;
mc_t74 = h ;
mc_t78 = Fa ;
mc_t178 = 4 ;
mc_t79 = mtimes(mc_t178, Fc) ;
mc_t76 = Mix10.plus(mc_t78, mc_t79) ;
mc_t77 = Fb ;
mc_t75 = Mix10.plus(mc_t76, mc_t77) ;
mc_t73 = mtimes(mc_t74, mc_t75) ;
mc_t179 = 3 ;
S = mrdivide(mc_t73, mc_t179) ;
//% Simpson's rule.
SR1vec = horzcat(a0, b0, S, S, tol0, tol0) ;
a0 = c ;
b0 = b ;
tol0 = tol2 ;
mc_t80 = Mix10.minus(b0, a0) ;
mc_t181 = 2 ;
h = mrdivide(mc_t80, mc_t181) ;
mc_t81 = Mix10.plus(a0, b0) ;
mc_t182 = 2 ;
c0 = mrdivide(mc_t81, mc_t182) ;
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
mc_t89 = a0 ;
mc_t183 = 2 ;
mc_t90 = power(a0, mc_t183) ;
mc_t88 = Mix10.minus(mc_t89, mc_t90) ;
mc_t184 = 13 ;
mc_t82 = times(mc_t184, mc_t88) ;
mc_t185 = 3 ;
mc_t86 = uminus(mc_t185) ;
mc_t87 = a0 ;
mc_t85 = times(mc_t86, mc_t87) ;
mc_t186 = 2 ;
mc_t84 = rdivide(mc_t85, mc_t186) ;
mc_t83 = exp(mc_t84) ;
Fa = times(mc_t82, mc_t83) ;
mc_t98 = c0 ;
mc_t187 = 2 ;
mc_t99 = power(c0, mc_t187) ;
mc_t97 = Mix10.minus(mc_t98, mc_t99) ;
mc_t188 = 13 ;
mc_t91 = times(mc_t188, mc_t97) ;
mc_t189 = 3 ;
mc_t95 = uminus(mc_t189) ;
mc_t96 = c0 ;
mc_t94 = times(mc_t95, mc_t96) ;
mc_t190 = 2 ;
mc_t93 = rdivide(mc_t94, mc_t190) ;
mc_t92 = exp(mc_t93) ;
Fc = times(mc_t91, mc_t92) ;
mc_t107 = b0 ;
mc_t191 = 2 ;
mc_t108 = power(b0, mc_t191) ;
mc_t106 = Mix10.minus(mc_t107, mc_t108) ;
mc_t192 = 13 ;
mc_t100 = times(mc_t192, mc_t106) ;
mc_t193 = 3 ;
mc_t104 = uminus(mc_t193) ;
mc_t105 = b0 ;
mc_t103 = times(mc_t104, mc_t105) ;
mc_t194 = 2 ;
mc_t102 = rdivide(mc_t103, mc_t194) ;
mc_t101 = exp(mc_t102) ;
Fb = times(mc_t100, mc_t101) ;
mc_t110 = h ;
mc_t114 = Fa ;
mc_t195 = 4 ;
mc_t115 = mtimes(mc_t195, Fc) ;
mc_t112 = Mix10.plus(mc_t114, mc_t115) ;
mc_t113 = Fb ;
mc_t111 = Mix10.plus(mc_t112, mc_t113) ;
mc_t109 = mtimes(mc_t110, mc_t111) ;
mc_t196 = 3 ;
S = mrdivide(mc_t109, mc_t196) ;
//% Simpson's rule.
SR2vec = horzcat(a0, b0, S, S, tol0, tol0) ;
mc_t198 = 3 ;
mc_t120 = SR0vec(mc_t198 as Int) ;
mc_t199 = 3 ;
mc_t121 = SR1vec(mc_t199 as Int) ;
mc_t118 = Mix10.minus(mc_t120, mc_t121) ;
mc_t200 = 3 ;
mc_t119 = SR2vec(mc_t200 as Int) ;
mc_t117 = Mix10.minus(mc_t118, mc_t119) ;
mc_t116 = abs(mc_t117) ;
mc_t201 = 10 ;
err = mrdivide(mc_t116, mc_t201) ;
mc_t210 = lt(err, tol) ;
	               if (mc_t210)
	                   {
	                   SRmat(p.operator+(Point.make((p-1) as Int, (SR0vec.region.min(1)-1) as Int)))= SR0vec(p);
mc_t202 = 3 ;
mc_t122 = SR1vec(mc_t202 as Int) ;
mc_t203 = 3 ;
mc_t123 = SR2vec(mc_t203 as Int) ;
mc_t2 = Mix10.plus(mc_t122, mc_t123) ;
mc_t204 = 4 ;
SRmat(p as Int, mc_t204 as Int) = mc_t2 ;
mc_t205 = 5 ;
SRmat(p as Int, mc_t205 as Int) = err ;
}
else 
	                   {
mc_t124 = colon(p, m) ;
	                   mix10_pt_SRmat = Point.make(1-((mc_t124.region.min(0)) as Int), 0);
mc_t3 = new Array[Double](((mc_t124.region.min(0)) as Int..(mc_t124.region.max(0)) as Int)*((SRmat.region.min(1))..SRmat.region.max(1))), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
mc_t206 = 1 ;
mc_t125 = Mix10.plus(p, mc_t206) ;
mc_t207 = 1 ;
mc_t126 = Mix10.plus(m, mc_t207) ;
mc_t5 = colon(mc_t125, mc_t126) ;
	                   SRmat(p.operator+(Point.make((mc_t5(mc_t5.region.min(0)) -1) as Int, (mc_t3.region.min(1)-1) as Int)))= mc_t3(p);
mc_t208 = 1 ;
m = Mix10.plus(m, mc_t208) ;
	                   SRmat(p.operator+(Point.make((p-1) as Int, (SR1vec.region.min(1)-1) as Int)))= SR1vec(p);
mc_t209 = 1 ;
mc_t6 = Mix10.plus(p, mc_t209) ;
	                   SRmat(p.operator+(Point.make((mc_t6-1) as Int, (SR2vec.region.min(1)-1) as Int)))= SR2vec(p);
state = iterating ;
}
}
else 
	               {
}
}
mc_t213 = eq(state, iterating) ;
}
var mc_t214: Double = 4;
val mc_t129: Array[Double];
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(0, 1-(mc_t214 as Int));
mc_t129 = new Array[Double](((SRmat.region.min(0))..SRmat.region.max(0)))*(1..1), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
var quad: Double = sum(mc_t129);
var mc_t215: Double = 5;
val mc_t131: Array[Double];
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(0, 1-(mc_t215 as Int));
mc_t131 = new Array[Double](((SRmat.region.min(0))..SRmat.region.max(0)))*(1..1), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
val mc_t130: Array[Double] = new Array[Double](abs(mc_t131));
err = sum(mc_t130) ;
var mc_t216: Double = 1;
val mc_t132: Array[Double] = new Array[Double](colon(mc_t216, m));
var mc_t217: Double = 1;
var mc_t218: Double = 6;
val mc_t133: Array[Double] = new Array[Double](colon(mc_t217, mc_t218));
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(1-((mc_t132.region.min(0)) as Int), 1-((mc_t133.region.min(0)) as Int));
SRmat = new Array[Double](((mc_t132.region.min(0)) as Int..(mc_t132.region.max(0)) as Int)*((mc_t133.region.min(0)) as Int..(mc_t133.region.max(0)) as Int), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
	    return [SRmat,quad,err];
}

}