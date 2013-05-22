package natlab.backends.x10.codegen;

import ast.CellIndexExpr;
import ast.Expr;
import ast.ParameterizedExpr;
import natlab.backends.x10.IRx10.ast.ArrayAccess;
import natlab.backends.x10.IRx10.ast.ArraySetStmt;
import natlab.backends.x10.IRx10.ast.AssignStmt;
import natlab.backends.x10.IRx10.ast.DeclStmt;
import natlab.backends.x10.IRx10.ast.EmptyExp;
import natlab.backends.x10.IRx10.ast.Exp;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.Literally;
import natlab.backends.x10.IRx10.ast.MultiAssignLHS;
import natlab.backends.x10.IRx10.ast.RegionBuilder;
import natlab.backends.x10.IRx10.ast.SimpleArrayExp;
import natlab.backends.x10.IRx10.ast.Stmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.backends.x10.IRx10.ast.Type;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRArrayGetStmt;
import natlab.tame.tir.TIRCellArrayGetStmt;
import natlab.tame.tir.TIRCellArraySetStmt;

public class CellArrayGetSet {

	public static void handleTIRCellAbstractArrayGetStmt(
			TIRCellArrayGetStmt node, IRx10ASTGenerator target,
			StmtBlock block) {
		
		if (1 == (node).getTargets().asNameList().size()) {
			String LHS;
			boolean isDecl;
			target.symbolMapKey = (node).getTargetName().getID();
			LHS = target.symbolMapKey;

			if (true == target.symbolMap.containsKey(target.symbolMapKey)) {

				isDecl = false;
				AssignStmt list_single_assign_stmt = new AssignStmt();
				list_single_assign_stmt.setLHS(Helper.generateIDInfo(
						target.analysis, target.index, node, LHS));
				list_single_assign_stmt.getLHS().setName(
						((TIRAbstractAssignToListStmt) node).getTargets()
								.getChild(0).getVarName());

				setRHSValue(false, list_single_assign_stmt, node, false,
						target, block);
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
						(node).getTargets().getChild(0).getVarName());
				/*
				 * if it has a colon operator, add a null to the shape - this is
				 * a hack to tell the compiler that it is an array
				 */

				for (Exp i : Expressions.getArgs(node.getRHS(), target)) {
					if (i instanceof IDUse && ((IDUse) i).getID().equals("__")) {
						System.out
								.println("its a colon...............................");
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

				// if (target.currentBlock.size() > 1) {
				target.currentBlock.get(0).addStmt(pseudoDecl);
				setRHSValue(isDecl, decl_stmt, node, false, target, block);
				pseudoAssign.setRHS(decl_stmt.getRHS());
				block.addStmt(pseudoAssign);
				target.symbolMap.put(target.symbolMapKey, decl_stmt.getLHS());
				System.out.println(block.getParent().toString()
						+ "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
				// }
				//
				// else {
				// block.addStmt(decl_stmt);
				// target.symbolMap.put(target.symbolMapKey,
				// decl_stmt.getLHS());
				//
				// }

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
			TIRCellArrayGetStmt node, boolean isScalar, IRx10ASTGenerator target,
			StmtBlock block) {

		ArrayAccess arrayAccess = new ArrayAccess();
		arrayAccess.setArrayID(new IDUse(((CellIndexExpr) node.getRHS()).getTarget().getVarName()));
		
		arrayAccess.setIndicesList(Expressions.getArgs(node.getRHS(), target));

		RegionBuilder region = new RegionBuilder();
		region.setArrayID(arrayAccess.getArrayID());
		Exp i;
		boolean useregion = false;
		for (int j = 0; j < arrayAccess.getIndicesList().getNumChild(); j++) {
			i = arrayAccess.getIndicesList().getChild(j);
			/*
			 * Below is a very ugly hack to incorporate x:y type colon
			 * expressions in array access. TODO : Fix it
			 */
			if (target.symbolMap.containsKey(((IDUse) i).getID())
					&& !Helper.isScalar(target.symbolMap.get(
							(((IDUse) i).getID())).getShape())) {

				region.addLower(new IDUse(/*((IDUse) i).getID() +*/ "("

						+ ((IDUse) i).getID() + ".region.min(0)" + ")")); // MAKE
																			// SURE
																			// colon
																			// op
																			// returns
																			// array
																			// with
																			// indexing
																			// starting
																			// at
																			// 1

				region.addUpper(new IDUse(/*((IDUse) i).getID() +*/ "(" +

				// (target.symbolMap.get((((IDUse)i).getID())).getShape()).get(1)
						((IDUse) i).getID() + ".region.max(0)" + ")"));
				useregion = true;
			}

			else {
				region.addLower((IDUse) i);
				region.addUpper((IDUse) i);
			}
			if (i instanceof IDUse && ((IDUse) i).getID().equals("__")) {
				useregion = true;
			}
		}

		if (!useregion) {

			if (isDecl) {

				((DeclStmt) decl_or_assgn).setRHS(arrayAccess);
			} else {
				((AssignStmt) decl_or_assgn).setRHS(arrayAccess);
			}
		} else {
			DeclStmt pointDecl = new DeclStmt();
			pointDecl.setLHS(new IDInfo(new Type("Point"), "mix10_pt_"
					+ arrayAccess.getArrayID().getID(), null, null, null));
			pointDecl.setMutable(false);
			target.currentBlock.get(0).addStmt(pointDecl);
			StringBuffer x = new StringBuffer();
			if (/* region.getLower(0).equals(region.getUpper(0)) && */!region
					.getLower(0).getID().equals("__")) {
				x.append("1-(" + region.getLower(0).getID() + " as Int)");
			} else {
				x.append("0");
			}

			for (int u = 1; u < region.getLowerList().getNumChild(); u++) {
				if (/* region.getLower(u).equals(region.getUpper(u)) && */!region
						.getLower(u).getID().equals("__")) {
					x.append(", 1-(" + region.getLower(u).getID() + " as Int)");
				} else {
					x.append(", 0");
				}

			}
			block.addStmt(new Literally("mix10_pt_"
					+ arrayAccess.getArrayID().getID() + " = Point.make("
					+ x.toString() + ");\n"));
			if (isDecl) {

				((DeclStmt) decl_or_assgn).setRHS(region);
			} else {
				((AssignStmt) decl_or_assgn).setRHS(region);
			}

		}

	}
	
	
	
	

	public static void handleTIRCellAbstractArraySetStmt(
			TIRCellArraySetStmt node, IRx10ASTGenerator target,
			StmtBlock block) {

		String LHS;
		target.symbolMapKey = ((CellIndexExpr) node.getRHS()).getTarget().getVarName();
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
		boolean hasColon = false;
		for (int i = 0; i < node.getIndizes().getNumChild(); i++) {
			array_set.setIndices(Expressions.makeIRx10Exp(node.getIndizes()
					.getChild(i), false, target), i);
			if (((IDUse) (array_set.getIndices(i))).getID().equals("__")) {
				hasColon = true;
			}
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
		// TODO - Below is a dirty hack to
		// manage colon expression in array set statement
		// need to make it proper

		if (!hasColon)
			block.addStmt(array_set);
		else {
			Literally pointLoop = new Literally();
			pointLoop.setVerbatim("for (p in "
					+ ((IDUse) array_set.getRHS()).getID() + ".region)\n");
			StringBuffer x = new StringBuffer();
			StringBuffer pt = new StringBuffer();
			String rhsID = ((IDUse) array_set.getRHS()).getID();

			if (((IDUse) array_set.getIndices(0)).getID().equals("__")) {
				pt.append("(" + rhsID + ".region.min(" + Integer.toString(0)
						+ ")-1) as Int");
			} else {
				Exp i = array_set.getIndices(0);
				if (target.symbolMap.containsKey(((IDUse) i).getID())
						&& !Helper.isScalar(target.symbolMap.get(
								(((IDUse) i).getID())).getShape())) {
					pt.append("(" + ((IDUse) i).getID() + "("
							+ ((IDUse) i).getID() + ".region.min(0)"
							+ ") -1) as Int");
				} else {
					pt.append("(" + ((IDUse) i).getID() + "-1) as Int");
				}
			}

			for (int j = 1; j < array_set.getIndicesList().getNumChild(); j++) {
				if (((IDUse) array_set.getIndices(j)).getID().equals("__")) {
					pt.append(", (" + rhsID + ".region.min("
							+ Integer.toString(j) + ")-1) as Int");
				} else {
					Exp i = array_set.getIndices(j);
					if (target.symbolMap.containsKey(((IDUse) i).getID())
							&& !Helper.isScalar(target.symbolMap.get(
									(((IDUse) i).getID())).getShape())) {
						pt.append(", (" + ((IDUse) i).getID() + "("
								+ ((IDUse) i).getID() + ".region.min(0)"
								+ ") -1) as Int");
					} else {
						pt.append(", (" + ((IDUse) i).getID() + "-1) as Int");
					}
				}
			}

			x.append(array_set.getLHS().getName() + "(p.operator+(Point.make("
					+ pt.toString() + ")))= ");
			x.append(((IDUse) array_set.getRHS()).getID() + "(p);\n");
			block.addStmt(new Literally(x.toString()));
		}


	}

	public static Exp createCellArray(Expr rhs, IRx10ASTGenerator target) {
		// TODO Auto-generated method stub

		SimpleArrayExp cellArray = new SimpleArrayExp();
		cellArray.setType(new Type("Any"));
		List<Exp> values = new List<Exp>();
		for (int i = 0; i < ((ast.ParameterizedExpr) rhs).getArgs()
				.getNumChild(); i++) {

			values.add(Expressions.makeIRx10Exp(
					((ParameterizedExpr) rhs).getArg(i), false, target));
		}
		cellArray.setValuesList(values);
		/*
		 * TODO add points when cellvertcat is implemented
		 */
		return cellArray;
	}

}
