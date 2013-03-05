class testclass{
	static def ranges (A: Array[Double])
	    {
var mc_t0: Double = 3;
var mc_t1: Double = 4;
var mc_t2: Double = 5;
val x: Array[Double] = new Array[Double](ones(mc_t0, mc_t1, mc_t2));
var mc_t3: Double = 1;
var mc_t4: Double = 3;
val y: Array[Double];
y = new Array[Double]((mc_t3 as Int..mc_t3 as Int)*((x.region.min(1))..x.region.max(1)))*(mc_t4 as Int..mc_t4 as Int), p:point(3)=>x(p));
 ;
//%disp(y);
	    return x;
}

}