class apb_trans extends uvm_sequence_item;

	`uvm_object_utils(apb_trans)

	function new(string name ="apb_trans");
		super.new(name);
	endfunction

	rand bit PRESETn;
	rand bit PENABLE;
	rand bit[31:0] PADDR;
	rand bit PWRITE;
	rand bit[31:0] PWDATA;
	rand bit PSELx;

	bit[31:0] PRDATA;

	
	//function void post_randomize();
		
	//endfunction

	virtual function void do_print(uvm_printer printer);
		super.do_print(printer);

		printer.print_field("PRESETn",	this.PRESETn, 	1, UVM_DEC);
		printer.print_field("PENABLE",	this.PENABLE, 	1, UVM_DEC);
		printer.print_field("PADDR",	this.PADDR, 	32, UVM_DEC);
		printer.print_field("PWRITE",	this.PWRITE, 	1, UVM_DEC);
		printer.print_field("PWDATA",	this.PWDATA, 	32, UVM_DEC);
		printer.print_field("PSELx",	this.PSELx, 	1, UVM_DEC);
		printer.print_field("PRDATA",	this.PRDATA, 	32, UVM_DEC);
	
	endfunction

	virtual function void do_copy(uvm_object rhs);

    		apb_trans rhs_;	    	// handle for overriding the variable

    		if(!$cast(rhs_,rhs)) 	//check the compatibility
			begin
   			`uvm_fatal("do_copy","cast of the rhs object failed")
    			end
    		super.do_copy(rhs);

  		// Copy over data members:
    		PRESETn = rhs_.PRESETn;
		PENABLE = rhs_.PENABLE;
		PADDR   = rhs_.PADDR;
		PWRITE  = rhs_.PWRITE;
		PWDATA  = rhs_.PWDATA;
		PRDATA  = rhs_.PRDATA;
		PSELx   = rhs_.PSELx;
	
  	endfunction:do_copy


endclass	

