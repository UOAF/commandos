//Written by beta
//End conditions loop


while {true} do
{

	if (BLUFOR_CC) then
	{
		["sandi_endMission", ["CC"]] call CBA_fnc_globalEvent;
	};

	if (bluforWin) then
	{
		["sandi_endMission", ["bluforWin"]] call CBA_fnc_globalEvent;
	};
	
	//timer in init.sqf
	
	sleep 10;
};