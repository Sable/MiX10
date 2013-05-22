package natlab.backends.x10.codegen;

import natlab.backends.x10.IRx10.ast.ContinueStmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.tame.tir.TIRContinueStmt;

public class LoopContinue {
	public static void handleTIRContinueStmt(TIRContinueStmt node,
			IRx10ASTGenerator target, StmtBlock block) {
		block.addStmt(new ContinueStmt());
		
	}
}
