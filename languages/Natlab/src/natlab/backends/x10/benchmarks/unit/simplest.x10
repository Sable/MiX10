class simplest.x10{
	static def simplest (a: Double)
	    {
//%x=i;
var x: Double = a;
var mc_t0: Double = 10;
val p: Array_2[Double] = new Array_2[Double](Mix10.ones(mc_t0));
var mc_t2: Double = 1;
var mc_t3: Double = 10;
var i: Double;
var mc_t1: Double;
	    for (i = mc_t2 ;
(i <= mc_t3);i = (i + 1))
	        {
	        	        x = new Array_2[Double](Helper.getSubArray(0, p.numElems_1 -1, i as Long, i as Long, p)) ;
mc_t1 = 3 ;
x = Mix10.plus(x, mc_t1) ;
}
val y: Array_2[Double] = new Array_2[Double](p);
	    return [x as Any,y as Any];
}

}