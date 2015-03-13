class testclass{
	static def ranges (A: Array[Double])
	    {
var mc_t1: Double = 3;
var mc_t2: Double = 4;
var mc_t3: Double = 5;
val x: Array[Double] = new Array[Double](ones(mc_t1, mc_t2, mc_t3));
var mc_t4: Double = 1;
var mc_t5: Double = 4;
val mc_t0: Array[Double] = new Array[Double](colon(mc_t4, mc_t5));
var mc_t6: Double = 1;
var y: Array[Double];
val mix10_pt_x: Point;
	    mix10_pt_x = Point.make(1-(mc_t6 as Int), 1-((mc_t0.region.min(0)) as Int), 0);
val mix10_ptOff_x: Array[Double];
	    mix10_ptOff_x = x;
y = new Array[Double]((1..1)*((mc_t0.region.min(0)) as Int..(mc_t0.region.max(0)) as Int)*((x.region.min(2))..(x.region.max(2))), (p:Point(3))=>mix10_ptOff_x(p.operator-(mix10_pt_x)));
 ;
//%forTest1(x);
//%disp(y);
	    return x;
}

}