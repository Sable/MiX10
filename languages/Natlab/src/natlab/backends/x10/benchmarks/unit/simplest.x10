class simplest.x10{
	static def simplest (a: Array_2[Double])
	    {
//%x=i;
val x: Array_2[Double] = new Array_2[Double](a);
var mc_t2: Double = 10;
val p: Array_2[Double] = new Array_2[Double](Mix10.ones(mc_t2));
var mc_t3: Double = 1;
var mc_t4: Double = 10;
val y: Array_1[Double] = new Array_1[Double](Mix10.ones(mc_t3, mc_t4));
var mc_t5: Double = 2;
var mc_t6: Double = 4;
val mc_t0: Array_1[Double] = new Array_1[Double](Mix10.colon(mc_t5, mc_t6));
var mc_t7: Double = 2;
p = Helper.setSubArray(p, mc_t7, mc_t7, mc_t0(0), mc_t0(mc_t0.size -1), x);
var mc_t8: Double = 1;
var mc_t9: Double = 10;
val mc_t1: Array_1[Double] = new Array_1[Double](Mix10.colon(mc_t8, mc_t9));
var mc_t10: Double = 2;
y = Helper.getSubArray(mc_t10, mc_t10, mc_t1(0), mc_t1(mc_t1.size -1), p);
 ;
	    return p;
}

}