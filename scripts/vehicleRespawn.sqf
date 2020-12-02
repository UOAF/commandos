if (!isServer) exitWith {};
sleep 1; 
if (!vehicleRespawn) exitwith {}; 

private ["_vehicle", "_vehType", "_vehPos", "_vehBearing", "_newVeh", "_respawns"];
_vehicle = _this select 0; 
_vehType = typeof _vehicle; 
_vehPos = getpos _vehicle;
_vehBearing = getdir _vehicle;
if (isnil "vehicleRespawnTickets") then { 
	_respawns =  1; 
}else {
	_respawns =  vehicleRespawnTickets; 
};

while {_respawns > 0} do { 

	if ((_vehicle iskindof "Car") || (_vehicle iskindof "Air") || (_vehicle iskindof "Ship")) then { 
		waitUntil {sleep 2; ( (!canmove _vehicle) )};
	}else {
		waitUntil {sleep 2; ( ((!canmove _vehicle) || !(_vehicle call ace_v_alive)) )};
	};

	_newVeh = _vehType createvehicle _vehPos; 
	_newVeh setpos _vehPos; 
	_newVeh setdir _vehBearing; 
	clearWeaponCargoGlobal _newVeh; 
	clearMagazineCargoGlobal _newVeh;

	switch (_vehType) do { 
	case "ACE_BMD_2_RU": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redIFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 	
		}; 
	case "LAV25": {
			_newveh setvehicleinit "
		vehicleKill = ['bluIFV', this] execvm 'scripts\vehicleKill.sqf';  
		this disableTIEquipment true; this allowdamage false; 
		this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 
		}; 
	case "Zodiac": {
			_newveh setvehicleinit "
		vehicleKill = ['bluVEH', this] execvm 'scripts\vehicleKill.sqf';
		";
			processinitcommands; 
		}; 
	case "ACE_BTR70_RU": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redIFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 
		}; 
	case "ACE_M2A2_W": {
			_newveh setvehicleinit "
		vehicleKill = ['bluIFV', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 	
		}; 
	case "ACE_M1A1_NATO": {
			_newveh setvehicleinit "
		vehicleKill = ['bluAFV', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 			
		}; 
	case "ACE_T90A": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redAFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 			
		}; 
	case "ACE_BRDM2_RU": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redIFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 	
		}; 
	case "ACE_ZSU_RU": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redAFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 				
		}; 
	case "ACE_BMP2_RU": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redIFV', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 	
		}; 
	case "ACE_AH1W_TOW_W": {
			_newveh setvehicleinit "
		vehicleKill = ['bluAFV', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 			
		}; 
	case "Pickup_PK_TK_GUE_EP1": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redVEH', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 				
		}; 
	case "Offroad_SPG9_TK_GUE_EP1": {
			_newveh setvehicleinit "		
		this disableTIEquipment true; vehicleKill = ['redVEH', this] execvm 'scripts\vehicleKill.sqf';  this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == WEST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];		
		";
			processinitcommands; 					
		}; 
	case "ACE_Stryker_ICV_M2_SLAT": {
			_newveh setvehicleinit "
		vehicleKill = ['bluIFV', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 
		}; 
	case "ACE_Stryker_ICV_MK19_SLAT": {
			_newveh setvehicleinit "
		vehicleKill = ['bluIFV', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 
		}; 
	case "HMMWV": {
			_newveh setvehicleinit "
		vehicleKill = ['bluVEH', this] execvm 'scripts\vehicleKill.sqf';  this disableTIEquipment true; this allowdamage false; this addEventHandler ['GetIn', 'if (side (_this select 2) == EAST) then {(_this select 2) say [''retardalert'',5]; moveout (_this select 2); }else{ (_this select 0) allowdamage true; };'];
		";
			processinitcommands; 
		}; 	
	};

	

	_vehicle = _newVeh; 
	_respawns = _respawns - 1; 

	sleep 1; 
};