module tb;

	integer out_ptr  ;
	integer mem_File ;
	integer j, value ;
	
	// Inputs
	reg CLK;
	reg RESET;
	reg ENABLE;
	
	// Outputs
	wire OUT;
	
	// Instantiate the Unit Under Test (UUT)
	test uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.ENABLE(ENABLE), 
		.OUT(OUT)
	);
	
	initial begin
		
		// Output data file (Output data will be written into the file mentioend below)
		out_ptr 	= $fopen("dump/output.txt","w");
		
		// Initialize Inputs
		CLK = 0;
		RESET = 1;
		
		#20 
		RESET = 0 ;
		ENABLE = 1;
		
		#20
		init_mem ;		// To read data from file and intialize the memory
		
		///////////// Put you stimulus here ///////////////
		
		#1000
		$fclose(out_ptr);
	end
	//------------------------------------------------------------------------------------------
	// Generate the periodic clock signal
	always 
		#10	CLK  = ~CLK ;
	//------------------------------------------------------------------------------------------
	// Write Computed output to file after every clock cycle
	//------------------------------------------------------------------------------------------
	
	always @ (posedge CLK)
	begin	: output_text_file
			#20
			$fwrite(out_ptr,"%d\n",OUT);	// Here OUT is the signal you want to write in file
			$display("Time=%t ; OUT=%d ", $time,OUT);
	end
	//------------------------------------------------------------------------------------------	
	// This task is to initialize memory from file
	//------------------------------------------------------------------------------------------	
	task init_mem ;
	integer j, value ; 
	begin
		j = 1 ;	
		
		// Open file in read mode
		mem_File	= $fopen("init/mem_init.dat","r");
		if (mem_File == 0) 
		begin
         $display("Error: Failed to open mem_init...\n Exiting Simulation.");
         $finish;
		end	
	
		for(j=0;j<36;j=j+1)
		begin
			#10
			$fscanf(mem_File, "%d", value);
			$display("mem_Address = %d ; mem_Content = %d",j, value);
			// You can use this 'value' variable to read data from file
		end
		$fclose(mem_File);
	end
	endtask
//------------------------------------------------------------------------------------------
endmodule