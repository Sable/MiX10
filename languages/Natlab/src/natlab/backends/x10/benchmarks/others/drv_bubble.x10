class testclass{
	static def drv_bubble (A: Array[Double])
	    {
var x: Array[Double];
var n: Double;
var _x_n: Array[Any];
_x_n = bubble(A) ;
x = _x_n(0 as Int)as Array[Double] ;
n = _x_n(1 as Int)as Double ;
var y: Array[Double] = new Array[Double](x);
	    return y;
}

}	static def bubble (A: Array[Double])
	    {
var n: Double = Mix10.length(A);
//% making (n-1) passes
var mc_t8: Double = 1;
var mc_t7: Double = Mix10.minus(n, mc_t8);
var mc_t15: Double = 1;
var j: Double;
var mc_t9: Double;
var mc_t6: Double;
var mc_t14: Double;
var mc_t0: Double;
var mc_t10: Double;
var mc_t4: Double;
var mc_t1: Double;
var mc_t13: Boolean;
var temp: Double;
var mc_t11: Double;
var mc_t5: Double;
var mc_t2: Double;
var mc_t12: Double;
var mc_t3: Double;
	    for (j = mc_t15 ;
(j <= mc_t7);j = (j + 1))
	        {
//% comparing each number with the next and swapping
mc_t9 = 1 ;
mc_t6 = Mix10.minus(n, mc_t9) ;
mc_t14 = 1 ;
var i: Double;
	        for (i = mc_t14 ;
(i <= mc_t6);i = (i + 1))
	            {
mc_t0 = A(i as Int) ;
mc_t10 = 1 ;
mc_t4 = Mix10.plus(i, mc_t10) ;
mc_t1 = A(mc_t4 as Int) ;
mc_t13 = Mix10.gt(mc_t0, mc_t1) ;
	            if (mc_t13)
	                {
temp = A(i as Int) ;
mc_t11 = 1 ;
mc_t5 = Mix10.plus(i, mc_t11) ;
mc_t2 = A(mc_t5 as Int) ;
A(i as Int) = mc_t2 ;
mc_t12 = 1 ;
mc_t3 = Mix10.plus(i, mc_t12) ;
A(mc_t3 as Int) = temp ;
}
else 
	                {
}
}
}
var x: Array[Double] = new Array[Double](A);
	    return [x,n];
}

}