class testclass{
	static def bubble (A: Array[Double])
	    {
var n: Double = Mix10.length(A);
var mc_t10: Double = 1;
var mc_t9: Double = Mix10.minus(n, mc_t10);
var mc_t17: Double = 1;
var j: Double;
var mc_t11: Double;
var mc_t8: Double;
var mc_t16: Double;
var mc_t4: Double;
var mc_t12: Double;
var mc_t6: Double;
var mc_t5: Double;
var mc_t15: Boolean;
var temp: Double;
var mc_t13: Double;
var mc_t7: Double;
var mc_t2: Double;
var mc_t14: Double;
var mc_t3: Double;
	    for (j = mc_t17 ;
(j <= mc_t9);j = (j + 1))
	        {
//% comparing each number with the next and swapping
mc_t11 = 1 ;
mc_t8 = Mix10.minus(n, mc_t11) ;
mc_t16 = 1 ;
var i: Double;
	        for (i = mc_t16 ;
(i <= mc_t8);i = (i + 1))
	            {
mc_t4 = A(i as Int) ;
mc_t12 = 1 ;
mc_t6 = Mix10.plus(i, mc_t12) ;
mc_t5 = A(mc_t6 as Int) ;
mc_t15 = Mix10.gt(mc_t4, mc_t5) ;
	            if (mc_t15)
	                {
temp = A(i as Int) ;
mc_t13 = 1 ;
mc_t7 = Mix10.plus(i, mc_t13) ;
mc_t2 = A(mc_t7 as Int) ;
A(i as Int) = mc_t2 ;
mc_t14 = 1 ;
mc_t3 = Mix10.plus(i, mc_t14) ;
A(mc_t3 as Int) = temp ;
}
else 
	                {
}
}
}
val x: Array[Double] = new Array[Double](A);
	    return x;
}

}	static def drv_bubble (n: Double)
	    {
var mc_t0: Double = 1;
val A: Array[Double] = new Array[Double](rand(mc_t0, n));
var mc_t1: Double = 100;
A = mtimes(mc_t1, A) ;
val y: Array[Double] = new Array[Double](bubble(A));
	    return y;
}

}