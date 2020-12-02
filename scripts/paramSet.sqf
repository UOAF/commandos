	if ((paramsArray select 0) == 0) then { //start time: night

		//default mission settings 
		
	};

	if ((paramsArray select 0) == 1) then { //start time: dawn

		setDate [2011, 11, 5, 6, 00];
		
	};

	if ((paramsArray select 0) == 2) then { //start time: day

		setDate [2011, 11, 5, 12, 00];
		
	};	

	if ((paramsArray select 2) == 0) then { //CIA can has uniforms? yes

		//default
		
	};	

	if ((paramsArray select 2) == 1) then { //CIA can has uniforms? no
		deletevehicle uniform1; 
		deletevehicle uniform2;	
	};		