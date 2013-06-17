public class Mix10 {
public static def plus(a:Array[Double], b:Double){
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}

}