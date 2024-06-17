//ENVIRONMENT_CONFIG_CLASS
class env_config extends uvm_object;

   `uvm_object_utils(env_config)

  //virtual input_if in_vif;
  //virtual output_if out_vif;

  ahb_agent_config ahb_cfg[];
  apb_agent_config apb_cfg[];

  bit has_ahb_agent = 1;
  bit has_apb_agent = 1;
  bit has_scoreboard = 1;
  int no_of_ahb_agent = 1;
  int no_of_apb_agent = 1;

 function new(string name  = "env_config");
	super.new(name);
 endfunction

endclass

