class ahb_trans extends uvm_sequence_item;

	`uvm_object_utils(ahb_trans)

	function new(string name ="ahb_trans");
		super.new(name);
	endfunction


	rand bit HRESETn;
	rand bit[31:0] HADDR;
	rand bit[1:0] HTRANS;
	rand bit HWRITE;
	rand bit[2:0] HSIZE;
	rand bit[2:0] HBURST;
	rand bit[31:0] HWDATA;
	rand bit HREADY;

	bit[31:0] HRDATA;
 	bit[1:0] HRESP;


	constraint c1{}
	
	//function void post_randomize();
		
	//endfunction

	virtual function void do_print(uvm_printer printer);
		super.do_print(printer);

		printer.print_field("HRESETn",	this.HRESETn, 	1, UVM_DEC);
		printer.print_field("HADDR",	this.HADDR, 	32, UVM_DEC);
		printer.print_field("HTRANS",	this.HTRANS, 	2, UVM_DEC);
		printer.print_field("HWRITE",	this.HWRITE, 	1, UVM_DEC);
		printer.print_field("HSIZE",	this.HSIZE, 	3, UVM_DEC);
		printer.print_field("HBURST",	this.HBURST, 	3, UVM_DEC);
		printer.print_field("HWDATA",	this.HWDATA, 	32, UVM_DEC);
		printer.print_field("HREADY",	this.HREADY, 	1, UVM_DEC);
		printer.print_field("HRDATA",	this.HRDATA, 	32, UVM_DEC);
		printer.print_field("HRESP",	this.HRESP, 	2, UVM_DEC);
	
	endfunction

	virtual function void do_copy(uvm_object rhs);

    		ahb_trans rhs_;	    	// handle for overriding the variable

    		if(!$cast(rhs_,rhs)) 	//check the compatibility
			begin
   			`uvm_fatal("do_copy","cast of the rhs object failed")
    			end
    		super.do_copy(rhs);

  		// Copy over data members:
    		HRESETn = rhs_.HRESETn;
		HADDR   = rhs_.HADDR;
		HTRANS  = rhs_.HTRANS;
		HWRITE  = rhs_.HWRITE;
		HSIZE   = rhs_.HSIZE;
		HBURST  = rhs_.HBURST;
		HWDATA  = rhs_.HWDATA;
		HREADY  = rhs_.HREADY;
		HRDATA  = rhs_.HRDATA;
		HRESP   = rhs_.HRESP;
	
  	endfunction:do_copy


endclass	
