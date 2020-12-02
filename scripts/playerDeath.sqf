// modified by cheesenoggin for 'Joe and the Volcano'
// player_killed.sqf
//  © FEBRUARY 2010 - norrin  

_has_spec = false;
_message = "You are dead.\nEntering spectator mode...";
sleep 2;

if (!local player) exitWith {};

while {true} do
{
	while {alive player} do {sleep 0.2};
	titleText [_message, "BLACK", 0.2];
	sleep 1;
	titleText [_message, "BLACK FADED", 10];
	if (!_has_spec) then { [player] join grpNull; };
	while {!alive player} do {sleep 0.2};

	sandi_barrier_disabled = true;
	player setVariable ["playerSide", side player, true];
	
	if (side player == WEST) then
	{
		["sandi_killed", player] call CBA_fnc_globalEvent;

	};
	
	if (side player == EAST) then
	{
		
		["sandi_killed2", player] call CBA_fnc_globalEvent;

	};
	
	player setVariable["acre_sys_core_isDisabled", false, true];

	
	if ( "camman" == vehicleVarName player ) then { 
		player setVehicleVarName "camman";
		player setPos (getpos camrespawn);
		player addAction ["Enter Spectator Mode", "scripts\specAction.sqf", [], 1, false, true, "", ""];
		hideobject player; 
		player setVariable["acre_sys_core_isDisabled", true, true];  
		titleText ["", "BLACK IN", 0.2];
		player addeventhandler ["HandleDamage","" ]; 
		player removeweapon "itemradio"; 
		cameraMan = group player; 
		group player setGroupId ["CAMERA MAN"]; 
		player setVariable ["ACE_STAMINA_CLASS", "SoldierWB"]; 
		player setVariable ["ace_w_allow_dam", false];  
		player setVariable ["ace_w_eh",0];

	}
	else{ 
		player setPos (getpos specpen);
		
		if (!_has_spec) then { [] execVM "scripts\gdtmod_spectator.sqf"; _has_spec = true; }
		else { titleText [_message, "BLACK IN", 0.2]; };
		player addEventHandler ["HandleDamage", {false}];
				player setVariable ["ace_w_allow_dam", false];  
player setVariable ["ace_w_eh",0];
		{player removeMagazine _x} forEach magazines player;
		removeAllWeapons player;
		removeAllItems player;
	};
	
};
//if (true) exitWith {};

