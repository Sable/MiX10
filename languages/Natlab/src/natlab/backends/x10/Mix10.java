package natlab.backends.x10;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import natlab.backends.x10.IRx10.ast.Program;
import natlab.backends.x10.codegen.BuiltinWriter;
import natlab.backends.x10.codegen.IRx10ASTGenerator;
import natlab.backends.x10.codegen.collectBuiltins;
import natlab.options.Options;
import natlab.tame.BasicTamerTool;
import natlab.tame.valueanalysis.ValueAnalysis;
import natlab.tame.valueanalysis.aggrvalue.AggrValue;
import natlab.tame.valueanalysis.basicmatrix.BasicMatrixValue;
import natlab.toolkits.filehandling.GenericFile;
import natlab.toolkits.path.FileEnvironment;

public class Mix10 {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// args[0]: file path
		// args[1]: value params
		// args[2]: output dir path
		String file = args[0];
		String fileIn = file;
		String fileOutName = file.substring(file.lastIndexOf("/") + 1,
				file.lastIndexOf("."))
				+ ".x10";
		String fileOut = args[2] + "/" + fileOutName;
		// String fileOutTame = file + "_tame.m";
		GenericFile gFile = GenericFile.create(fileIn);
		FileEnvironment env = new FileEnvironment(gFile); // get path
		String[] newArgs = {args[1]};
		ValueAnalysis<AggrValue<BasicMatrixValue>> analysis = BasicTamerTool
				.analyze(newArgs, env);
		int size = analysis.getNodeList().size();
		System.out.println("\n------------------------------------\n");
		System.out.println("\n------------------------------------\n");
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
		BuiltinWriter.classWriter(args[2] + "/");
	}

	public static void compile(Options options) {
		String[] args = new String[3];
		args[0] = options.main();
		args[1] = options.arg_info();
		args[2] = options.od();
		
		System.out.println(args[0]+" "+args[1]+" "+args[2]);
		main(args);
	}
}
