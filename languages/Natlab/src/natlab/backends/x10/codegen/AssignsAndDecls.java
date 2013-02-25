package natlab.backends.x10.codegen;

import java.util.ArrayList;

import natlab.backends.x10.IRx10.ast.*;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRAbstractAssignToVarStmt;
import natlab.tame.tir.TIRAbstractCreateFunctionHandleStmt;
import natlab.tame.tir.TIRArraySetStmt;
import natlab.tame.tir.TIRAssignLiteralStmt;
import natlab.tame.tir.TIRCallStmt;
import natlab.tame.tir.TIRCopyStmt;
import natlab.tame.valueanalysis.components.shape.ShapeFactory;
import ast.Expr;
import ast.FPLiteralExpr;
import ast.IntLiteralExpr;
import ast.ParameterizedExpr;
import ast.StringLiteralExpr;

public class AssignsAndDecls {

	public static void handleTIRAbstractAssignToVarStmt(
			TIRAbstractAssignStmt node, IRx10ASTGenerator target,
			StmtBlock block) {
		boolean isDecl;
		String LHS;
		target.symbolMapKey = ((TIRAbstractAssignToVarStmt) node)
				.getTargetName().getID();
		LHS = target.symbolMapKey;
		/*
		 * If checks whether it is already defined, in which case it's
		 * assignment otherwise it's a declaration
		 */
		if (true == target.symbolMap.containsKey(target.symbolMapKey)) {
			isDecl = false;
			AssignStmt assign_stmt = new AssignStmt();
			// IDInfo LHSinfo = new IDInfo();
			// assign_stmt.setLHS(LHSinfo);
			assign_stmt.setLHS(Helper.generateIDInfo(target.analysis,
					target.index, node, LHS));
			assign_stmt.getLHS().setName(
					((TIRAbstractAssignToVarStmt) node).getTargetName().getID()
							.toString());
			
			
			boolean tf = true;
			if (null != assign_stmt.getLHS().getShape())
			for (int i = 0; i < assign_stmt.getLHS().getShape().size(); i++) {
				if (null != assign_stmt.getLHS().getShape().get(i))
					tf &= ("1").equals(assign_stmt.getLHS().getShape().get(i)
					.toString());
			}
			
			//tf=true => scalar
			target.symbolMap.put(target.symbolMapKey, assign_stmt.getLHS());
			setRHSValue(isDecl, assign_stmt, node, tf, target);
			
			
			
			block.addStmt(assign_stmt);
			target.symbolMap.put(target.symbolMapKey, assign_stmt.getLHS());
			// TODO : Handle expressions of various types
			// Set parent's value in various expressions
		} else {
			isDecl = true;
			DeclStmt decl_stmt = new DeclStmt();
			
			IDInfo LHSinfo = new IDInfo();
			decl_stmt.setLHS(Helper.generateIDInfo(target.analysis,
					target.index, node, LHS));

			decl_stmt.getLHS().setName(((TIRAbstractAssignToVarStmt)node).getLHS().getVarName());
			
			boolean tf = true;
			if (null != decl_stmt.getLHS().getShape()){
			for (int i = 0; i < decl_stmt.getLHS().getShape().size(); i++) {
				if (null != decl_stmt.getLHS().getShape().get(i))
					tf &= ("1").equals(decl_stmt.getLHS().getShape().get(i)
					.toString());
			}
			}
	
			setRHSValue(isDecl, decl_stmt, node, tf, target);
			
			
//			
			
//			//block.addStmt(pseudoAssign);
//			
//	        
			if (target.currentBlock.size()>1 ){
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
				DeclStmt pseudoDecl = new DeclStmt();
				pseudoDecl.setLHS(decl_stmt.getLHS());
				target.currentBlock.get(0).addStmt(pseudoDecl);
				
				
				AssignStmt pseudoAssign = new AssignStmt();
				
				pseudoAssign.setLHS(decl_stmt.getLHS());
				pseudoAssign.setRHS(decl_stmt.getRHS());
				block.addStmt(pseudoAssign);
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
				
				//System.out.println(block.getParent().getParent().toString()+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
				
				//target.currentBlock.get(target.currentBlock.size()-1).addStmt(decl_stmt);
			}
//			
			else {
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
				block.addStmt(decl_stmt);
				
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
			}
			

		}

	}

