package natlab.backends.x10.codegen;

import java.util.ArrayList;

import ast.Name;
//import natlab.backends.x10.IRx10.ast.Args;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.MethodBlock;
import natlab.backends.x10.IRx10.ast.MethodHeader;
import natlab.backends.x10.IRx10.ast.ReturnStmt;
import natlab.backends.x10.IRx10.ast.Stmt;
import natlab.backends.x10.IRx10.ast.Type;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRFunction;
import natlab.tame.tir.TIRNode;

public class Function {

	static void handleTIRFunction(TIRFunction node, IRx10ASTGenerator target) {
		ArrayList<String> inArgs = new ArrayList<String>();
	
		List<IDInfo> arguments = new List<IDInfo>();
		Name param;
		MethodHeader method_header = new MethodHeader();
		method_header.setName(node.getName());
		method_header.setReturnType(null);
		System.out.println("###"+node.getInputParams().getNumChild());
		
		for (int i=0; i<node.getInputParams().getNumChild();i++) {
			
			param = node.getInputParams().getChild(i);
//			arguments.add(new Args(x10Mapping.getX10TypeMapping(Helper
//					.getArgumentType(target.analysis, target.index, node,
//							param.getID())), param.getPrettyPrinted()));
			arguments.add(Helper.generateIDInfo(target.analysis,
					target.index, node, param.getID(),i));
			
			System.out.println((Helper.generateIDInfo(target.analysis,
					target.index, node, param.getID(),i)).getisComplex()+"@@@@");
			target.symbolMap.put(param.getID().toString(), Helper.generateIDInfo(target.analysis,
					target.index, node, param.getID(),i));
		}
		method_header.setArgsList(arguments);
		MethodBlock method_block = new MethodBlock(new List<Stmt>());
		target.method.setMethodHeader(method_header);
		target.method.setMethodBlock(method_block);
		target.currentBlock.add(target.method.getMethodBlock());
		/* TODO
		 * Below statement handles the case when there is only one return value.
		 * extend it to support multiple returns
		 * Add a return type stmt with a list of return values
		 */
		System.out.println(node.getNodeString());
		if (null != node.getOutputParams() && node.getOutputParams().getNumChild()>0){
		Type returnType = Helper.getReturnType(target.analysis, target.index, node, node.getOutputParam(0).getID());
		target.method.getMethodHeader().setReturnType(returnType);
		}
		
		//DEBUG
		//System.out.println(returnType.getName());
		buildStmtsSubAST(node.getStmts(), target);
		//make return statement
		
			ReturnStmt returnStmt = new ReturnStmt();
			for (int i=0; i<node.getNumOutputParam();i++){
				returnStmt.addReturnVal(new IDUse(node.getOutputParam(i).getID()));
			}
			
			target.method.getMethodBlock().addStmt(returnStmt);
			
		
		System.out.println(target.method.getMethodHeader().getName());
		System.out.println(target.method.getMethodBlock().getNumStmt());

	}

	private static void buildStmtsSubAST(ast.List<ast.Stmt> stmts,
			IRx10ASTGenerator target) {
		for (ast.Stmt stmt : stmts) {
			((TIRNode) stmt).tirAnalyze(target);
		}
	}
}
