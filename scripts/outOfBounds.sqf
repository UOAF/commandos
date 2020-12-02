//Written by beta
//Kills a player if they move out of the AO


while {true} do
{
	if (!([getPos player, "aom"] call CBA_fnc_inArea) && (player distance specPen > 100) && !("camman" == vehicleVarName player)) then
	{
		hint "You have left the Area of Operations. TURN BACK NOW.";
		sleep 20; 
		if (!([getPos player, "aom"] call CBA_fnc_inArea) && (player distance specPen > 100) && !("camman" == vehicleVarName player)) then
		{
			hint "Should have paid attention to the briefing and/or watched your map.";
			player say ["retardalert",5];
			sleep 10;
			player setDamage 1;
		};
	};
	
	if (([getPos player, "retardlake"] call CBA_fnc_inArea) && !("camman" == vehicleVarName player)) then
	{
			player say ["retardalert",5];
			sleep 10;
			player setDamage 1;

	};
	
	sleep 5;
};
