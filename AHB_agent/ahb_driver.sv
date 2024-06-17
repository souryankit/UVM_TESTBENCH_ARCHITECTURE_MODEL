//AHB_DRIVER

class ahb_driver extends uvm_driver#(ahb_trans);

	`uvm_component_utils(ahb_driver)
	

	function new(string name = "ahb_driver", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	task run_phase(uvm_phase phase);
		//super.run_phase(phase);
		forever
		begin
		     seq_item_port.get_next_item(req);
		     send_to_dut(req);
		     seq_item_port.item_done();
		end
	endtask	

	task send_to_dut(ahb_trans xtn);
		`uvm_info(get_type_name(),"AHB-DRIVER Transaction Printing..",UVM_LOW)
		xtn.print();
	endtask
endclass
