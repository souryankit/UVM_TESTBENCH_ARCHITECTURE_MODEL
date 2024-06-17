//AHB_SEQUENCE_CLASS

class ahb_sequence extends uvm_sequence #(ahb_trans);

	`uvm_object_utils(ahb_sequence)

	function new(string name = "ahb_sequence");
		super.new(name);
	endfunction

	task body();
		repeat(1)
		 begin
			req = ahb_trans::type_id::create("req");
			start_item(req);
			assert(req.randomize());
			finish_item(req);
		end
	endtask




endclass

