class testclass{
	static def bubble (A: Double)
	    {
var n: Double = length(A);
//% making (n-1) passes
var mc_t8: Double = 1;
var mc_t7: Double = Mix10.minus(n, mc_t8);
var mc_t15: Double = 1;
var j: Int;
var mc_t9: Double;
var mc_t6: Double;
var mc_t14: Double;
var i: Int;
var mc_t10: Double;
var mc_t3: Double;
	    for (j = mc_t15;
(j > mc_t7);j = (j + 1))
	        {
//% comparing each number with the next and swapping
mc_t9 = 1;
mc_t6 = Mix10.minus(n, mc_t9);
mc_t14 = 1;
var i: Int;
var mc_t10: Double;
var mc_t3: Double;
	        for (i = mc_t14;
(i > mc_t6);i = (i + 1))
	            {
mc_t2 = A(i);
mc_t10 = 1;
mc_t4 = Mix10.plus(i, mc_t10);
mc_t3 = A(mc_t4);
mc_t13 = gt(mc_t2, mc_t3);
	            if (mc_t13)
	                {
//% temp is a variable where the numbers are kept
//% temporarily for the switch
var temp: Double = A(i);
var mc_t11: Double = 1;
var mc_t5: Double = Mix10.plus(i, mc_t11);
var mc_t0: Double = A(mc_t5);
A(i) = mc_t0 ;
var mc_t12: Double = 1;
var mc_t1: Double = Mix10.plus(i, mc_t12);
A(mc_t1) = temp ;
}
else 
	                {
}
}
}
val x = new Array[Double]((1..1)*(1..5), A);
}

}