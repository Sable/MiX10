package natlab.backends.x10.codegen;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import natlab.backends.x10.IRx10.ast.Exp;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.List;

public class BuiltinWriter {
	private static StringBuffer mix10 = new StringBuffer();

	public static void mix10Append(String method, List<Exp> args,
			String methodName, String exprType, IRx10ASTGenerator target) {

		mix10.append("public static def " + methodName + "(");
		
		int i;
		for (i = 0; i < args.getNumChild() - 1; i++) {
			/*System.out.println(target.symbolMap.get(args.getChild(i))
							.getType().getName());
			*/				
			/*
			 * char(i+97) creates parameter names starting from a..z
			 */
			/*
			 * TODO:
			 * target.symbolMap.get(((IDUse) args.getChild(i)).getID() can be null 
			 * if it is inside parfor. check and fix in AssignAndDecls.
			 */
			mix10.append(((char)(i+97))
					+ ":");
			if (target.symbolMap.get(((IDUse) args.getChild(i)).getID()) != null){
				mix10.append(paramType(target.symbolMap.get(((IDUse) args.getChild(i)).getID())
							.getType().getName(), exprType, i) + ", ");
			}
           
		}
		mix10.append(((char)(i+97))
				+ ":");
		if (target.symbolMap.get(((IDUse) args.getChild(i)).getID()) != null){
				mix10.append(paramType(target.symbolMap.get(((IDUse) args.getChild(i)).getID()).getType()
						.getName(), exprType, i));
		}
		mix10.append(")" + method + "\n");

	}

	private static String paramType(String typeName, String exprType, int i) {
		String params = "";
		if (exprType.equals("type1")) {
			params = typeName;

		} else if (exprType.equals("type2")) {
			params = "Array[" + typeName + "]";

		} else if (exprType.equals("type3")) {
			if (0 == i)
				params = typeName;
			else
				params = "Array[" + typeName + "]";

		} else if (exprType.equals("type4")) {
			if (1 == i)  //TODO this is a quick hack - assumes there are 2 params and 2nd is scalar
				params = typeName;
			else
				params = "Array[" + typeName + "]";

		}else if (exprType.equals("type5")) {
			params = "Any";
		}
		return params;
	}

	public static void classWriter(String path) {
		try {

			BufferedWriter out = new BufferedWriter(
					new FileWriter(
							path+"Mix10.x10",
							false));
			out.write("public class Mix10 {\n");

			// out.close();

			// BufferedWriter outAgain = new BufferedWriter(new
			// FileWriter("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/mix10.x10",
			// true));
			mix10.append("\n}");
			out.append(mix10.toString());
			out.close();
		} catch (IOException e) {
			System.out.println("File IOException - cannot create mix10 class ");
		}
	}
}
