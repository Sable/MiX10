class testclass{
	static def cellTest (a: Double)
	    {
var mc_t5: Double = 1;
var mc_t6: Double = 2;
var mc_t7: Double = 3;
val myNum: Array[Double] = new Array[Double](horzcat(mc_t5, mc_t6, mc_t7));
var mc_t9: Double = 4;
var mc_t10: Double = 5;
val num1: Array[Double] = new Array[Double](horzcat(mc_t9, mc_t10));
var mc_t11: Double = 100;
val mc_t0: Array[Double] = new Array[Double](mtimes(myNum, mc_t11));
val mc_t1: Array[Double] = new Array[Double](num1);
val mc_t13: Array[String] = new Array[String]('unun');
val mc_t14: Array[String] = new Array[String]('dos');
var mc_t15: Double = 100;
val myCell: Array[Any] = [mc_t13 ,mc_t0 ,mc_t1 ,mc_t14 ,mc_t15] as Any;
val mc_t2: Array[Double] = new Array[Double](myNum);
var mc_t16: Double = 100;
val mc_t3: Array[Double] = new Array[Double](mtimes(mc_t16, myNum));
val C: Array[Any] = [mc_t2 ,mc_t3] as Any;
//%     myCell, a};
var mc_t18: Double = 1;
var mc_t19: Double = 1;
val x: Array[Double];
x = C(mc_t18 as Int, mc_t19as Int) ;
//%x = y(1,2);
	    return x;
}

}