	public static void setRHSValue(boolean isDecl, Stmt decl_or_assgn,
			TIRAbstractAssignStmt node, boolean isScalar, IRx10ASTGenerator target) {
		
		
		if (isDecl) {
		
			((DeclStmt) decl_or_assgn).setRHS(Expressions.makeIRx10Exp(node
					.getRHS(), isScalar, target));
		} else {
			((AssignStmt) decl_or_assgn).setRHS(Expressions.makeIRx10Exp(node
					.getRHS(), isScalar, target));
		}
		

	}
	
	
	
	

	public static void handleTIRAbstractAssignToListStmt(
			TIRAbstractAssignStmt node, IRx10ASTGenerator target,
			StmtBlock block) {

			
		if (1 == ((TIRAbstractAssignToListStmt) node).getTargets().asNameList()
				.size()) {
			String LHS;
			boolean isDecl;
			target.symbolMapKey = ((TIRAbstractAssignToListStmt) node)
					.getTargetName().getID();
			LHS = target.symbolMapKey;

			
			if (true == target.symbolMap.containsKey(target.symbolMapKey)) {
				
				
				isDecl = false;
				// IDInfo LHSinfo = new IDInfo();
				// assign_stmt.setLHS(LHSinfo);
				AssignStmt list_single_assign_stmt = new AssignStmt();
				list_single_assign_stmt.setLHS(Helper.generateIDInfo(target.analysis,
						target.index, node, LHS));
				list_single_assign_stmt.getLHS().setName(
						((TIRAbstractAssignToListStmt) node).getTargets().getChild(0).getVarName());
				
				setRHSValue(false, list_single_assign_stmt, node, false, target);
				target.symbolMap.put(target.symbolMapKey, list_single_assign_stmt.getLHS());
				
				System.out.println("#####!"+target.symbolMapKey);
				
				
				
				block.addStmt(list_single_assign_stmt);
				target.symbolMap.put(target.symbolMapKey, list_single_assign_stmt.getLHS());

			} else {
				isDecl = true;
				DeclStmt decl_stmt = new DeclStmt();
				IDInfo LHSinfo = new IDInfo();
				decl_stmt.setLHS(Helper.generateIDInfo(target.analysis,
						target.index, node, LHS));

				decl_stmt.getLHS().setName(((TIRAbstractAssignToListStmt)node).getTargets().getChild(0).getVarName());
				
				setRHSValue(isDecl, decl_stmt, node, false, target);
				
				System.out.println("#####!"+target.symbolMapKey);
				
				//block.addStmt(decl_stmt);
				
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
				DeclStmt pseudoDecl = new DeclStmt();
				pseudoDecl.setLHS(decl_stmt.getLHS());
//				
				AssignStmt pseudoAssign = new AssignStmt();
				pseudoAssign.setLHS(decl_stmt.getLHS());
				pseudoAssign.setRHS(decl_stmt.getRHS());
//				//block.addStmt(pseudoAssign);
//				
//		        
				if (target.currentBlock.size()>1 ){
					target.currentBlock.get(0).addStmt(pseudoDecl);
					
					block.addStmt(pseudoAssign);
					target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
					//target.currentBlock.get(target.currentBlock.size()-1).addStmt(decl_stmt);
					
					System.out.println(block.getParent().toString()+"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
				}
//				
				else {
					block.addStmt(decl_stmt);
					target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
					
				}
					

			}

		}

		else { //this branch handles the case with multiple targets on LHS
			AssignStmt list_assign_stmt = new AssignStmt();
			MultiAssignLHS LHSinfo = new MultiAssignLHS();
			list_assign_stmt.setMultiAssignLHS(LHSinfo);
			String multiVarName="";
			for (ast.Name name : ((TIRAbstractAssignToListStmt) node)
					.getTargets().asNameList()) {
				list_assign_stmt.getMultiAssignLHS()
				.addIDInfo(
						Helper.generateIDInfo(target.analysis, target.index,
								node, name.getID()));
				if (! target.symbolMap.containsKey(name.getID())){
					DeclStmt partDeclStmt = new DeclStmt();
					partDeclStmt.setLHS(Helper.generateIDInfo(target.analysis, target.index,
						node, name.getID()));
					
					target.currentBlock.get(0).addStmt(partDeclStmt);
				target.symbolMap.put(name.getID(),partDeclStmt.getLHS() );
				}
				
				multiVarName=multiVarName+"_"+name.getID();
				
			}
			
			DeclStmt superDeclStmt = new DeclStmt();
			superDeclStmt.setLHS(new IDInfo(null,null,null,null,null));
			superDeclStmt.getLHS().setName(multiVarName);
			ShapeFactory s = new ShapeFactory();
			ArrayList<String> list_dims = new ArrayList<String>();
			list_dims.add("1");
			int num = ((TIRAbstractAssignToListStmt)node).getNumTargets();
			
			list_dims.add(Integer.toString(num));
			superDeclStmt.getLHS().setShape((list_dims));
			superDeclStmt.getLHS().setType(new Type("Any"));
			
			/*
			 * Create a new assignment node of type
			 * new_var_name = new Array[Any](RHSexpression);
			 * Then create several array access statements 
			 * for each element of the LHS list 
			 */
			
			
			System.out.println("^*^"+list_assign_stmt.getMultiAssignLHS().getIDInfoList().getNumChild());
			list_assign_stmt.setLHS(null);
			setRHSValue(false, list_assign_stmt, node, false, target);
			block.addStmt(list_assign_stmt);
		}

	}

	// This version handles assignment to multiple variables
//	public static void handleTIRAbstractAssignToListVarStmt(
//			TIRAbstractAssignStmt node, ast.Name name,
//			IRx10ASTGenerator target, AssignStmt assign_stmt) {
//		String LHS;
//		target.symbolMapKey = name.getID();
//		LHS = target.symbolMapKey;
//		/**
//		 * As of now(sep 17, 2012) just create an assignment node with
//		 * MultiAssignLHS and a single RHS Change if we really need declaration
//		 * for such case OR just pretty print as declaration in X10 code
//		 */
//
//		
//		 if (true == target.symbolMap.containsKey(LHS)) // variable already // defined and analyzed
//		 {
//		
//		MultiAssignLHS LHSinfo = new MultiAssignLHS();
//		assign_stmt.setMultiAssignLHS(LHSinfo);
//
//		assign_stmt.getMultiAssignLHS()
//				.addIDInfo(
//						Helper.generateIDInfo(target.analysis, target.index,
//								node, LHS));
//		target.symbolMap.put(LHS,Helper.generateIDInfo(target.analysis, target.index,
//				node, name.getID()) );
//		assign_stmt
//				.getMultiAssignLHS()
//				.getIDInfo(assign_stmt.getMultiAssignLHS().getNumIDInfo() - 1)
//				.setName(
//						((TIRAbstractAssignToListStmt) node).getTargetName()
//								.toString());
//
//		 }
//		 
//
//	}

	public static void handleTIRAbstractAssignToVarStmtPass1(
			TIRAbstractAssignStmt node, collectBuiltins collectBuiltins) {
		System.out.println("comes in here 1");
		Expr expression = node.getRHS();
		if (expression instanceof ParameterizedExpr) {
			System.out.println("comes in here ");
			collectBuiltins.usedBuiltins.put(expression.getVarName(),null);
		}
		
		
		
	}

	public static void handleTIRAbstractAssignToListStmtPass1(
			TIRAbstractAssignStmt node, collectBuiltins collectBuiltins) {
		Expr expression = node.getRHS();
		if (expression instanceof ParameterizedExpr) {
			collectBuiltins.usedBuiltins.put(expression.getVarName(),null);
		}
		
	}

	

}
