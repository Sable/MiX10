package natlab.backends.x10.codegen;

import java.util.ArrayList;
import java.util.HashMap;

import natlab.backends.x10.IRx10.ast.Type;

public class x10Mapping {

	private static HashMap<String, Type> x10TypeMap = new HashMap<String, Type>();
	private static HashMap<String, String> x10BinOperatorMap = new HashMap<String, String>();
	private static HashMap<String, String> x10UnOperatorMap = new HashMap<String, String>();
	private static HashMap<String, String> x10DirectBuiltinMap = new HashMap<String, String>();
	private static HashMap<String, String> x10BuiltinMap = new HashMap<String, String>();
	private static HashMap<String, String> x10MethodMap = new HashMap<String, String>();
	private static ArrayList<String> x10BuiltinList = new ArrayList<String>();
	public x10Mapping() {
		makex10TypeMap();
/*
		makex10BinOperatorMap();
		makex10UnOperatorMap();
		makex10DirectBuiltinMap();
*/
		makex10BuiltinConstMap();
		makex10MethodMap();
		makex10BuiltinList();
	}

	private void makex10BuiltinList() {
		
		x10BuiltinList.add("plus");
		x10BuiltinList.add("minus");
		x10BuiltinList.add("gt");
		x10BuiltinList.add("length");
		x10BuiltinList.add("sqrt");
		//x10BuiltinList.add("rand");
		x10BuiltinList.add("horzcat");
	//	x10BuiltinList.add("mtimes");
	//	x10BuiltinList.add("times");
	//	x10BuiltinList.add("rdivide");
	//	x10BuiltinList.add("mrdivide");
		x10BuiltinList.add("colon");
	//	x10BuiltinList.add("sin");
	//	x10BuiltinList.add("pi");
	//	x10BuiltinList.add("mpower");
	//	x10BuiltinList.add("zeros");
		x10BuiltinList.add("ones");
	//	x10BuiltinList.add("mean");
		x10BuiltinList.add("fix");
		x10BuiltinList.add("floor");
	//	x10BuiltinList.add("round");
//		x10BuiltinList.add("abs");
//		x10BuiltinList.add("lt");
//		x10BuiltinList.add("le");
//		x10BuiltinList.add("uminus");
//		x10BuiltinList.add("and");
//		x10BuiltinList.add("i");
		
	}

	private void makex10TypeMap() {
		x10TypeMap.put("char", new Type("Char"));
		x10TypeMap.put("double", new Type("Double"));
		x10TypeMap.put("single", new Type("Float"));
		x10TypeMap.put("int8", new Type("Byte"));
		x10TypeMap.put("int16", new Type("Short"));
		x10TypeMap.put("int32", new Type("Int"));
		x10TypeMap.put("int64", new Type("Long"));
		x10TypeMap.put("uint8", new Type("UByte"));
		x10TypeMap.put("uint16", new Type("UShort"));
		x10TypeMap.put("uint32", new Type("UInt"));
		x10TypeMap.put("uint64", new Type("ULong"));
		x10TypeMap.put("logical", new Type("Boolean"));
		x10TypeMap.put(null, new Type("Double")); /*This is the default type*/
	}

	private void makex10BuiltinConstMap() {
		// TODO create a categorical map here

		x10BuiltinMap.put("pi", "Math.PI");
	}

	private void makex10MethodMap() {
		// TODO
	}

	public static Type getX10TypeMapping(String mclassasKey) {
		return x10TypeMap.get(mclassasKey);
	}

	public static Boolean isBinOperator(String expType) {
		if (true == x10BinOperatorMap.containsKey(expType))
			return true;
		else
			return false;
	}

	public static String getX10BinOpMapping(String Operator) {
		return x10BinOperatorMap.get(Operator);
	}

	public static Boolean isUnOperator(String expType) {
		if (true == x10UnOperatorMap.containsKey(expType))
			return true;
		else
			return false;
	}

	public static String getX10UnOpMapping(String Operator) {
		return x10UnOperatorMap.get(Operator);
	}

	public static Boolean isX10DirectBuiltin(String expType) {
		if (true == x10DirectBuiltinMap.containsKey(expType))
			return true;
		else
			return false;
	}

	public static String getX10DirectBuiltinMapping(String BuiltinName) {

		return x10DirectBuiltinMap.get(BuiltinName);

	}

	public static Boolean isBuiltinConst(String expType) {
		if (true == x10BuiltinMap.containsKey(expType))
			return true;
		else
			return false;
	}

	public static Boolean isBuiltin(String expType) {
		if (true == x10BuiltinList.contains(expType))
			return true;
		else
			return false;
	}
	
	public static String getX10BuiltinConstMapping(String BuiltinName) {

		return x10BuiltinMap.get(BuiltinName);

	}

	public static Boolean isMethod(String expType) {
		if (true == x10MethodMap.containsKey(expType))
			return true;
		else
			return false;
	}

	public static String getX10MethodMapping(String MethodName) {
		return x10MethodMap.get(MethodName);
	}

}
