if (isServer) then {

	private ["_type", "_vehicle"];

	_type = _this select 0; 
	_vehicle = _this select 1; 

	switch (_type) do
	{
	case "bluIFV":
		{
			waitUntil {sleep 0.50; ((!canmove _vehicle) || !(_vehicle call ace_v_alive))};
			["sandi_blu_IFV_killed"] call CBA_fnc_globalEvent;
		};
	case "bluAFV":
		{
			waitUntil {sleep 0.50; ((!canmove _vehicle) || !(_vehicle call ace_v_alive))};
			["sandi_blu_AFV_killed"] call CBA_fnc_globalEvent;
		};	
	case "bluVEH":
		{
			waitUntil {sleep 0.50; (!canmove _vehicle)};
			["sandi_blu_VEH_killed"] call CBA_fnc_globalEvent;
		};	
	case "redIFV":
		{
			waitUntil {sleep 0.50; ((!canmove _vehicle) || !(_vehicle call ace_v_alive))};
			["sandi_red_IFV_killed"] call CBA_fnc_globalEvent;
		};
	case "redAFV":
		{
			waitUntil {sleep 0.50; ((!canmove _vehicle) || !(_vehicle call ace_v_alive))};
			["sandi_red_AFV_killed"] call CBA_fnc_globalEvent;
		};	
	case "redVEH":
		{
			waitUntil {sleep 0.50; (!canmove _vehicle)};
			["sandi_red_VEH_killed"] call CBA_fnc_globalEvent;
		};	
	};

};