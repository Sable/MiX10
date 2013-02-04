package natlab.backends.x10.codegen;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class BuiltinWriter {
	private static StringBuffer mix10 = new StringBuffer();
	
	public static void mix10Append (String method){
		mix10.append(method+"\n");
		
	}
	
	public static void classWriter (){
		try {
			
			BufferedWriter out = new BufferedWriter(new FileWriter("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/mix10.x10", false));
			out.write("public class Mix10 {\n");
			
			//out.close();
			
			//BufferedWriter outAgain = new BufferedWriter(new FileWriter("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/mix10.x10", true));
			mix10.append("\n}");
			out.append(mix10.toString());
			out.close();
		} catch (IOException e) {
			System.out.println("File IOException - cannot create mix10 class ");
	  }
	}
}
