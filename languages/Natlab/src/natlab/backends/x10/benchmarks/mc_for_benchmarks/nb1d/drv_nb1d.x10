class testclass{
	static def nbody1d (n: Double, Rx: Array[Double], Ry: Array[Double], Rz: Array[Double], m: Array[Double], dT: Double, T: Double)
	    {
//%-----------------------------------------------------------------------
//%
//%	This function M-file simulates the gravitational movement
//%	of a set of objects.
//%
//%	Invocation:
//%		>> [Fx, Fy, Fz, Vx, Vy, Vz] = ...
//%		   nbody1d(n, Rx, Ry, Rz, m, dT, T)
//%
//%		where
//%
//%		i. n is the number of objects,
//%
//%		i. Rx is the n x 1 radius vector of x-components,
//%
//%		i. Ry is the n x 1 radius vector of y-components,
//%
//%		i. Rz is the n x 1 radius vector of z-components,
//%
//%		i. m is the n x 1 vector of object masses,
//%
//%		i. dT is the time increment of evolution,
//%
//%		i. T is the total time for evolution,
//%
//%		o. Fx is the n x 1 vector of net x-component forces,
//%
//%		o. Fy is the n x 1 vector of net y-component forces,
//%
//%		o. Fz is the n x 1 vector of net z-component forces,
//%
//%		o. Vx is the n x 1 vector of x-component velocities,
//%
//%		o. Vy is the n x 1 vector of y-component velocities,
//%
//%		o. Vz is the n x 1 vector of z-component velocities.
//%
//%	Requirements:
//%		None.
//%
//%	Examples:
//%		>> [Fx, Fy, Fz, Vx, Vy, Vz] = ...
//%		   nbody1d(n, ...
//%		   rand(n, 1)*1000.23, ...
//%		   rand(n, 1)*1000.23, ...
//%		   rand(n, 1)*1000.23, ...
//%		   rand(n, 1)*345, 0.01, 20)
//%
//%	Source:
//%		Quinn's "Otter" project.
//%
//%	Author:
//%		Alexey Malishevsky (malishal@cs.orst.edu).
//%
//%-----------------------------------------------------------------------
var mc_t76: Double = 1;
val Fx: Array[Double] = new Array[Double](zeros(n, mc_t76));
var mc_t77: Double = 1;
val Fy: Array[Double] = new Array[Double](zeros(n, mc_t77));
var mc_t78: Double = 1;
val Fz: Array[Double] = new Array[Double](zeros(n, mc_t78));
var mc_t79: Double = 1;
val Vx: Array[Double] = new Array[Double](zeros(n, mc_t79));
var mc_t80: Double = 1;
val Vy: Array[Double] = new Array[Double](zeros(n, mc_t80));
var mc_t81: Double = 1;
val Vz: Array[Double] = new Array[Double](zeros(n, mc_t81));
var G: Double = 1e-11;
//% Gravitational constant.
var mc_t85: Double = 1;
var t: Double;
var mc_t84: Double;
var mc_t44: Array[Double];
var mc_t45: Double;
var drx: Double;
var mc_t46: Array[Double];
var mc_t47: Double;
var dry: Double;
var mc_t48: Array[Double];
var mc_t49: Double;
var drz: Double;
var mc_t52: Double;
var mc_t53: Double;
var mc_t50: Double;
var mc_t51: Double;
var r: Double;
var mc_t82: Double;
var mc_t54: Array[Double];
var mc_t55: Double;
var M: Array[Double];
var mc_t83: Double;
var mc_t56: Double;
var mc_t57: Double;
var f: Double;
var frx: Double;
var fry: Double;
var frz: Double;
var mc_t58: Double;
var mc_t59: Double;
var mc_t41: Double;
var mc_t60: Double;
var mc_t61: Double;
var mc_t42: Double;
var mc_t62: Double;
var mc_t63: Double;
var mc_t43: Double;
var ax: Array[Double];
var ay: Array[Double];
var az: Array[Double];
var mc_t64: Array[Double];
var mc_t65: Array[Double];
var mc_t66: Array[Double];
var mc_t67: Array[Double];
var mc_t68: Array[Double];
var mc_t69: Array[Double];
var mc_t70: Array[Double];
var mc_t71: Array[Double];
var mc_t72: Array[Double];
var mc_t73: Array[Double];
var mc_t74: Array[Double];
var mc_t75: Array[Double];
	    for (t = mc_t85 ;
(t <= T);t = (t + 1))
	        {
mc_t84 = 1 ;
var k: Double;
	        for (k = mc_t84 ;
(k <= n);k = (k + 1))
	            {
//% Find the displacement vector between all particles
//% and the kth particle.
mc_t44 = Rx ;
mc_t45 = Rx(k as Int) ;
drx = Mix10.minus(mc_t44, mc_t45) ;
mc_t46 = Ry ;
mc_t47 = Ry(k as Int) ;
dry = Mix10.minus(mc_t46, mc_t47) ;
mc_t48 = Rz ;
mc_t49 = Rz(k as Int) ;
drz = Mix10.minus(mc_t48, mc_t49) ;
//% Find the squared distance between all particles
//% and the kth particle, adjusting "self distances" to 1.
mc_t52 = times(drx, drx) ;
mc_t53 = times(dry, dry) ;
mc_t50 = Mix10.plus(mc_t52, mc_t53) ;
mc_t51 = times(drz, drz) ;
r = Mix10.plus(mc_t50, mc_t51) ;
mc_t82 = 1.0 ;
r(k as Int) = mc_t82 ;
//% Find the product of the kth particle's mass and
//% and every object's mass, adjusting "self products" to 0.
mc_t54 = m ;
mc_t55 = m(k as Int) ;
M = mtimes(mc_t54, mc_t55) ;
mc_t83 = 0.0 ;
M(k as Int) = mc_t83 ;
//% Find the gravitational force.
mc_t56 = G ;
mc_t57 = rdivide(M, r) ;
f = mtimes(mc_t56, mc_t57) ;
//% Find the unit direction vector.
r = sqrt(r) ;
drx = rdivide(drx, r) ;
dry = rdivide(dry, r) ;
drz = rdivide(drz, r) ;
//% Find the resulting force.
frx = times(f, drx) ;
fry = times(f, dry) ;
frz = times(f, drz) ;
mc_t58 = mean(frx) ;
mc_t59 = n ;
mc_t41 = mtimes(mc_t58, mc_t59) ;
Fx(k as Int) = mc_t41 ;
mc_t60 = mean(fry) ;
mc_t61 = n ;
mc_t42 = mtimes(mc_t60, mc_t61) ;
Fy(k as Int) = mc_t42 ;
mc_t62 = mean(frz) ;
mc_t63 = n ;
mc_t43 = mtimes(mc_t62, mc_t63) ;
Fz(k as Int) = mc_t43 ;
}
//% Find the acceleration.
ax = rdivide(Fx, m) ;
ay = rdivide(Fy, m) ;
az = rdivide(Fz, m) ;
//% Find the velocity.
mc_t64 = Vx ;
mc_t65 = mtimes(ax, dT) ;
Vx = Mix10.plus(mc_t64, mc_t65) ;
mc_t66 = Vy ;
mc_t67 = mtimes(ay, dT) ;
Vy = Mix10.plus(mc_t66, mc_t67) ;
mc_t68 = Vz ;
mc_t69 = mtimes(az, dT) ;
Vz = Mix10.plus(mc_t68, mc_t69) ;
//% Find the radius vector.
mc_t70 = Rx ;
mc_t71 = mtimes(Vx, dT) ;
Rx = Mix10.plus(mc_t70, mc_t71) ;
mc_t72 = Ry ;
mc_t73 = mtimes(Vy, dT) ;
Ry = Mix10.plus(mc_t72, mc_t73) ;
mc_t74 = Rz ;
mc_t75 = mtimes(Vz, dT) ;
Rz = Mix10.plus(mc_t74, mc_t75) ;
}
	    return [Fx as Any,Fy as Any,Fz as Any,Vx as Any,Vy as Any,Vz as Any];
}

}	static def drv_nb1d (scale: Double)
	    {
//%
//%  Driver for the N-body problem coded using 1d arrays for the
//%  displacement vectors.
//%
var seed: Double = 1;
//%t1 = clock;
var mc_t22: Double = .4;
var mc_t1: Double = mpower(scale, mc_t22);
var mc_t23: Double = 30;
var mc_t0: Double = mtimes(mc_t1, mc_t23);
var n: Double = round(mc_t0);
//%floor(28*rand);
var mc_t24: Double = .5;
var mc_t25: Double = 0.0833;
var dT: Double = mtimes(mc_t24, mc_t25);
var mc_t26: Double = .5;
var mc_t27: Double = 32.4362;
var mc_t2: Double = mtimes(mc_t26, mc_t27);
var mc_t3: Double = sqrt(scale);
var T: Double = mtimes(mc_t2, mc_t3);
var mc_t28: Double = 1;
var mc_t29: Double = .1;
val mc_t4: Array[Double] = new Array[Double](rand(n, mc_t28, mc_t29));
var mc_t30: Double = 1000.23;
val Rx: Array[Double] = new Array[Double](mtimes(mc_t4, mc_t30));
var mc_t31: Double = 1;
var mc_t32: Double = .4;
val mc_t5: Array[Double] = new Array[Double](rand(n, mc_t31, mc_t32));
var mc_t33: Double = 1000.23;
val Ry: Array[Double] = new Array[Double](mtimes(mc_t5, mc_t33));
var mc_t34: Double = 1;
var mc_t35: Double = .9;
val mc_t6: Array[Double] = new Array[Double](rand(n, mc_t34, mc_t35));
var mc_t36: Double = 1000.23;
val Rz: Array[Double] = new Array[Double](mtimes(mc_t6, mc_t36));
var mc_t8: Double = n;
var mc_t37: Double = .4;
var mc_t9: Double = uminus(mc_t37);
var mc_t38: Double = 1;
val mc_t7: Array[Double] = new Array[Double](rand(mc_t8, mc_t38, mc_t9));
var mc_t39: Double = 345;
val m: Array[Double] = new Array[Double](mtimes(mc_t7, mc_t39));
var Fx: Array[Double];
var Fy: Array[Double];
var Fz: Array[Double];
var Vx: Array[Double];
var Vy: Array[Double];
var Vz: Array[Double];
var _Fx_Fy_Fz_Vx_Vy_Vz: Array[Any];
_Fx_Fy_Fz_Vx_Vy_Vz = nbody1d(n, Rx, Ry, Rz, m, dT, T) ;
Fx = _Fx_Fy_Fz_Vx_Vy_Vz(0 as Int)as Array[Double] ;
Fy = _Fx_Fy_Fz_Vx_Vy_Vz(1 as Int)as Array[Double] ;
Fz = _Fx_Fy_Fz_Vx_Vy_Vz(2 as Int)as Array[Double] ;
Vx = _Fx_Fy_Fz_Vx_Vy_Vz(3 as Int)as Array[Double] ;
Vy = _Fx_Fy_Fz_Vx_Vy_Vz(4 as Int)as Array[Double] ;
Vz = _Fx_Fy_Fz_Vx_Vy_Vz(5 as Int)as Array[Double] ;
//%t2 = clock;
//% Compute the running time in seconds
//%time = (t2-t1)*[0 0 86400 3600 60 1]';
//% Store the benchmark output
var mc_t21: Array[Double];
val mix10_pt_Fx: Point;
	    mix10_pt_Fx = Point.make(0);
val mix10_ptOff_Fx: Array[Double];
	    mix10_ptOff_Fx = Fx;
mc_t21 = new Array[Double](((Fx.region.min(0))..(Fx.region.max(0))), (p:Point(1))=>mix10_ptOff_Fx(p.operator-(mix10_pt_Fx)));
 ;
var mc_t10: Double = mean(mc_t21);
var mc_t20: Array[Double];
val mix10_pt_Fy: Point;
	    mix10_pt_Fy = Point.make(0);
val mix10_ptOff_Fy: Array[Double];
	    mix10_ptOff_Fy = Fy;
mc_t20 = new Array[Double](((Fy.region.min(0))..(Fy.region.max(0))), (p:Point(1))=>mix10_ptOff_Fy(p.operator-(mix10_pt_Fy)));
 ;
var mc_t11: Double = mean(mc_t20);
var mc_t19: Array[Double];
val mix10_pt_Fz: Point;
	    mix10_pt_Fz = Point.make(0);
val mix10_ptOff_Fz: Array[Double];
	    mix10_ptOff_Fz = Fz;
mc_t19 = new Array[Double](((Fz.region.min(0))..(Fz.region.max(0))), (p:Point(1))=>mix10_ptOff_Fz(p.operator-(mix10_pt_Fz)));
 ;
var mc_t12: Double = mean(mc_t19);
var mc_t18: Array[Double];
val mix10_pt_Vx: Point;
	    mix10_pt_Vx = Point.make(0);
val mix10_ptOff_Vx: Array[Double];
	    mix10_ptOff_Vx = Vx;
mc_t18 = new Array[Double](((Vx.region.min(0))..(Vx.region.max(0))), (p:Point(1))=>mix10_ptOff_Vx(p.operator-(mix10_pt_Vx)));
 ;
var mc_t13: Double = mean(mc_t18);
var mc_t17: Array[Double];
val mix10_pt_Vy: Point;
	    mix10_pt_Vy = Point.make(0);
val mix10_ptOff_Vy: Array[Double];
	    mix10_ptOff_Vy = Vy;
mc_t17 = new Array[Double](((Vy.region.min(0))..(Vy.region.max(0))), (p:Point(1))=>mix10_ptOff_Vy(p.operator-(mix10_pt_Vy)));
 ;
var mc_t14: Double = mean(mc_t17);
var mc_t16: Array[Double];
val mix10_pt_Vz: Point;
	    mix10_pt_Vz = Point.make(0);
val mix10_ptOff_Vz: Array[Double];
	    mix10_ptOff_Vz = Vz;
mc_t16 = new Array[Double](((Vz.region.min(0))..(Vz.region.max(0))), (p:Point(1))=>mix10_ptOff_Vz(p.operator-(mix10_pt_Vz)));
 ;
var mc_t15: Double = mean(mc_t16);
val output: Array[Any] = [mc_t10 as Any ,mc_t11 as Any ,mc_t12 as Any ,mc_t13 as Any ,mc_t14 as Any ,mc_t15 as Any];
//% No validation performed
//%valid = 'N/A';
var x: Double = 1;
	    return x;
}

}