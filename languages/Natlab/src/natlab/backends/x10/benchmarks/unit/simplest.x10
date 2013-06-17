class simplest.x10{
	static def simplest (a: Double)
	    {
//%x=i;
var x: Double = a;
var mc_t0: Double = 10;
val p: Array[Double](2) = new Array[Double](ones(mc_t0));
var mc_t2: Double = 1;
var mc_t3: Double = 10;
var i: Double;
val mix10_pt_p: Point;
val mix10_ptOff_p: Array[Double](2);
var mc_t1: Double;
	    for (i = mc_t2 ;
(i <= mc_t3);i = (i + 1))
	        {
	        mix10_pt_p = Point.make(0, 1-(i as Int));
	        mix10_ptOff_p = p;
x = new Array[Double](((p.region.min(0))..(p.region.max(0)))*(1..1), (p:Point(2))=>mix10_ptOff_p(p.operator-(mix10_pt_p)));
 ;
mc_t1 = 3 ;
x = Mix10.plus(x, mc_t1) ;
}
val y: Array[Double](2) = new Array[Double](p);
	    return [x as Any,y as Any];
}

}