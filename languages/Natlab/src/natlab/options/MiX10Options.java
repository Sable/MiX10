package natlab.options;

import natlab.options.Options;
import com.beust.jcommander.Parameter;

public class MiX10Options extends Options {
	@Parameter(names = "--mix10c", description = "Generate X10 code from given MATLAB code")
	protected boolean mix10c = false;

	public boolean mix10c() {
		return mix10c;
		
	}
	
	@Parameter(names = "--use_region_arrays", description = "Use region arrays instead of new arrays")
	protected boolean use_region_arrays = false;

	public boolean use_region_arrays() {
		return use_region_arrays;
	}

	@Parameter(names = "--no_intok", description = " Disable IntegerOkay analysis")
	protected boolean no_intok = false;

	public boolean no_intok() {
		return no_intok;
	}

	@Parameter(names = "--vec_par_length", description = "Define the threshold vector size to use parallel vector operations")
	protected String vec_par_length = "";

	public String vec_par_length() {
		return vec_par_length;
	}

	@Parameter(names = "--arg_info", description = "Provide information about the input arguments")
	protected String arg_info = "";

	public String arg_info() {
		return arg_info;
	}

	@Parameter(names = "--class_name", description = " Name of the X10 class file to be generated")
	protected String class_name = "";

	public String class_name() {
		return class_name;
	}

}
