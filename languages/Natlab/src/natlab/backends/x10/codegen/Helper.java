package natlab.backends.x10.codegen;

import java.util.ArrayList;
import java.util.Collection;

import natlab.tame.valueanalysis.components.shape.*;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.backends.x10.IRx10.ast.Type;
import natlab.tame.classes.reference.ClassReference;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRForStmt;
import natlab.tame.tir.TIRFunction;
import natlab.tame.valueanalysis.ValueAnalysis;
import natlab.tame.valueanalysis.components.shape.*;
import natlab.tame.valueanalysis.basicmatrix.BasicMatrixValue;
import natlab.tame.valueanalysis.aggrvalue.AggrValue;
import natlab.tame.valueanalysis.aggrvalue.CellValue;
import natlab.tame.valueanalysis.aggrvalue.CompositeValue;

public class Helper {
	/********************** HELPER METHODS ***********************************/
	static String getLHSType(ValueAnalysis<?> analysis, int graphIndex,
			TIRAbstractAssignStmt node, String SymbolMapKey) {
		// node.getTargetName().getID()
		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable())
			return analysis.getNodeList().get(graphIndex).getAnalysis()
					.getOutFlowSets().get(node).get(SymbolMapKey)
					.getMatlabClasses().toArray()[0].toString();
		else
			return "double";
		/**
		 * TODO check if there is something better than "double"
		 */

	}

	static String getArgumentType(ValueAnalysis<?> analysis, int graphIndex,
			TIRFunction node, String paramID) {
		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable())
			return analysis.getNodeList().get(graphIndex).getAnalysis()
					.getOutFlowSets().get(node).get(paramID).getMatlabClasses()
					.toArray()[0].toString();
		else
			return "double";
		/**
		 * TODO check if there is something better than "double"
		 */
	}

	// get analysis value for Function node
	static Collection<ClassReference> getAnalysisValue(
			ValueAnalysis<?> analysis, int graphIndex, TIRFunction node,
			String ID) {

		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable())
			return analysis.getNodeList().get(graphIndex).getAnalysis()
					.getOutFlowSets().get(node).get(ID).getMatlabClasses();
		else
			return null;

		// return
		// analysis.getOutFlowSets().get(node).get(paramID).getMatlabClasses().toArray()[0].toString();
	}

	// get analysis value for abstract assignment node
	static Collection<ClassReference> getAnalysisValue(
			ValueAnalysis<?> analysis, int graphIndex,
			TIRAbstractAssignStmt node, String ID) {
		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable())
			return analysis.getNodeList().get(graphIndex).getAnalysis()
					.getOutFlowSets().get(node).get(ID).getMatlabClasses();
		else
			return null;
		// return
		// analysis.getOutFlowSets().get(node).get(paramID).getMatlabClasses().toArray()[0].toString();
	}

	static Type getReturnType(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis,
			int graphIndex, TIRFunction node, String ID) {

		String retMClassName = ((BasicMatrixValue) (analysis.getNodeList()
				.get(graphIndex).getAnalysis().getOutFlowSets().get(node)
				.get(ID).getSingleton())).getMatlabClass().getName();

		return x10Mapping.getX10TypeMapping(retMClassName);

	}

	static  IDInfo generateIDInfo(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis,
			int graphIndex, TIRAbstractAssignStmt node, String ID) {

		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable()) {

			AggrValue<?> temp = ((analysis.getNodeList().get(graphIndex)
					.getAnalysis().getOutFlowSets().get(node).get(ID)
					.getSingleton()));
			IDInfo id_info = new IDInfo();
			if ((Object)temp instanceof BasicMatrixValue) {

				if (null != temp.getMatlabClass()) {
					id_info.setType(x10Mapping.getX10TypeMapping(temp
							.getMatlabClass().getName()));
				}
				if (null != ((BasicMatrixValue) ((Object)temp)).getShape()) {
					id_info.setShape((ArrayList<DimValue>) ((BasicMatrixValue) ((Object)temp))
							.getShape().getDimensions());
				}
				
				if (null != ((BasicMatrixValue) ((Object)temp)).getShape()) {
					
					if (null == id_info.getdidShapeChange()){
						id_info.setdidShapeChange(false);
					}
					else if (((ArrayList<DimValue>) ((BasicMatrixValue) ((Object)temp)).getShape().getDimensions()).size()
							!= id_info.getShape().size()){
						id_info.setdidShapeChange(true);
					}
					
				}
				if (null != ((BasicMatrixValue) ((Object)temp)).getisComplexInfo()) {
					id_info.setisComplex(((BasicMatrixValue) ((Object)temp))
							.getisComplexInfo().toString());
				}
			}
//			if (null != ((BasicMatrixValue) temp).getShape()){
//				id_info.setShape((ArrayList<DimValue>) ((BasicMatrixValue) temp).getShape()
//						.getDimensions());
//			}
//			if (null != ((BasicMatrixValue) temp).getisComplexInfo()){
//				id_info.setisComplex(((BasicMatrixValue) temp).getisComplexInfo().toString());
//			}
			
			if (temp instanceof CellValue){
				
				
				
				if (null != temp.getMatlabClass()) {
					id_info.setType(new Type("Any"));
					
					System.out.println(temp
							.getMatlabClass().getName()+"celllllllllllllllllllllllllllllllll");
				}

				
				/*TODO
				 * below hack assumes that cellArray is a vector. 
				 * fix it when cellvertcat is fixed
				 */
				int numCells = (((CellValue<?>) temp)).getValues().size();
				ArrayList<Integer> cellArraySize= new ArrayList<Integer>();
				cellArraySize.add(1);
				/*TODO - fixit 
				 * ugly hack until correct analysis
				 */
				if (numCells == 1 )
				{numCells+=1;}
				
				cellArraySize.add(numCells);
				id_info.setShape(cellArraySize);
				if (null != ((CellValue<?>) temp).getisComplexInfo()) {
					id_info.setisComplex(((CellValue<?>) temp)
							.getisComplexInfo().toString());
					
				}
			}
			
			id_info.setName(ID);

			return id_info;
		}

		else {
			return new IDInfo();
		}

	}

	static IDInfo generateIDInfo(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis,
			int graphIndex, TIRFunction node, String ID, int i) {

		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable()) {

			BasicMatrixValue temp = ((BasicMatrixValue) (analysis
					.getNodeList().get(graphIndex).getAnalysis().getArgs()
					.get(i)));
			// .getOutFlowSets().get(node).get(ID).getSingleton()));

			IDInfo id_info = new IDInfo();
			if (null != temp.getMatlabClass()) {
				// System.out.println("$$$$"+x10Mapping.getX10TypeMapping(temp
				// .getMatlabClass().getName()).getName());
				id_info.setType(x10Mapping.getX10TypeMapping(temp
						.getMatlabClass().getName()));
			}
			if (null != temp.getShape()) {
				id_info.setShape((ArrayList<DimValue>) temp.getShape()
						.getDimensions());
			}
			if (null != temp.getisComplexInfo()) {
				id_info.setisComplex(temp.getisComplexInfo().toString());
			}
			id_info.setName(ID);

			return id_info;
		}

		else {
			return new IDInfo();
		}

	}

	static IDInfo generateIDInfo(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis,
			int graphIndex, TIRForStmt node, String ID) {
		if (analysis.getNodeList().get(graphIndex).getAnalysis()
				.getOutFlowSets().get(node).isViable()) {
			BasicMatrixValue temp = ((BasicMatrixValue) (analysis
					.getNodeList().get(graphIndex).getAnalysis()
					.getOutFlowSets().get(node).get(ID).getSingleton()));

			System.err.println(temp.toString()+ ID);
			
			
			IDInfo id_info = new IDInfo();
			id_info.setType(x10Mapping.getX10TypeMapping(temp.getMatlabClass()
					.getName()));
			id_info.setShape((ArrayList<DimValue>) temp.getShape()
					.getDimensions());
			id_info.setisComplex(temp.getisComplexInfo().toString());

			return id_info;
		}

		else {
			return new IDInfo();
		}
	}

	public static boolean isScalar(ArrayList<?> shape) {
		if (shape != null) {
			for (int i = 0; i < shape.size(); i++) {
				if (null == shape.get(i)
						|| !("1").equals(shape.get(i).toString())) {
					return false;

				}
			}
		}
		return true;
	}

	public static boolean isReductionStmt(TIRAbstractAssignStmt node,
			IRx10ASTGenerator target, StmtBlock block) {
		// TODO Auto-generated method stub
		//TODO - important
		return false;
	}

	public static String MakeX10String(String nodeString) {
		String x10String = new String(nodeString);
		x10String.trim();
		System.err.println(x10String.startsWith("\'"));
		//nodeString.c
		String temp = "\'";
		if (x10String.startsWith("\'") && x10String.endsWith("\'")){
			
			x10String = x10String.substring(1, x10String.length() -1);
			
		}
		x10String = x10String.replace("\"", "\\\"");
		x10String = x10String.replace("\'\'", "\\\'");
		x10String = "\""+x10String+"\"";
		return x10String;
	}

}
