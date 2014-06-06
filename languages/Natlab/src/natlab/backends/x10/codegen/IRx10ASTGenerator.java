package natlab.backends.x10.codegen;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import natlab.backends.x10.IRx10.ast.ClassBlock;
import natlab.backends.x10.IRx10.ast.IDInfo;
import natlab.backends.x10.IRx10.ast.List;
import natlab.backends.x10.IRx10.ast.Method;
import natlab.backends.x10.IRx10.ast.Stmt;
//import natlab.backends.x10.IRx10.ast.Args;
import natlab.backends.x10.IRx10.ast.StmtBlock;
import natlab.tame.tir.TIRAbstractAssignFromVarStmt;
import natlab.tame.tir.TIRAbstractAssignStmt;
import natlab.tame.tir.TIRAbstractAssignToListStmt;
import natlab.tame.tir.TIRAbstractAssignToVarStmt;
import natlab.tame.tir.TIRArrayGetStmt;
import natlab.tame.tir.TIRArraySetStmt;
import natlab.tame.tir.TIRBreakStmt;
import natlab.tame.tir.TIRCellArrayGetStmt;
import natlab.tame.tir.TIRCellArraySetStmt;
import natlab.tame.tir.TIRCommentStmt;
import natlab.tame.tir.TIRContinueStmt;
import natlab.tame.tir.TIRForStmt;
import natlab.tame.tir.TIRFunction;
import natlab.tame.tir.TIRIfStmt;
import natlab.tame.tir.TIRNode;
import natlab.tame.tir.TIRWhileStmt;
import natlab.tame.tir.analysis.TIRAbstractNodeCaseHandler;
import natlab.tame.valueanalysis.ValueAnalysis;
import natlab.tame.valueanalysis.aggrvalue.AggrValue;
import natlab.tame.valueanalysis.basicmatrix.BasicMatrixValue;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import ast.ASTNode;


@SuppressWarnings("unused")
public class IRx10ASTGenerator extends TIRAbstractNodeCaseHandler {
	ValueAnalysis<AggrValue<BasicMatrixValue>> analysis;
	x10Mapping x10Map;
//	HashMap<String, Collection<ClassReference>> symbolMap = new HashMap<String, Collection<ClassReference>>();
	HashMap<String, IDInfo> symbolMap = new HashMap<String, IDInfo>();
	String symbolMapKey;
	collectBuiltins collectedBuiltins;
	private int graphSize;
	int index;
	private String fileDir;
	Method method;
	ArrayList<StmtBlock> currentBlock = new ArrayList<StmtBlock>();
    public static Boolean parforSwitch;
	private IRx10ASTGenerator(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis2, int size,
			int index, collectBuiltins collectBuiltins, String fileDir, String classname) {
		this.x10Map = new x10Mapping();
		this.analysis = analysis2;
		this.collectedBuiltins = collectBuiltins;
		parforSwitch = false;
		
		
		System.out.println(collectBuiltins.usedBuiltins.toString()+" -- builtin list");
		
		// this.graphSize = graphSize;
		this.index = index;
		this.fileDir = fileDir;
		this.method = new Method();
		// this.method.setMethodBlock(new MethodBlock(new List<Stmt>()));
		((TIRNode) analysis2.getNodeList().get(index).getAnalysis().getTree())
				.tirAnalyze(this);
		// this.currentBlock.add(this.method.getMethodBlock());

		System.out.println(this.currentBlock.size());

	}

