class testclass{
	static def drv_bubble (scale: Double)
	    {
var mc_t0: Double = 1;
val A: Array[Double] = new Array[Double](rand(mc_t0, scale));
var mc_t1: Double = 100;
A = mtimes(mc_t1, A) ;
val : Array[Any];
 = bubble(A) ;
}

}	static def bubble (A: Array[Double])
	    {
var n: Double = Mix10.length(A);
var mc_t11: Double = 1;
var mc_t10: Double = Mix10.minus(n, mc_t11);
var mc_t18: Double = 1;
var j: Double;
var mc_t12: Double;
var mc_t9: Double;
var mc_t17: Double;
var mc_t3: Double;
var mc_t13: Double;
var mc_t7: Double;
var mc_t4: Double;
var mc_t16: Boolean;
var temp: Double;
var mc_t14: Double;
var mc_t8: Double;
var mc_t5: Double;
var mc_t15: Double;
var mc_t6: Double;
	    for (j = mc_t18 ;
(j <= mc_t10);j = (j + 1))
	        {
//% comparing each number with the next and swapping
mc_t12 = 1 ;
mc_t9 = Mix10.minus(n, mc_t12) ;
mc_t17 = 1 ;
var i: Double;
	        for (i = mc_t17 ;
(i <= mc_t9);i = (i + 1))
	            {
mc_t3 = A(i as Int) ;
mc_t13 = 1 ;
mc_t7 = Mix10.plus(i, mc_t13) ;
mc_t4 = A(mc_t7 as Int) ;
mc_t16 = Mix10.gt(mc_t3, mc_t4) ;
	            if (mc_t16)
	                {
temp = A(i as Int) ;
mc_t14 = 1 ;
mc_t8 = Mix10.plus(i, mc_t14) ;
mc_t5 = A(mc_t8 as Int) ;
A(i as Int) = mc_t5 ;
mc_t15 = 1 ;
mc_t6 = Mix10.plus(i, mc_t15) ;
A(mc_t6 as Int) = temp ;
}
else 
	                {
}
}
}
val x: Array[Double] = new Array[Double](A);
	    return x;
}

}