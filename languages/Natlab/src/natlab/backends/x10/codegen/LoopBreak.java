package natlab.backends.x10.codegen;

import natlab.backends.x10.IRx10.ast.BreakStmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.tame.tir.TIRBreakStmt;

public class LoopBreak {

	public static void handleTIRBreakStmt(TIRBreakStmt node,
			IRx10ASTGenerator target, StmtBlock block) {
		block.addStmt(new BreakStmt());
		
	}

}