	public static ClassBlock x10ClassMaker(
			ValueAnalysis<AggrValue<BasicMatrixValue>> analysis2,
			int graphSize, ArrayList<collectBuiltins> listOfUsedBuiltins, String fileDir, String classname) {
		List<Stmt> declStmtList = new List<Stmt>();
		List<Method> methodList = new List<Method>();
		IRx10ASTGenerator subAST;
		Document doc = null;
		Boolean useNewArray = true;
		
		try {
			String builtin;
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		doc = docBuilder.parse (new File("src/natlab/backends/x10/codegen/mix10_builtins.xml"));
		doc.getDocumentElement ().normalize ();
		
		
		
		
		
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		for (int i = 0; i < graphSize; i++) {
			
			
			collectBuiltins collected = listOfUsedBuiltins.get(i);
			NodeList builtinList;
			
				for (String key : collected.usedBuiltins.keySet())
				{
					builtinList = doc.getElementsByTagName(key);
					
					//System.out.println(key+"##########################"+builtinList.toString());
					
					collected.usedBuiltins.put(key, builtinList);
					
				}
			
			
			subAST = new IRx10ASTGenerator(analysis2, graphSize, i, listOfUsedBuiltins.get(i), fileDir,
					classname);
			methodList.add(subAST.method);
			for (IDInfo value : subAST.symbolMap.values()){
				
			}
			
			for (IDInfo value : subAST.symbolMap.values()){
				if (null != value.getdidShapeChange() && true == value.getdidShapeChange()){
					useNewArray = false;
				}
			}
			
		}
		ClassBlock class_block = new ClassBlock(declStmtList, methodList, useNewArray);
		return class_block;

	}

	@Override
	public void caseASTNode(ASTNode node) {

	}

	@Override
	public void caseTIRFunction(TIRFunction node) {
		Function.handleTIRFunction(node, this);

	}

	@Override
	public void caseTIRAbstractAssignStmt(TIRAbstractAssignStmt node) {

		if (node instanceof TIRAbstractAssignToVarStmt) {
			AssignsAndDecls.handleTIRAbstractAssignToVarStmt(node, this,
					this.currentBlock.get(this.currentBlock.size() - 1));
		}

		else if (node instanceof TIRAbstractAssignToListStmt) {
			AssignsAndDecls.handleTIRAbstractAssignToListStmt(node, this,
					this.currentBlock.get(this.currentBlock.size() - 1));

		}

		else if (node instanceof TIRAbstractAssignFromVarStmt) {
			

		}
		
		
		
		// TODO implement other cases here - refer to ValueAnalysisPrinter
				/*
				 * else if
		 * (node instanceof TIRCellArraySetStmt){
		 * vars.add(((TIRCellArraySetStmt)node).getCellArrayName().getID()); }
		 * else if (node instanceof TIRDotSetStmt){
		 * vars.add(((TIRDotSetStmt)node).getDotName().getID()); };
		 */
		// printVars(analysis.getOutFlowSets().get(node), vars);
	}

	public void caseTIRWhileStmt(TIRWhileStmt node) {
		WhileLoopStmt.handleTIRWhileStmt(node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}

	public void caseTIRForStmt(TIRForStmt node) {
		ForLoopStmt.handleTIRForStmt(node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}

	public void caseTIRIfStmt(TIRIfStmt node) {
		IfElseStmt.handleTIRIfStmt(node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
	public void caseTIRCommentStmt(TIRCommentStmt node){
		Comments.handleTIRComment(node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
	@Override
	public void caseTIRArrayGetStmt(TIRArrayGetStmt node){
		//System.out.println("inside ArrayGet");
		ArrayGetSet.handleTIRAbstractArrayGetStmt((TIRArrayGetStmt) node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
	public void caseTIRArraySetStmt(TIRArraySetStmt node){
		//System.out.println("inside ArraySet");
		ArrayGetSet.handleTIRAbstractArraySetStmt((TIRArraySetStmt) node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
		
	   } 
	
	public void caseTIRCellArrayGetStmt(TIRCellArrayGetStmt node){
		//System.out.println("inside CellArrayGet");
		CellArrayGetSet.handleTIRCellAbstractArrayGetStmt((TIRCellArrayGetStmt) node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
	public void caseTIRCellArraySetStmt(TIRCellArraySetStmt node){
		//System.out.println("inside CellArraySet");
		CellArrayGetSet.handleTIRCellAbstractArraySetStmt((TIRCellArraySetStmt) node, this,
				this.currentBlock.get(this.currentBlock.size() - 1));
		
	   }
	public void caseTIRBreakStmt(TIRBreakStmt node){
		LoopBreak.handleTIRBreakStmt(node, this, this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
	public void caseTIRBreakStmt(TIRContinueStmt node){
		LoopContinue.handleTIRContinueStmt(node, this, this.currentBlock.get(this.currentBlock.size() - 1));
	}
	
}
