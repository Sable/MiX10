package natlab.backends.x10.codegen;

import java.util.ArrayList;
import java.util.UUID;

import natlab.backends.x10.IRx10.ast.AssignStmt;
import natlab.backends.x10.IRx10.ast.DeclStmt;
import natlab.backends.x10.IRx10.ast.ForStmt;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.IDUse;
import natlab.backends.x10.IRx10.ast.IncExp;
import natlab.backends.x10.IRx10.ast.LEExp;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.LoopBody;
import natlab.backends.x10.IRx10.ast.Stmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.backends.x10.IRx10.ast.Type;
import natlab.tame.tir.TIRForStmt;
import natlab.tame.tir.TIRNode;
import natlab.tame.valueanalysis.components.shape.ShapeFactory;
import ast.RangeExpr;

public class ForLoopStmt {
	public static void handleTIRForStmt(TIRForStmt node,
			IRx10ASTGenerator target, StmtBlock block) {

		ForStmt for_stmt = new ForStmt();
		if (target.parforSwitch == true){
			for_stmt.setisParfor(true);
			//target.parforSwitch = false;
		}
		else{
			for_stmt.setisParfor(false);
		}
		AssignStmt for_assign = new AssignStmt();

		IDInfo LHSinfo = new IDInfo(new Type("Double"), node.getAssignStmt()
				.getLHS().getVarName(), null, false, null, null);
		
		LHSinfo = (Helper.generateIDInfo(target.analysis,
				target.index, node, node.getAssignStmt()
				.getLHS().getVarName()));
		ShapeFactory sf = new ShapeFactory();
		/*
		 * TODO
		 * below is a hack assuming for loop index will be a scalar.
		 * use range value analysis later on
		 */
		ArrayList<Integer> s = new ArrayList<Integer>();
		s.add(1);
		s.add(1);
		LHSinfo.setShape(s);
		/*
		 * LHSinfo = Helper.generateIDInfo(target.analysis, target.index, node,
		 * node.getVarName());
		 */
		// System.out.println(LHSinfo.getName()+LHSinfo.getisComplex());

		for_assign.setLHS(LHSinfo);
		for_assign.getLHS().setName(node.getAssignStmt().getLHS().getVarName());
		IDUse lower = new IDUse(((RangeExpr) (node.getAssignStmt().getRHS()))
				.getLower().getVarName());
		for_stmt.setLower(lower);
		IDUse upper = new IDUse(((RangeExpr) (node.getAssignStmt().getRHS()))
				.getUpper().getVarName());
		for_stmt.setUpper(upper);
		
		IDUse increment;
		if(((RangeExpr) (node.getAssignStmt().getRHS())).hasIncr())
		{
			increment = new IDUse(((RangeExpr) (node.getAssignStmt().getRHS())).getIncr().getVarName());
		}
		else{
			increment = new IDUse("1");
		}
		for_stmt.setIncr(increment);
		/*
		 * uncomment below If after fixing the following TODO getIncr throws
		 * errors sometimes. Look into it and fix it ....till then using "1"
		 * temporarily
		 */
		// if(null != ((RangeExpr)(node.getAssignStmt().getRHS())).getIncr())
		// increment= new
		// IDUse(((RangeExpr)(node.getAssignStmt().getRHS())).getIncr().getVarName());//

		for_assign.setRHS(lower);
		for_stmt.setAssignStmt(for_assign);
		DeclStmt TempDeclStmt = new DeclStmt();
		TempDeclStmt.setLHS(for_assign.getLHS());
		block.addStmt(TempDeclStmt);
		target.symbolMap.put(LHSinfo.getName(), LHSinfo);
		for_stmt.setCondition(new LEExp(
				new IDUse(for_assign.getLHS().getName()), upper));
		/*
		 * TODO : Handle case when lower > upper !!
		 */
		for_stmt.setStepper(new IncExp(
				new IDUse(for_assign.getLHS().getName()), increment));
		for_stmt.setLoopBody(new LoopBody(new List<Stmt>()));
		LoopBody loop_body_block = for_stmt.getLoopBody();
		target.currentBlock.add(loop_body_block);
		buildStmtsSubAST(node.getStmts(), target);
		
		
		block.addStmt(fixLoopVar(for_stmt, block, target));
			if (target.parforSwitch == true){
			//for_stmt.setisParfor(true);
			target.parforSwitch = false;
			}
		target.currentBlock.remove(loop_body_block);

}
		// System.out.println(loop_body_block.getStmts().getNumChild());
	

	private static ForStmt fixLoopVar(ForStmt for_stmt, StmtBlock block, IRx10ASTGenerator target) {

		boolean FixIt = false;
		for (Stmt stmt : for_stmt.getLoopBody().getStmtList()) {
			if (stmt instanceof AssignStmt
					&& ((AssignStmt) stmt).getLHS() != null) {
				if (((AssignStmt) stmt).getLHS().getName()
						.equals(for_stmt.getAssignStmt().getLHS().getName())) {
					FixIt = true;

				}
			}
		}
		
		if (FixIt) {
			// rename loop variable
			// assign old loop var to new one
			String randomizer = UUID.randomUUID().toString();
			DeclStmt InsertDeclStmt = new DeclStmt();
			IDInfo temp = for_stmt.getAssignStmt().getLHS();
			InsertDeclStmt.setLHS(new IDInfo(temp.getType(), temp.getName(), null,
					false, null, null));
			InsertDeclStmt.setRHS(new IDUse(for_stmt.getAssignStmt().getLHS()
					.getName()
					+ "_x10"+randomizer));
			for_stmt.getLoopBody().getStmtList().insertChild(InsertDeclStmt, 0);
			for_stmt.getAssignStmt()
					.getLHS()
					.setName(
							for_stmt.getAssignStmt().getLHS().getName()
									+ "_x10"+randomizer);
			((IDUse) (((LEExp) (for_stmt.getCondition())).getLeftOp()))
					.setID(for_stmt.getAssignStmt().getLHS().getName());
			((IDUse) (((IncExp) (for_stmt.getStepper())).getLeftOp()))
					.setID(for_stmt.getAssignStmt().getLHS().getName());
		}
		int i = 0;
		return for_stmt;

	}

	private static void buildStmtsSubAST(ast.List<ast.Stmt> stmts,
			IRx10ASTGenerator target) {
		for (ast.Stmt stmt : stmts) {
			((TIRNode) stmt).tirAnalyze(target);
		}
	}
}
