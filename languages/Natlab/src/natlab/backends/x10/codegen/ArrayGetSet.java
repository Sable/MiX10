package natlab.backends.x10.codegen;

import ast.ParameterizedExpr;
import natlab.backends.x10.IRx10.ast.*;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRAbstractAssignToVarStmt;
import natlab.tame.tir.TIRArrayGetStmt;
import natlab.tame.tir.TIRArraySetStmt;

public class ArrayGetSet {

	public static void handleTIRAbstractArraySetStmt(TIRArraySetStmt node,
			IRx10ASTGenerator target, StmtBlock block) {

		System.out.println(node.getIndizes().getChild(0));
		System.out.println(node.getLHS().getPrettyPrinted()
				+ "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		// System.out.println(node.getTargetName().getID());

		String LHS;
		target.symbolMapKey = node.getArrayName().getID();
		LHS = target.symbolMapKey;

		if (true != target.symbolMap.containsKey(target.symbolMapKey)) {
			DeclStmt array_decl = new DeclStmt();
			IDInfo LHSinfo = new IDInfo();
			array_decl.setLHS(Helper.generateIDInfo(target.analysis,
					target.index, node, LHS));

			array_decl.getLHS().setName(LHS);
			array_decl.setRHS(new EmptyExp());
			target.symbolMap.put(target.symbolMapKey, array_decl.getLHS());
			block.addStmt(array_decl);

		}
		/**
		 * The array has been declared before. This is just an assignment to its
		 * index. If not declared before first declare the array and then set
		 * the index
		 */
		ArraySetStmt array_set = new ArraySetStmt();
		array_set.setLHS(Helper.generateIDInfo(target.analysis, target.index,
				node, LHS));
		array_set.getLHS().setName(LHS.toString());

		for (int i = 0; i < node.getIndizes().getNumChild(); i++) {
			array_set.setIndices(Expressions.makeIRx10Exp(node.getIndizes()
					.getChild(i), false, target), i);
		}

		target.symbolMap.put(target.symbolMapKey, array_set.getLHS());

		// array_set.getLHS()
		// .setValue(
		// new ArrayAccess(new IDUse(LHS), Expressions.getArgs(node.getLHS(),
		// target))
		// );

		boolean tf = true;
		if (null != array_set.getLHS().getShape())
			for (int i = 0; i < array_set.getLHS().getShape().size(); i++) {
				if (null != array_set.getLHS().getShape().get(i))
					tf &= ("1").equals(array_set.getLHS().getShape().get(i)
							.toString());
			}
		array_set.setRHS(Expressions.makeIRx10Exp(node.getRHS(), tf, target));

		// System.out.println(((IDUse)
		// ((ArrayAccess)array_set.getLHS().getValue()).getIndices(0)).getID()+"%%");

		block.addStmt(array_set);

	}

	public static void handleTIRAbstractArrayGetStmt(TIRArrayGetStmt node,
			IRx10ASTGenerator target, StmtBlock block) {
		if (1 == ( node).getTargets().asNameList()
				.size()) {
			String LHS;
			boolean isDecl;
			target.symbolMapKey = (node)
					.getTargetName().getID();
			LHS = target.symbolMapKey;

			if (true == target.symbolMap.containsKey(target.symbolMapKey)) {

				isDecl = false;
				AssignStmt list_single_assign_stmt = new AssignStmt();
				list_single_assign_stmt.setLHS(Helper.generateIDInfo(
						target.analysis, target.index, node, LHS));
				list_single_assign_stmt.getLHS().setName(
						((TIRAbstractAssignToListStmt) node).getTargets()
								.getChild(0).getVarName());

				setRHSValue(false, list_single_assign_stmt, node, false, target, block);
				target.symbolMap.put(target.symbolMapKey,
						list_single_assign_stmt.getLHS());

				System.out.println("#####!" + target.symbolMapKey);

				block.addStmt(list_single_assign_stmt);

			} else {
				isDecl = true;
				DeclStmt decl_stmt = new DeclStmt();
				IDInfo LHSinfo = new IDInfo();
				decl_stmt.setLHS(Helper.generateIDInfo(target.analysis,
						target.index, node, LHS));

				decl_stmt.getLHS().setName(
						( node).getTargets()
								.getChild(0).getVarName());
				/*
				 * if it has a colon operator,
				 * add a null to the shape - this is a hack to tell the 
				 * compiler that it is an array
				 * 
				 */
			
				
				for(Exp i: Expressions.getArgs(node.getRHS(), target)){
					if(i instanceof IDUse && ((IDUse)i).getID().equals("__")){ 
						System.out.println("its a colon...............................");
						decl_stmt.getLHS().getShape().add(null);
					}
				}
				
				System.out.println("#####!" + target.symbolMapKey);

				// block.addStmt(decl_stmt);

				DeclStmt pseudoDecl = new DeclStmt();
				pseudoDecl.setLHS(decl_stmt.getLHS());
				//
				AssignStmt pseudoAssign = new AssignStmt();
				pseudoAssign.setLHS(decl_stmt.getLHS());
				
//								if (target.currentBlock.size() > 1) {
					target.currentBlock.get(0).addStmt(pseudoDecl);
					setRHSValue(isDecl, decl_stmt, node, false, target, block);
					pseudoAssign.setRHS(decl_stmt.getRHS());
					block.addStmt(pseudoAssign);
					target.symbolMap.put(target.symbolMapKey,
							decl_stmt.getLHS());
					System.out.println(block.getParent().toString()
							+ "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
//				}
				//
//				else {
//					block.addStmt(decl_stmt);
//					target.symbolMap.put(target.symbolMapKey,
//							decl_stmt.getLHS());
//
//				}

			}

		}

		else {
			AssignStmt list_assign_stmt = new AssignStmt();
			MultiAssignLHS LHSinfo = new MultiAssignLHS();
			list_assign_stmt.setMultiAssignLHS(LHSinfo);
			for (ast.Name name : ((TIRAbstractAssignToListStmt) node)
					.getTargets().asNameList()) {
					System.out.println("^^" + name.getID());
				list_assign_stmt.getMultiAssignLHS().addIDInfo(
						Helper.generateIDInfo(target.analysis, target.index,
								node, name.getID()));
				target.symbolMap.put(name.getID(), Helper.generateIDInfo(
						target.analysis, target.index, node, name.getID()));

			}
			System.out.println("^*^"
					+ list_assign_stmt.getMultiAssignLHS().getIDInfoList()
							.getNumChild());
			list_assign_stmt.setLHS(null);
			setRHSValue(false, list_assign_stmt, node, false, target, block);
			block.addStmt(list_assign_stmt);
		}

	}
	
	
	public static void setRHSValue(boolean isDecl, Stmt decl_or_assgn,
			TIRArrayGetStmt node, boolean isScalar, IRx10ASTGenerator target, StmtBlock block) {
		
		ArrayAccess arrayAccess = new ArrayAccess();
		arrayAccess.setArrayID(new IDUse(node.getRHS().getVarName()));
		arrayAccess.setIndicesList(Expressions.getArgs(node.getRHS(), target));
		
		RegionBuilder region = new RegionBuilder();
		region.setArrayID(arrayAccess.getArrayID());
		Exp i;
		boolean useregion=false;
		for(int j=0; j<arrayAccess.getIndicesList().getNumChild(); j++){
			i=arrayAccess.getIndicesList().getChild(j);
			region.addLower((IDUse) i);
			region.addUpper((IDUse)i);
			if(i instanceof IDUse && ((IDUse)i).getID().equals("__")){ 
				useregion=true;
			}
		}
		
		if(!useregion){
		
		if (isDecl) {
			
			((DeclStmt) decl_or_assgn).setRHS(arrayAccess);
		} else {
			((AssignStmt) decl_or_assgn).setRHS(arrayAccess);
		}
		}
		else {
			if (isDecl) {
				
				((DeclStmt) decl_or_assgn).setRHS(region);
			} else {
				((AssignStmt) decl_or_assgn).setRHS(region);
			}
			
		}
		
		
		
		

	}
	

	
	// This version handles assignment to multiple variables
	public static void handleTIRAbstractAssignToListVarStmt(
			TIRAbstractAssignStmt node, ast.Name name,
			IRx10ASTGenerator target, AssignStmt assign_stmt) {
		String LHS;
		target.symbolMapKey = name.getID();
		LHS = target.symbolMapKey;

		if (true == target.symbolMap.containsKey(LHS)) // variable already //
														// defined and analyzed
		{

			MultiAssignLHS LHSinfo = new MultiAssignLHS();
			assign_stmt.setMultiAssignLHS(LHSinfo);

			assign_stmt.getMultiAssignLHS().addIDInfo(
					Helper.generateIDInfo(target.analysis, target.index, node,
							LHS));
			target.symbolMap.put(LHS, Helper.generateIDInfo(target.analysis,
					target.index, node, name.getID()));
			assign_stmt
					.getMultiAssignLHS()
					.getIDInfo(
							assign_stmt.getMultiAssignLHS().getNumIDInfo() - 1)
					.setName(
							((TIRAbstractAssignToListStmt) node)
									.getTargetName().toString());

		}

	}

}
