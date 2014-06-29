package natlab.backends.x10;

import java.io.BufferedWriter;
import java.io.File;
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
	private static boolean debug = false;

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// args[0]: file path
		// args[1]: value params
		// args[2]: output dir path
		String file = args[0];
		String fileIn = file;
		String fileOutName = getOutFileName(args, file);
		String fileOut;
		fileOut = getOutFilePath(args, fileOutName);
		String willUseRegionArrays;
		willUseRegionArrays = getWillUseRegionArrays(args);
		// String fileOutTame = file + "_tame.m";
		GenericFile gFile = GenericFile.create(fileIn);
		FileEnvironment env = new FileEnvironment(gFile); // get path
		String[] newArgs = { args[1] };
		setIntegerOkay(args);
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
				size, listOfUsedBuiltins, args[2], fileOutName, args[4]));
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
		File packageDir = new File(args[2] + "/" + getLibraryPackage(args[4]));

		Boolean madePackage = false;
		if (!packageDir.exists()) {
			madePackage = packageDir.mkdir();
		}

		BuiltinWriter.classWriter(args[2] + "/" + getLibraryPackage(args[4])
				+ "/", args[4]);
	}

	private static String getLibraryPackage(String useNewArray) {
		if (useNewArray.equals("true")) {
			return "regionArrayLib";

		} else {
			return "simpleArrayLib";
		}
	}

	private static void setIntegerOkay(String[] args) {
		if (args.length >= 6 && args[5].equals("false")) {
			BasicTamerTool.setDoIntOk(false);
		} else {
			BasicTamerTool.setDoIntOk(true);
		}
	}

	private static String getWillUseRegionArrays(String[] args) {
		String willUseRegionArrays;
		if (args.length >= 5)
			willUseRegionArrays = args[4];
		else {
			willUseRegionArrays = "false";
		}
		return willUseRegionArrays;
	}

	private static String getOutFileName(String[] args, String file) {
		String fileOutName = "";
		if (args.length >= 4) {
			fileOutName = args[3].trim();
		}
		if (fileOutName.equals("")) {
			fileOutName = file.substring(file.lastIndexOf("/") + 1,
					file.lastIndexOf("."));
			fileOutName = fileOutName.replaceFirst("_driver", "");
			fileOutName += "_x10";
		}
		return fileOutName;
	}

	private static String getOutFilePath(String[] args, String fileOutName) {
		String fileOut;
		if (!args[2].endsWith("/"))
			fileOut = args[2] + "/" + fileOutName + ".x10";
		else
			fileOut = args[2] + fileOutName + ".x10";
		return fileOut;
	}

	public static void compile(Options options) {
		String[] args = new String[6];
		args[0] = options.main();
		args[1] = options.arg_info();
		args[2] = options.od();
		args[3] = options.class_name();
		args[4] = "false";
		args[5] = "true";
		if (options.use_region_arrays())
			args[4] = "true";
		if (options.no_intok())
			args[5] = "false";
		if (debug)
			System.out.println(args[0] + " " + args[1] + " " + args[2]);
		main(args);
	}
}
