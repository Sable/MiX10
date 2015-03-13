class testclass{
	static def main (a: Double)
	    {
//%drv_adpt(5);
//%ranges(5);
var mc_t0: Double = 1;
var mc_t1: Double = 10;
var mc_t2: Double = 5;
var mc_t3: Double = 1;
val x: Array[Double] = new Array[Double](adapt(mc_t0, mc_t1, mc_t2, mc_t3));
var mc_t4: Double = 2;
var mc_t5: Double = 3;
val y: Array[Double] = new Array[Double](ones(mc_t4, mc_t5));
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
var mc_t138: Double = 6;
val SRmat: Array[Double] = new Array[Double](zeros(sz_guess, mc_t138));
var iterating: Double = 0;
var done: Double = 1;
var mc_t11: Double = Mix10.minus(b, a);
var mc_t139: Double = 2;
var h: Double = mrdivide(mc_t11, mc_t139);
//% The step size.
var mc_t12: Double = Mix10.plus(a, b);
var mc_t140: Double = 2;
var c: Double = mrdivide(mc_t12, mc_t140);
//% The midpoint in the interval.
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
var mc_t20: Double = a;
var mc_t141: Double = 2;
var mc_t21: Double = power(a, mc_t141);
var mc_t19: Double = Mix10.minus(mc_t20, mc_t21);
var mc_t142: Double = 13;
var mc_t13: Double = times(mc_t142, mc_t19);
var mc_t143: Double = 3;
var mc_t17: Double = uminus(mc_t143);
var mc_t18: Double = a;
var mc_t16: Double = times(mc_t17, mc_t18);
var mc_t144: Double = 2;
var mc_t15: Double = rdivide(mc_t16, mc_t144);
var mc_t14: Double = exp(mc_t15);
var Fa: Double = times(mc_t13, mc_t14);
var mc_t29: Double = c;
var mc_t145: Double = 2;
var mc_t30: Double = power(c, mc_t145);
var mc_t28: Double = Mix10.minus(mc_t29, mc_t30);
var mc_t146: Double = 13;
var mc_t22: Double = times(mc_t146, mc_t28);
var mc_t147: Double = 3;
var mc_t26: Double = uminus(mc_t147);
var mc_t27: Double = c;
var mc_t25: Double = times(mc_t26, mc_t27);
var mc_t148: Double = 2;
var mc_t24: Double = rdivide(mc_t25, mc_t148);
var mc_t23: Double = exp(mc_t24);
var Fc: Double = times(mc_t22, mc_t23);
var mc_t38: Double = b;
var mc_t149: Double = 2;
var mc_t39: Double = power(b, mc_t149);
var mc_t37: Double = Mix10.minus(mc_t38, mc_t39);
var mc_t150: Double = 13;
var mc_t31: Double = times(mc_t150, mc_t37);
var mc_t151: Double = 3;
var mc_t35: Double = uminus(mc_t151);
var mc_t36: Double = b;
var mc_t34: Double = times(mc_t35, mc_t36);
var mc_t152: Double = 2;
var mc_t33: Double = rdivide(mc_t34, mc_t152);
var mc_t32: Double = exp(mc_t33);
var Fb: Double = times(mc_t31, mc_t32);
var mc_t41: Double = h;
var mc_t45: Double = Fa;
var mc_t153: Double = 4;
var mc_t46: Double = mtimes(mc_t153, Fc);
var mc_t43: Double = Mix10.plus(mc_t45, mc_t46);
var mc_t44: Double = Fb;
var mc_t42: Double = Mix10.plus(mc_t43, mc_t44);
var mc_t40: Double = mtimes(mc_t41, mc_t42);
var mc_t154: Double = 3;
var S: Double = mrdivide(mc_t40, mc_t154);
//% Simpson's rule.
val SRvec: Array[Double] = new Array[Double](horzcat(a, b, S, S, tol, tol));
var mc_t156: Double = 1;
var mc_t157: Double = 6;
val mc_t8: Array[Double] = new Array[Double](colon(mc_t156, mc_t157));
var mc_t158: Double = 1;
SRmat(mc_t158 as Int, mc_t8 as Int) = SRvec ;
var m: Double = 1;
var state: Double = iterating;
var mc_t217: Boolean = eq(state, iterating);
var n: Double;
var mc_t131: Double;
var mc_t159: Double;
var mc_t132: Double;
var mc_t216: Double;
var p: Double;
val SR0vec: Array[Double];
val mix10_pt_SRmat: Point;
var mc_t160: Double;
var err: Double;
var mc_t161: Double;
var mc_t215: Boolean;
val SR1vec: Array[Double];
val SR2vec: Array[Double];
var mc_t162: Double;
var mc_t163: Double;
var mc_t47: Double;
var mc_t164: Double;
var mc_t165: Double;
var mc_t166: Double;
var mc_t167: Double;
var tol2: Double;
var a0: Double;
var b0: Double;
var tol0: Double;
var mc_t48: Double;
var mc_t168: Double;
var mc_t49: Double;
var mc_t169: Double;
var c0: Double;
var mc_t57: Double;
var mc_t170: Double;
var mc_t58: Double;
var mc_t56: Double;
var mc_t171: Double;
var mc_t50: Double;
var mc_t172: Double;
var mc_t54: Double;
var mc_t55: Double;
var mc_t53: Double;
var mc_t173: Double;
var mc_t52: Double;
var mc_t51: Double;
var mc_t66: Double;
var mc_t174: Double;
var mc_t67: Double;
var mc_t65: Double;
var mc_t175: Double;
var mc_t59: Double;
var mc_t176: Double;
var mc_t63: Double;
var mc_t64: Double;
var mc_t62: Double;
var mc_t177: Double;
var mc_t61: Double;
var mc_t60: Double;
var mc_t75: Double;
var mc_t178: Double;
var mc_t76: Double;
var mc_t74: Double;
var mc_t179: Double;
var mc_t68: Double;
var mc_t180: Double;
var mc_t72: Double;
var mc_t73: Double;
var mc_t71: Double;
var mc_t181: Double;
var mc_t70: Double;
var mc_t69: Double;
var mc_t78: Double;
var mc_t82: Double;
var mc_t182: Double;
var mc_t83: Double;
var mc_t80: Double;
var mc_t81: Double;
var mc_t79: Double;
var mc_t77: Double;
var mc_t183: Double;
var mc_t84: Double;
var mc_t185: Double;
var mc_t85: Double;
var mc_t186: Double;
var mc_t93: Double;
var mc_t187: Double;
var mc_t94: Double;
var mc_t92: Double;
var mc_t188: Double;
var mc_t86: Double;
var mc_t189: Double;
var mc_t90: Double;
var mc_t91: Double;
var mc_t89: Double;
var mc_t190: Double;
var mc_t88: Double;
var mc_t87: Double;
var mc_t102: Double;
var mc_t191: Double;
var mc_t103: Double;
var mc_t101: Double;
var mc_t192: Double;
var mc_t95: Double;
var mc_t193: Double;
var mc_t99: Double;
var mc_t100: Double;
var mc_t98: Double;
var mc_t194: Double;
var mc_t97: Double;
var mc_t96: Double;
var mc_t111: Double;
var mc_t195: Double;
var mc_t112: Double;
var mc_t110: Double;
var mc_t196: Double;
var mc_t104: Double;
var mc_t197: Double;
var mc_t108: Double;
var mc_t109: Double;
var mc_t107: Double;
var mc_t198: Double;
var mc_t106: Double;
var mc_t105: Double;
var mc_t114: Double;
var mc_t118: Double;
var mc_t199: Double;
var mc_t119: Double;
var mc_t116: Double;
var mc_t117: Double;
var mc_t115: Double;
var mc_t113: Double;
var mc_t200: Double;
var mc_t202: Double;
var mc_t124: Double;
var mc_t203: Double;
var mc_t125: Double;
var mc_t122: Double;
var mc_t204: Double;
var mc_t123: Double;
var mc_t121: Double;
var mc_t120: Double;
var mc_t205: Double;
var mc_t214: Boolean;
var mc_t206: Double;
var mc_t126: Double;
var mc_t207: Double;
var mc_t127: Double;
var mc_t6: Double;
var mc_t208: Double;
var mc_t209: Double;
val mc_t128: Array[Double];
val mc_t7: Array[Double];
val mix10_pt_SRmat: Point;
var mc_t210: Double;
var mc_t129: Double;
var mc_t211: Double;
var mc_t130: Double;
val mc_t9: Array[Double];
var mc_t212: Double;
var mc_t213: Double;
var mc_t10: Double;
	    while (mc_t217)
	       {
n = m ;
mc_t131 = n ;
mc_t159 = 1 ;
mc_t132 = uminus(mc_t159) ;
mc_t216 = 1 ;
var l: Double;
	       for (l = mc_t131 ;
(l <= mc_t216);l = (l + 1))
	           {
p = l ;
	           mix10_pt_SRmat = Point.make(1-(p as Int), 0);
SR0vec = new Array[Double]((1..1)*((SRmat.region.min(1))..SRmat.region.max(1))), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
mc_t160 = 5 ;
err = SR0vec(mc_t160 as Int) ;
mc_t161 = 6 ;
tol = SR0vec(mc_t161 as Int) ;
mc_t215 = le(tol, err) ;
	           if (mc_t215)
	               {
state = done ;
SR1vec = SR0vec ;
SR2vec = SR0vec ;
mc_t162 = 1 ;
a = SR0vec(mc_t162 as Int) ;
//% Left endpoint.
mc_t163 = 2 ;
b = SR0vec(mc_t163 as Int) ;
//% Right endpoint.
mc_t47 = Mix10.plus(a, b) ;
mc_t164 = 2 ;
c = mrdivide(mc_t47, mc_t164) ;
//% Midpoint.
mc_t165 = 5 ;
err = SR0vec(mc_t165 as Int) ;
mc_t166 = 6 ;
tol = SR0vec(mc_t166 as Int) ;
mc_t167 = 2 ;
tol2 = mrdivide(tol, mc_t167) ;
a0 = a ;
b0 = c ;
tol0 = tol2 ;
mc_t48 = Mix10.minus(b0, a0) ;
mc_t168 = 2 ;
h = mrdivide(mc_t48, mc_t168) ;
mc_t49 = Mix10.plus(a0, b0) ;
mc_t169 = 2 ;
c0 = mrdivide(mc_t49, mc_t169) ;
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
mc_t57 = a0 ;
mc_t170 = 2 ;
mc_t58 = power(a0, mc_t170) ;
mc_t56 = Mix10.minus(mc_t57, mc_t58) ;
mc_t171 = 13 ;
mc_t50 = times(mc_t171, mc_t56) ;
mc_t172 = 3 ;
mc_t54 = uminus(mc_t172) ;
mc_t55 = a0 ;
mc_t53 = times(mc_t54, mc_t55) ;
mc_t173 = 2 ;
mc_t52 = rdivide(mc_t53, mc_t173) ;
mc_t51 = exp(mc_t52) ;
Fa = times(mc_t50, mc_t51) ;
mc_t66 = c0 ;
mc_t174 = 2 ;
mc_t67 = power(c0, mc_t174) ;
mc_t65 = Mix10.minus(mc_t66, mc_t67) ;
mc_t175 = 13 ;
mc_t59 = times(mc_t175, mc_t65) ;
mc_t176 = 3 ;
mc_t63 = uminus(mc_t176) ;
mc_t64 = c0 ;
mc_t62 = times(mc_t63, mc_t64) ;
mc_t177 = 2 ;
mc_t61 = rdivide(mc_t62, mc_t177) ;
mc_t60 = exp(mc_t61) ;
Fc = times(mc_t59, mc_t60) ;
mc_t75 = b0 ;
mc_t178 = 2 ;
mc_t76 = power(b0, mc_t178) ;
mc_t74 = Mix10.minus(mc_t75, mc_t76) ;
mc_t179 = 13 ;
mc_t68 = times(mc_t179, mc_t74) ;
mc_t180 = 3 ;
mc_t72 = uminus(mc_t180) ;
mc_t73 = b0 ;
mc_t71 = times(mc_t72, mc_t73) ;
mc_t181 = 2 ;
mc_t70 = rdivide(mc_t71, mc_t181) ;
mc_t69 = exp(mc_t70) ;
Fb = times(mc_t68, mc_t69) ;
mc_t78 = h ;
mc_t82 = Fa ;
mc_t182 = 4 ;
mc_t83 = mtimes(mc_t182, Fc) ;
mc_t80 = Mix10.plus(mc_t82, mc_t83) ;
mc_t81 = Fb ;
mc_t79 = Mix10.plus(mc_t80, mc_t81) ;
mc_t77 = mtimes(mc_t78, mc_t79) ;
mc_t183 = 3 ;
S = mrdivide(mc_t77, mc_t183) ;
//% Simpson's rule.
SR1vec = horzcat(a0, b0, S, S, tol0, tol0) ;
a0 = c ;
b0 = b ;
tol0 = tol2 ;
mc_t84 = Mix10.minus(b0, a0) ;
mc_t185 = 2 ;
h = mrdivide(mc_t84, mc_t185) ;
mc_t85 = Mix10.plus(a0, b0) ;
mc_t186 = 2 ;
c0 = mrdivide(mc_t85, mc_t186) ;
//% The integrand is f(x) = 13.*(x-x.^2).*exp(-3.*x./2).
mc_t93 = a0 ;
mc_t187 = 2 ;
mc_t94 = power(a0, mc_t187) ;
mc_t92 = Mix10.minus(mc_t93, mc_t94) ;
mc_t188 = 13 ;
mc_t86 = times(mc_t188, mc_t92) ;
mc_t189 = 3 ;
mc_t90 = uminus(mc_t189) ;
mc_t91 = a0 ;
mc_t89 = times(mc_t90, mc_t91) ;
mc_t190 = 2 ;
mc_t88 = rdivide(mc_t89, mc_t190) ;
mc_t87 = exp(mc_t88) ;
Fa = times(mc_t86, mc_t87) ;
mc_t102 = c0 ;
mc_t191 = 2 ;
mc_t103 = power(c0, mc_t191) ;
mc_t101 = Mix10.minus(mc_t102, mc_t103) ;
mc_t192 = 13 ;
mc_t95 = times(mc_t192, mc_t101) ;
mc_t193 = 3 ;
mc_t99 = uminus(mc_t193) ;
mc_t100 = c0 ;
mc_t98 = times(mc_t99, mc_t100) ;
mc_t194 = 2 ;
mc_t97 = rdivide(mc_t98, mc_t194) ;
mc_t96 = exp(mc_t97) ;
Fc = times(mc_t95, mc_t96) ;
mc_t111 = b0 ;
mc_t195 = 2 ;
mc_t112 = power(b0, mc_t195) ;
mc_t110 = Mix10.minus(mc_t111, mc_t112) ;
mc_t196 = 13 ;
mc_t104 = times(mc_t196, mc_t110) ;
mc_t197 = 3 ;
mc_t108 = uminus(mc_t197) ;
mc_t109 = b0 ;
mc_t107 = times(mc_t108, mc_t109) ;
mc_t198 = 2 ;
mc_t106 = rdivide(mc_t107, mc_t198) ;
mc_t105 = exp(mc_t106) ;
Fb = times(mc_t104, mc_t105) ;
mc_t114 = h ;
mc_t118 = Fa ;
mc_t199 = 4 ;
mc_t119 = mtimes(mc_t199, Fc) ;
mc_t116 = Mix10.plus(mc_t118, mc_t119) ;
mc_t117 = Fb ;
mc_t115 = Mix10.plus(mc_t116, mc_t117) ;
mc_t113 = mtimes(mc_t114, mc_t115) ;
mc_t200 = 3 ;
S = mrdivide(mc_t113, mc_t200) ;
//% Simpson's rule.
SR2vec = horzcat(a0, b0, S, S, tol0, tol0) ;
mc_t202 = 3 ;
mc_t124 = SR0vec(mc_t202 as Int) ;
mc_t203 = 3 ;
mc_t125 = SR1vec(mc_t203 as Int) ;
mc_t122 = Mix10.minus(mc_t124, mc_t125) ;
mc_t204 = 3 ;
mc_t123 = SR2vec(mc_t204 as Int) ;
mc_t121 = Mix10.minus(mc_t122, mc_t123) ;
mc_t120 = abs(mc_t121) ;
mc_t205 = 10 ;
err = mrdivide(mc_t120, mc_t205) ;
mc_t214 = lt(err, tol) ;
	               if (mc_t214)
	                   {
	                   SRmat(p.operator+(Point.make((p-1) as Int, (SR0vec.region.min(1)-1) as Int)))= SR0vec(p);
mc_t206 = 3 ;
mc_t126 = SR1vec(mc_t206 as Int) ;
mc_t207 = 3 ;
mc_t127 = SR2vec(mc_t207 as Int) ;
mc_t6 = Mix10.plus(mc_t126, mc_t127) ;
mc_t208 = 4 ;
SRmat(p as Int, mc_t208 as Int) = mc_t6 ;
mc_t209 = 5 ;
SRmat(p as Int, mc_t209 as Int) = err ;
}
else 
	                   {
mc_t128 = colon(p, m) ;
	                   mix10_pt_SRmat = Point.make(1-((mc_t128.region.min(0)) as Int), 0);
mc_t7 = new Array[Double](((mc_t128.region.min(0)) as Int..(mc_t128.region.max(0)) as Int)*((SRmat.region.min(1))..SRmat.region.max(1))), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
mc_t210 = 1 ;
mc_t129 = Mix10.plus(p, mc_t210) ;
mc_t211 = 1 ;
mc_t130 = Mix10.plus(m, mc_t211) ;
mc_t9 = colon(mc_t129, mc_t130) ;
	                   SRmat(p.operator+(Point.make((mc_t9(mc_t9.region.min(0)) -1) as Int, (mc_t7.region.min(1)-1) as Int)))= mc_t7(p);
mc_t212 = 1 ;
m = Mix10.plus(m, mc_t212) ;
	                   SRmat(p.operator+(Point.make((p-1) as Int, (SR1vec.region.min(1)-1) as Int)))= SR1vec(p);
mc_t213 = 1 ;
mc_t10 = Mix10.plus(p, mc_t213) ;
	                   SRmat(p.operator+(Point.make((mc_t10-1) as Int, (SR2vec.region.min(1)-1) as Int)))= SR2vec(p);
state = iterating ;
}
}
else 
	               {
}
}
mc_t217 = eq(state, iterating) ;
}
var mc_t218: Double = 4;
val mc_t133: Array[Double];
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(0, 1-(mc_t218 as Int));
mc_t133 = new Array[Double](((SRmat.region.min(0))..SRmat.region.max(0)))*(1..1), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
var quad: Double = sum(mc_t133);
var mc_t219: Double = 5;
val mc_t135: Array[Double];
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(0, 1-(mc_t219 as Int));
mc_t135 = new Array[Double](((SRmat.region.min(0))..SRmat.region.max(0)))*(1..1), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
val mc_t134: Array[Double] = new Array[Double](abs(mc_t135));
err = sum(mc_t134) ;
var mc_t220: Double = 1;
val mc_t136: Array[Double] = new Array[Double](colon(mc_t220, m));
var mc_t221: Double = 1;
var mc_t222: Double = 6;
val mc_t137: Array[Double] = new Array[Double](colon(mc_t221, mc_t222));
val mix10_pt_SRmat: Point;
	    mix10_pt_SRmat = Point.make(1-((mc_t136.region.min(0)) as Int), 1-((mc_t137.region.min(0)) as Int));
SRmat = new Array[Double](((mc_t136.region.min(0)) as Int..(mc_t136.region.max(0)) as Int)*((mc_t137.region.min(0)) as Int..(mc_t137.region.max(0)) as Int), p:point(2)=>SRmat(p.operator-(mix10_pt_SRmat)));
 ;
	    return [SRmat,quad,err];
}

}