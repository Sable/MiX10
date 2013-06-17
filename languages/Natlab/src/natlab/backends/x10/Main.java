package natlab.backends.x10;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;

import natlab.tame.valueanalysis.*;
import natlab.tame.valueanalysis.advancedMatrix.AdvancedMatrixValue;
import natlab.tame.valueanalysis.aggrvalue.*;
import natlab.tame.AdvancedTamerTool;
import natlab.toolkits.filehandling.GenericFile;
import natlab.toolkits.path.FileEnvironment;
import natlab.backends.x10.IRx10.ast.AssignStmt;
import natlab.backends.x10.IRx10.ast.DeclStmt;
import natlab.backends.x10.IRx10.ast.Program;
import natlab.backends.x10.codegen.*;

public class Main {

	public static void main(String[] args) {
		// args[0]: file path
		// args[1]: value params
		// args[2]: output dir path
		//String file = "/media/vineet/19F5-FD4C/Thesis/mclab_git/mclab/languages/Natlab/src/natlab/backends/x10/benchmarks/unit/simplest";
		  String file = args[0];	

		String fileIn = file;
		String fileOutName = file.substring(file.lastIndexOf("/")+1, file.lastIndexOf(".")) + ".x10";
		String fileOut = args[2]+"/"+fileOutName;
		//String fileOutTame = file + "_tame.m";
		GenericFile gFile = GenericFile.create(fileIn);
		FileEnvironment env = new FileEnvironment(gFile); // get path
															// environment obj
		AdvancedTamerTool tool = new AdvancedTamerTool();
		String[] newArgs = {args[1]};
		ValueAnalysis<AggrValue<AdvancedMatrixValue>> analysis = tool.analyze(
				newArgs, env);
		int size = analysis.getNodeList().size();

//		try {
//			StringBuffer tamedCode = new StringBuffer();
//			BufferedWriter out = new BufferedWriter(new FileWriter(fileOutTame));
//			for (int i = 0; i < analysis.getNodeList().size(); i++) {
//				tamedCode.append(ValueAnalysisPrinter.prettyPrint(analysis
//						.getNodeList().get(i).getAnalysis()));
//			}
//			out.write(tamedCode.toString());
//			out.close();
//		} catch (IOException e) {
//			System.out.println("Exception ");
//
//		}

		System.out.println("\n------------------------------------\n");

		System.out.println("\n------------------------------------\n");

		// HashMap<String, String> usedBuiltins = new HashMap<String, String>();
		ArrayList<collectBuiltins> listOfUsedBuiltins = new ArrayList<collectBuiltins>();
		listOfUsedBuiltins = collectBuiltins.collect(analysis, size);

		// System.out.println("UNCOMMENT IN MAIN");
		Program irx10Program = new Program();
		irx10Program.setClassBlock(IRx10ASTGenerator.x10ClassMaker(analysis,
				size, listOfUsedBuiltins, args[2], fileOutName));

		String x10Program = irx10Program.pp("", fileOutName);
		System.out
				.println("\n~~~~~~~~~~~~~~~~X10 code~~~~~~~~~~~~~~~~~~~~~~~\n");
		System.out.println(x10Program);
		System.out
				.println("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");

		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(fileOut));
			out.write(x10Program);
			out.close();
		} catch (IOException e) {
			System.out.println("Exception ");

		}

		BuiltinWriter.classWriter(args[2]+"/");

	}

}
