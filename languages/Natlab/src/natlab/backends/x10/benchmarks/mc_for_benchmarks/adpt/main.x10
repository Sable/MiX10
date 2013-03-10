class testclass{
	static def ranges (A: Double)
	    {
var mc_t5: Double = 3;
var mc_t6: Double = 4;
var mc_t7: Double = 5;
val x: Array[Double] = new Array[Double](ones(mc_t5, mc_t6, mc_t7));
var mc_t8: Double = 1;
var mc_t9: Double = 4;
val mc_t4: Array[Double] = new Array[Double](colon(mc_t8, mc_t9));
var mc_t10: Double = 1;
val y: Array[Double];
val mix10_pt_x: Point;
	    mix10_pt_x = Point.make(1-(mc_t10 as Int), 0, 0);
y = new Array[Double]((1..1)*(mc_t4(1) as Int..mc_t4(4) as Int)*((x.region.min(2))..x.region.max(2))), p:point(3)=>x(p.operator-(mix10_pt_x)));
 ;
//%forTest1(x);
//%disp(y);
	    return x;
}

}	static def main (a: Double)
	    {
//%drv_adpt(5);
var mc_t1: Double = 5;
val : Array[Any];
 = ranges(mc_t1) ;
var mc_t2: Double = 2;
var mc_t3: Double = 3;
val y: Array[Double] = new Array[Double](ones(mc_t2, mc_t3));
}

}