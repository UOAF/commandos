private ["_stealWhat"]; 

_stealWhat = _this select 3 select 0;


switch (_stealWhat) do {
		case "controlTower": {
		stealRadarTower = true; 
		publicvariable "stealRadarTower";
		hintsilent "Intel secured!"; 
		};
		case "hudsonPlans": {
		stealHudsonPlans = true; 
		publicvariable "stealHudsonPlans";
		hintsilent "Dr. Hudsonski's plans have been secured!"; 
		};	
		case "experPhoto": {
		photoCannon = true; 
		publicvariable "photoCannon";
		hintsilent "Experimental cannon succesfully captured!"; 
		};			
		};