package natlab.backends.x10.codegen;

import java.util.ArrayList;

import java.util.HashMap;

import ast.ASTNode;

import natlab.tame.tir.TIRAbstractAssignFromVarStmt;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRAbstractAssignToVarStmt;
import natlab.tame.tir.TIRFunction;
import natlab.tame.tir.TIRNode;
import natlab.tame.valueanalysis.ValueAnalysis;
import natlab.tame.valueanalysis.advancedMatrix.AdvancedMatrixValue;
import natlab.tame.valueanalysis.aggrvalue.AggrValue;
import natlab.tame.tir.*;
import natlab.tame.tir.analysis.TIRAbstractNodeCaseHandler;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class collectBuiltins extends TIRAbstractNodeCaseHandler {
	
	HashMap<String, NodeList> usedBuiltins = new HashMap<String,NodeList>();
	
	private collectBuiltins(
			ValueAnalysis<AggrValue<AdvancedMatrixValue>> analysis, int size,
			int index) {
		//this.usedBuiltins = null;
		this.usedBuiltins.clear();
		((TIRNode) analysis.getNodeList().get(index).getAnalysis().getTree())
		.tirAnalyze(this);
		
	}

	public static ArrayList<collectBuiltins> collect(
			ValueAnalysis<AggrValue<AdvancedMatrixValue>> analysis, int size) {
		ArrayList<collectBuiltins> builtinMapList = new ArrayList<collectBuiltins>();
		for (int i = 0; i < size; i++) {
			//System.out.println("comes in here ~~");
			builtinMapList.add( new collectBuiltins(analysis, size, i));
			
			
		}
		return builtinMapList;
	}

	@Override
	public void caseASTNode(ASTNode node) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void caseTIRFunction(TIRFunction node) {
		for (ast.Stmt stmt : node.getStmts()) {
			((TIRNode) stmt).tirAnalyze(this);
		}

	}
	
	@Override
	public void caseTIRWhileStmt(TIRWhileStmt node) {
		for (ast.Stmt stmt : node.getStmts()) {
			((TIRNode) stmt).tirAnalyze(this);
		}

	}
	
	@Override
	public void caseTIRForStmt(TIRForStmt node) {
		for (ast.Stmt stmt : node.getStmts()) {
			((TIRNode) stmt).tirAnalyze(this);
		}

	}
	
	@Override
	public void caseTIRAbstractAssignStmt(TIRAbstractAssignStmt node) {
		
		if (node instanceof TIRAbstractAssignToVarStmt) {
			AssignsAndDecls.handleTIRAbstractAssignToVarStmtPass1(node, this);
		}

		else if (node instanceof TIRAbstractAssignToListStmt) {
			AssignsAndDecls.handleTIRAbstractAssignToListStmtPass1(node, this);

		}

		else if (node instanceof TIRAbstractAssignFromVarStmt) {
			

		}
	}
}
