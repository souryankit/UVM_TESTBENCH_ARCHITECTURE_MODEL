//APB_SEQUENCE

class apb_sequence extends uvm_sequence #(apb_trans);

	`uvm_object_utils(apb_sequence)

	function new(string name = "apb_sequence");
		super.new(name);
	endfunction
	
	task body();
		repeat(1)
		 begin
			req = apb_trans::type_id::create("req");
			start_item(req);
			assert(req.randomize());
			finish_item(req);
		end
	endtask

endclass

