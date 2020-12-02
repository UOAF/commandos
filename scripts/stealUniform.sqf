//remotely based on a script from AAS

private["_oldUnit","_orginalDir","_orginalPosition","_orginalView","_playerSide","_playerName","_newUnitModel","_initialBody","_dummyGroup","_newUnit", "_GuyGettingSnuffed", "_newjack", "_weaponsSnuffed", "_magazinesSnuffed"];

_GuyGettingSnuffed = _this select 3 select 0; 

_GuyGettingSnuffed removeAction stealUniform;  

_oldUnit = player;

if (_oldUnit getvariable "inCostume") then {
	_oldUnit removeEventHandler ["killed", deathSecurity];
	_oldUnit removeEventHandler ["killed", liquidationEH];
};

_oldUnitType = typeof player; 
_orginalDir = getDir player;
_orginalPosition = position player;
_orginalView = cameraView;
if (_orginalView == "GUNNER") then {_orginalView = "INTERNAL";};
_playerSide = player getVariable "playerSide";
_newUnitModel = typeof _GuyGettingSnuffed;
_oldUnitWeapons = weapons player; 
_oldUnitMagazines = magazines player;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 9;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 9;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 9;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 9;

_weaponsSnuffed = weapons _GuyGettingSnuffed; 
_magazinesSnuffed = magazines _GuyGettingSnuffed;

_newjack = "TK_CIV_Worker02_EP1" createvehicle (position _GuyGettingSnuffed); 
removeallweapons _newjack; 
removeallitems _newjack; 

{
	_newjack addweapon _x; 
}
foreach _weaponsSnuffed;

{
	_newjack addmagazine _x; 
}
foreach _magazinesSnuffed;

//deletevehicle _GuyGettingSnuffed; 

_GuyGettingSnuffed setpos (getpos graveyard); 

_newjack setdammage 1; 



_dummyGroup = createGroup _playerSide;
[player] joinSilent grpNull;
sleep 0.1;
_newUnit = _dummyGroup createUnit [_newUnitModel,_orginalPosition,[],0,"CAN_COLLIDE"];
addSwitchableUnit _newUnit;

_dummyGroup2 = createGroup west;
[_dummyGroup] joinSilent _dummyGroup2;
deleteGroup _dummyGroup;

//Transfer player to new unit
setPlayable _newUnit;
selectPlayer _newUnit;
removeSwitchableUnit _oldUnit;
removeallweapons _newUnit; 
removeallitems _newUnit; 


{
	_newUnit addweapon _x; 
}
foreach _oldUnitWeapons;

{
	_newUnit addmagazine _x; 
}
foreach _oldUnitMagazines;

reload _newUnit; 

// move old body to a safe place
[-2, {hideobject (_this select 0); (_this select 0) enableSimulation false; }, [_oldUnit]] call CBA_fnc_globalExecute;

_oldUnit setpos (getpos graveyard); 
_oldUnit setdammage 1; 

// update variable reference
_newUnit = _oldUnit;


player setVariable ["playerSide", west, true];


if (cameraOn == player) then
{
	player switchCamera _orginalView;
};

player setDir _orginalDir;

// to allow action menu to appear, reveal all nearby vehicles and ammo crates within 100m/50m radius
{player reveal _x;} forEach (_orginalPosition nearObjects ["AllVehicles",100]);
{player reveal _x;} forEach (_orginalPosition nearObjects ["AmmoCrates_NoInteractive_Large",50]);
{player reveal _x;} forEach (_orginalPosition nearObjects ["MASH_EP1",50]);

// re'add mission briefing

[] execVM "briefingBluFor.sqf";
[] execVM "scripts\outOfBounds.sqf";

if (_oldUnitType != "Soldier_TL_PMC") then { 
	[] execVM "scripts\pilotCheck.sqf";
}; 

drawpistol = player addAction ["Draw Pistol", "scripts\drawPistol.sqf",["draw", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 0) "];
holsterpistol = player addAction ["Holster Pistol", "scripts\drawPistol.sqf",["holster", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 1) && ('ACE_USPSD' in (weapons _target))"];
stealRadarIntel = player addAction ["Steal Control Tower Intel", "scripts\stealStuff.sqf",["controlTower"],-1,false,true,"","(_this distance controlTower < 3) && !stealRadarTower"];
stealPhysics = player addAction ["Steal Dr. Hudsonski's Plans", "scripts\stealStuff.sqf",["hudsonPlans"],-1,false,true,"","(_this distance hudsonPlans < 10) && !stealHudsonPlans"];
photographCannon = player addAction ["Photograph Experimental Cannon", "scripts\stealStuff.sqf",["experPhoto"],-1,false,true,"","(_this distance expercanon < 5) && !photoCannon"];

//earplugs
#define __check configFile >> "CfgIdentities" >> "Identity" >> "name"
_earplugs = {
	if ( ((getText(__check) == "") || (getText(__check) != (name player))) && isMultiplayer ) then { // indentity incorrect
		// don't wait
	} else { // wait for init
		waitUntil { sleep 0.5; _earplugs = player getVariable "ace_sys_goggles_earplugs"; !isNil "_earplugs" };
	};
	player setVariable ["ace_sys_goggles_earplugs", true, false];
	player setVariable ["ace_ear_protection", true, false];
};

[] spawn _earplugs;	

0 fadeRadio 0;  //mute in-game radio commands
maxViewDist = 3000;
setViewDistance maxViewDist;
viewDist = maxViewDist;
player setVariable ["BIS_noCoreConversations", true];  //disable greeting menu	

if ("ACE_USPSD" in (weapons player)) then { 
	player setVariable ["pistolDrawn", 1];
}else { 
	player setVariable ["pistolDrawn", 0];
}; 

[] execVM "scripts\fair.sqf";  //fairness code


deathSecurity = player addEventHandler ["killed", "
[]spawn { 
sleep 3; 
		['sandi_killed', player] call CBA_fnc_globalEvent;
[] execVM 'scripts\gdtmod_spectator.sqf'; _has_spec = true;

};
"];

player setVariable ["inCostume", true, true];

player setVariable ["ACE_STAMINA_CLASS", "SoldierWB"];
player setVariable ["isHiding", false];
liquidationEH = player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then {	["liquidation", player] call CBA_fnc_globalEvent;}; }];
