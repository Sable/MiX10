class testclass{
	static def iterations (x: Double, max: Double)
	    {
var c: Complex = x;
var i: Double = 0;
var mc_t43: Double = abs(x);
var mc_t46: Double = 2;
var mc_t41: Boolean = lt(mc_t43, mc_t46);
var mc_t42: Boolean;
var mc_t40: Boolean;
	    if (mc_t41)
	        {
mc_t42 = lt(i, max) ;
mc_t40 = and(mc_t41, mc_t42) ;
}
else 
	        {
mc_t40 = mc_t41 ;
}
var mc_t44: Double;
var mc_t45: Complex;
var mc_t47: Double;
	    while (mc_t40)
	       {
mc_t44 = mtimes(x, x) ;
mc_t45 = c ;
x = Mix10.plus(mc_t44, mc_t45) ;
mc_t47 = 1 ;
i = Mix10.plus(i, mc_t47) ;
}
var out: Double = i;
	    return out;
}

}	static def iterations (x: Double, max: Double)
	    {
var c: Complex = x;
var i: Double = 0;
var mc_t43: Double = abs(x);
var mc_t46: Double = 2;
var mc_t41: Boolean = lt(mc_t43, mc_t46);
var mc_t42: Boolean;
var mc_t40: Boolean;
	    if (mc_t41)
	        {
mc_t42 = lt(i, max) ;
mc_t40 = and(mc_t41, mc_t42) ;
}
else 
	        {
mc_t40 = mc_t41 ;
}
var mc_t44: Double;
var mc_t45: Complex;
var mc_t47: Double;
	    while (mc_t40)
	       {
mc_t44 = mtimes(x, x) ;
mc_t45 = c ;
x = Mix10.plus(mc_t44, mc_t45) ;
mc_t47 = 1 ;
i = Mix10.plus(i, mc_t47) ;
}
var out: Double = i;
	    return out;
}

}	static def mandelbrot (N: Double, Nmax: Double)
	    {
//%n=integer?
//%nmax=parameter
//%x,c are complex
//%ya,yb,xa,xb,dx,dy
//% computes mandelbrot set with N elements and Nmax iterations
var mc_t13: Double = sqrt(N);
var side: Double = round(mc_t13);
var mc_t30: Double = 1;
var ya: Double = uminus(mc_t30);
var yb: Double = 1;
var mc_t31: Double = 1.5;
var xa: Double = uminus(mc_t31);
var xb: Double = .5;
var mc_t14: Double = Mix10.minus(xb, xa);
var mc_t32: Double = 1;
var mc_t15: Double = Mix10.minus(side, mc_t32);
var dx: Double = mrdivide(mc_t14, mc_t15);
var mc_t16: Double = Mix10.minus(yb, ya);
var mc_t33: Double = 1;
var mc_t17: Double = Mix10.minus(side, mc_t33);
var dy: Double = mrdivide(mc_t16, mc_t17);
val set: Array[Double] = new Array[Double](zeros(side, side));
var mc_t34: Double = 1;
var mc_t29: Double = Mix10.minus(side, mc_t34);
var mc_t39: Double = 0;
var x: Double;
var mc_t35: Double;
var mc_t28: Double;
var mc_t38: Double;
var mc_t26: Double;
var mc_t27: Double;
var mc_t20: Double;
var mc_t22: Complex;
var mc_t24: Double;
var mc_t25: Double;
var mc_t23: Double;
var mc_t21: Complex;
var mc_t18: Complex;
var mc_t19: Double;
var mc_t10: Double;
var mc_t36: Double;
var mc_t11: Double;
var mc_t37: Double;
var mc_t12: Double;
	    for (x = mc_t39 ;
(x <= mc_t29);x = (x + 1))
	        {
mc_t35 = 1 ;
mc_t28 = Mix10.minus(side, mc_t35) ;
mc_t38 = 0 ;
var y: Double;
	        for (y = mc_t38 ;
(y <= mc_t28);y = (y + 1))
	            {
mc_t26 = xa ;
mc_t27 = mtimes(x, dx) ;
mc_t20 = Mix10.plus(mc_t26, mc_t27) ;
mc_t22 = i() ;
mc_t24 = ya ;
mc_t25 = mtimes(y, dy) ;
mc_t23 = Mix10.plus(mc_t24, mc_t25) ;
mc_t21 = mtimes(mc_t22, mc_t23) ;
mc_t18 = Mix10.plus(mc_t20, mc_t21) ;
mc_t19 = Nmax ;
mc_t10 = iterations(mc_t18, mc_t19) ;
mc_t36 = 1 ;
mc_t11 = Mix10.plus(y, mc_t36) ;
mc_t37 = 1 ;
mc_t12 = Mix10.plus(x, mc_t37) ;
set(mc_t11 as Int, mc_t12 as Int) = mc_t10 ;
}
}
	    return set;
}

}	static def iterations (x: Double, max: Double)
	    {
var c: Complex = x;
var i: Double = 0;
var mc_t43: Double = abs(x);
var mc_t46: Double = 2;
var mc_t41: Boolean = lt(mc_t43, mc_t46);
var mc_t42: Boolean;
var mc_t40: Boolean;
	    if (mc_t41)
	        {
mc_t42 = lt(i, max) ;
mc_t40 = and(mc_t41, mc_t42) ;
}
else 
	        {
mc_t40 = mc_t41 ;
}
var mc_t44: Double;
var mc_t45: Complex;
var mc_t47: Double;
	    while (mc_t40)
	       {
mc_t44 = mtimes(x, x) ;
mc_t45 = c ;
x = Mix10.plus(mc_t44, mc_t45) ;
mc_t47 = 1 ;
i = Mix10.plus(i, mc_t47) ;
}
var out: Double = i;
	    return out;
}

}	static def drv_mbrt (scale: Double)
	    {
//% computes mandelbrot set
var mc_t1: Double = sqrt(scale);
var mc_t5: Double = 6000;
var mc_t0: Double = mtimes(mc_t5, mc_t1);
var N: Double = round(mc_t0);
var mc_t6: Double = 10;
var mc_t7: Double = 3;
var mc_t3: Double = mpower(mc_t6, mc_t7);
var mc_t4: Double = sqrt(scale);
var mc_t2: Double = mtimes(mc_t3, mc_t4);
var Nmax: Double = round(mc_t2);
var mc_t8: Double = 100;
var mc_t9: Double = 1000;
val set: Array[Double] = new Array[Double](mandelbrot(mc_t8, mc_t9));
val output: Array[Double];
val mix10_pt_set: Point;
	    mix10_pt_set = Point.make(0);
output = new Array[Double](((set.region.min(0))..set.region.max(0))), p:point(1)=>set(p.operator-(mix10_pt_set)));
 ;
val valid: Array[String] = new Array[String]('na');
	    return [output,valid];
}

}