public class Mix10 {
public static def ones(a:Double){
				val x: Array[Double] = new Array[Double](1..a as Int * 1..b as Int,1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		return x;
				}
public static def plus(a:Array[Double], b:Double){
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}

}