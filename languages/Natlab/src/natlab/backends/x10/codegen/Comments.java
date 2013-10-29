package natlab.backends.x10.codegen;

import natlab.backends.x10.IRx10.ast.AsyncBlock;
import natlab.backends.x10.IRx10.ast.AsyncStmt;
import natlab.backends.x10.IRx10.ast.AtomicStmt;
import natlab.backends.x10.IRx10.ast.BlockEnd;
import natlab.backends.x10.IRx10.ast.CommentStmt;
import natlab.backends.x10.IRx10.ast.FinishStmt;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.Literally;
import natlab.backends.x10.IRx10.ast.Stmt;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.backends.x10.IRx10.ast.WhenStmt;
import natlab.tame.tir.TIRCommentStmt;
import natlab.tame.tir.TIRForStmt;

public class Comments {

	public static StmtBlock currentStmtBlock;
	public static void handleTIRComment(TIRCommentStmt node,
			IRx10ASTGenerator target, StmtBlock block) {
		
		int isConcStmt  = isWhichCommentConcStmt(node.getNodeString());
		if (isConcStmt == -1){
		CommentStmt comment = new CommentStmt();
		comment.setComment(node.getNodeString());
		block.addStmt(comment);
		}
		
		else{
			switch (isConcStmt){
			case 1:
				AsyncStmt asyncStmt = new AsyncStmt();
				//asyncStmt.setAsyncBlock(new AsyncBlock(new List<Stmt>()));
				//setCurrentStmt(asyncStmt.getAsyncBlock());
				//StmtBlock concBlock = asyncStmt.getAsyncBlock();
				block.addStmt(asyncStmt);
				break;
				
			case 2:
				FinishStmt finishStmt = new FinishStmt();
				block.addStmt(finishStmt);
				break;
				
			case 3: 
				AtomicStmt atomicStmt = new AtomicStmt();
				block.addStmt(atomicStmt);
				break;
				
			case 4:
				//currently When assumes just a single
				//boolean variable for guard which is 
				//defined by the user before when stmt.
				//This is very stupid !
				//**FIXIT** 
				WhenStmt whenStmt = new WhenStmt();
				block.addStmt(whenStmt);
				break;
				
			case 5:
				target.parforSwitch=true;
				break;
				
			case 0:
				
				block.addStmt(new BlockEnd("\n}\n"));
				break;
			}
			
		}

	}

	private static void setCurrentStmt(StmtBlock concBlock) {
		currentStmtBlock = concBlock;
		
	}

	private static int isWhichCommentConcStmt(String nodeString) {
		//TODO: Make a better version of this method using regex
		if (nodeString.equals("%!async"))
			return 1;
		else if (nodeString.equals("%!finish"))
			return 2;
		if (nodeString.equals("%!atomic"))
			return 3;
		else if (nodeString.startsWith("%!when(")) //TODO:Make it proper
			return 4;
		if (nodeString.equals("%!parfor"))
			return 5;
		else if (nodeString.equals("%!end"))
			return 0;
		else
			return -1;
	}
}
