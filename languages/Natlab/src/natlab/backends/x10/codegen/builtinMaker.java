package natlab.backends.x10.codegen;

import java.io.BufferedWriter;
import java.io.File;
import org.w3c.dom.*;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException; 
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import natlab.backends.x10.IRx10.ast.Exp;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.List;
import natlab.tame.valueanalysis.ValueAnalysisPrinter;
import ast.Expr;

public class builtinMaker {
	private static ArrayList<String> builtinList = new ArrayList<String>(); //stores consumed builtins
	static String builtin = new String();
	public builtinMaker(){

	}

	public static void makeBuiltin(Expr natlabExp, String builtinName, IRx10ASTGenerator target, List<Exp> args) {
		/*
		 * This is the method that picks up the right method from the xml 
		 * and creates a x10 method ("literally" node in the mix10 class
		 */
		
		
		builtin = getBuiltinFromXml(natlabExp, builtinName,target);
		if (!builtin.equals("processed")){
			BuiltinWriter.mix10Append(builtin, args, natlabExp.getVarName(),getExprType(natlabExp,target), target);
			
		}
		
		
//		try {
//			StringBuffer mix10Builtins = new StringBuffer();
//			BufferedWriter out = new BufferedWriter(new FileWriter("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/mix10.x10", false));
//			out.close();
//			BufferedWriter outAgain = new BufferedWriter(new FileWriter("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/mix10.x10", true));
//			outAgain.write(builtin);
//			outAgain.close();
//		} catch (IOException e) {
//			System.out.println("File IOException - cannot create mix10 class ");
//
//		}
	}

	private static String getBuiltinFromXml(Expr natlabExp, String builtinName, IRx10ASTGenerator target) {
		// TODO Auto-generated method stub
		
		int arrayOrGml = specialize(natlabExp);
		String exprType = getExprType(natlabExp,target);
		String builtin;
		if (! builtinList.contains(builtinName+"-"+exprType)){
		
		
//		try {
			
//		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
//        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
//		Document doc = docBuilder.parse (new File("/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/codegen/mix10_builtins.xml"));
//		doc.getDocumentElement ().normalize ();
			System.out.println(builtinName+"BNAME");
		NodeList builtinNodeList = target.collectedBuiltins.usedBuiltins.get(builtinName);
		if (null != builtinNodeList)
			System.out.println(builtinName+"BNAME");
		
		Element builtinArrayOrGml = (Element)builtinNodeList.item(arrayOrGml);
		 builtin = ((Node)(
				 ((Element)(builtinArrayOrGml.getElementsByTagName(exprType).item(0))).getChildNodes().item(0)
				 )).getNodeValue().trim();
		
		System.out.println(builtin+"------");
		builtinList.add(builtinName+"-"+exprType);
		return builtin;
		
		}
		
//		} catch (ParserConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}catch (SAXException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		return "processed";
	}
	
	

	@SuppressWarnings("unchecked")
	private static String getExprType(Expr natlabExp, IRx10ASTGenerator target) {
		/*
		 * Returns what type of expression it is according
		 * to XML.
		 * type1 - all scalar
		 * type2 - all arrays
		 * type3 - first scalar, other arrays
		 * type4 - first arrays, other scalar
		 * all
		 * 
		 * look for all the parameters in the symbolmap. Based on their IDinfo
		 * decide which type to return.
		 */
		
		List<Exp> args=Expressions.getArgs(natlabExp, target);
		
		int scalarCounter = 0;
		int ctr =0;
		boolean isFirst = false;
		for (Exp arg : args)
		{   ctr++;
			if (target.symbolMap.containsKey(((IDUse) arg).getID())){
				if (target.symbolMap.get(((IDUse) arg).getID()).getShape() == null)
					return "type5"; //TODO check if it is correct. if a shape is unknown, revert to type 4
				if (target.symbolMap.get(((IDUse) arg).getID()).getShape() != null && Helper.isScalar( target.symbolMap.get(((IDUse) arg).getID()).getShape())){
					if (ctr==1)
						isFirst=true;
					scalarCounter++;
				}
				
				System.out.println((ArrayList<Integer>) target.symbolMap.get(((IDUse) arg).getID()).getShape()+((IDUse) arg).getID());
				
				
			}
			else return "type5";
		}
		System.out.println("sctr="+scalarCounter);
		if (scalarCounter == args.getNumChild())
			return "type1"; //all scalar
		else if (scalarCounter == 0)
			return "type2";
		else if (scalarCounter == 1 && isFirst)
			return "type3";
		
		else if (scalarCounter == 1 && !isFirst)
			return "type4";
		else 
			return "type5";
	}

	private static int specialize(Expr natlabExp) {
		// TODO Write specialization code here
		/*
		 * This function decides the default 
		 * decision for looking up arrays or GML
		 * first
		 * 0 - arrays
		 * 1 - gml
		 */
		return 0;//return "arrays";
	}

}
