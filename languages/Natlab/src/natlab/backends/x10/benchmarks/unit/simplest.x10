class testclass{
	static def simplest (a: Double)
	    {
var mc_t0: Double = 3;
var x: Double = Mix10.plus(a, mc_t0);
var mc_t1: Double = 3;
var y: Double = Mix10.minus(a, mc_t1);
var b: Double;
var c: Double;
val _b_c: Array[Any];
_b_c = foo(x, y) ;
b = _b_c(0 as Int)as Double ;
c = _b_c(1 as Int)as Double ;
	    return [x,y];
}

}	static def foo (a: Double, b: Double)
	    {
var mc_t2: Double = 3;
var x: Double = Mix10.plus(a, mc_t2);
var mc_t3: Double = 3;
var y: Double = Mix10.minus(b, mc_t3);
	    return [x,y];
}

}