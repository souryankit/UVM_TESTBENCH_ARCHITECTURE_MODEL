module top();

import uvm_pkg::*;
import test_pkg::*;
`include "uvm_macros.svh"

 //bit clock;
 //always #5 clock = ~clock;

 initial 
  begin
  //uvm_config_db#(virtual input_if)::set(null,"*","in_vif", in0);
  //uvm_config_db#(virtual output_if)::set(null,"*","op_vif", in1);

   run_test();
  end

endmodule


