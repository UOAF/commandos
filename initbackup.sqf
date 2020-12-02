//objective variables 
if (isNil "BLUFOR_timer") then {BLUFOR_timer = false;};
if (isNil "BLUFOR_CC") then {BLUFOR_CC = false;};
if (isNil "setupdone") then {setupdone = false;};
if (isNil "bluforWin") then {bluforWin = false;};
if (isNil "tripflares") then {tripflares = 20;};
if (isNil "fuelDump") then {fuelDump = false;};
if (isNil "stealRadarTower") then {stealRadarTower = false;};
if (isNil "blowChemPlant") then {blowChemPlant = false;};
if (isNil "stealHudsonPlans") then {stealHudsonPlans = false;};
if (isNil "photoCannon") then {photoCannon = false;};
if (isNil "radioTowerDestroyed") then {radioTowerDestroyed = false;};
if (isNil "foodStorage") then {foodStorage = false;};
if (isNil "dr1defected") then {dr1defected = false;};
if (isNil "dr2defected") then {dr2defected = false;};
if (isNil "commanderDefected") then {commanderDefected = false;};
if (isNil "stockadeLocked") then {stockadeLocked = true;};
if (isNil "flareFlareMarkerIndex") then {flareFlareMarkerIndex = 0;};
if (isNil "sciencepoints") then {sciencepoints = 0;};
if (isNil "liquidationPoints") then {liquidationPoints = 0;};
if (isNil "sandi_assessment_ending") then {sandi_assessment_ending = false;};
if (isNil "bannedWeaponsBluFor") then {
	bannedWeaponsBluFor = []; 
};
if (isNil "bannedWeaponsOpFor") then {
	bannedWeaponsOpFor = ["m16a4", "ACE_M16A4_CCO_GL", "ACE_M4_Aim", "ACE_M240G_M145", "M4A1_Aim", "ACE_M4_AIM_GL", "M249_m145_EP1", "ACE_Mk12mod1", "M240", "Javelin", "ACE_Javelin_CLU"];
};

//global inits
enableEngineArtillery false;  //disable BI arty comp
ace_sys_wounds_no_medical_gear = true; 
[] spawn { sleep 3; ace_sys_map_minMapSize = 0 };

//spectator groups


if (isServer) then  //server
{
	[] execVM "scripts\randomizeObjectives.sqf";
	[] execVM "scripts\targetRange.sqf";
	[] execVM "scripts\gateCheck.sqf";
	
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
	
	//sandiford score assessment inits
	//blufor
	if (isNil "sandi_blu_deaths") then {
		sandi_blu_deaths = 0;
	};
	if (isNil "sandi_blu_AFVdeaths") then {
		sandi_blu_AFVdeaths = 0;
	};
	if (isNil "sandi_blu_IFVdeaths") then {
		sandi_blu_IFVdeaths = 0;
	};  
	if (isNil "sandi_blu_VEHdeaths") then {
		sandi_blu_VEHdeaths = 0;
	};  

	//opfor
	if (isNil "sandi_red_deaths") then {
		sandi_red_deaths = 0;
	};
	if (isNil "sandi_red_AFVdeaths") then {
		sandi_red_AFVdeaths = 0;
	};
	if (isNil "sandi_red_IFVdeaths") then {
		sandi_red_IFVdeaths = 0;
	};
	if (isNil "sandi_red_VEHdeaths") then {
		sandi_red_VEHdeaths = 0;
	};

	["sandi_killed", {sandi_blu_deaths = sandi_blu_deaths +1}] call CBA_fnc_addEventHandler;
	["sandi_killed2", {sandi_red_deaths = sandi_red_deaths +1}] call CBA_fnc_addEventHandler;
	["sandi_blu_IFV_killed", {sandi_blu_IFVdeaths = sandi_blu_IFVdeaths +1}] call CBA_fnc_addEventHandler;
	["sandi_blu_VEH_killed", {sandi_blu_VEHdeaths = sandi_blu_VEHdeaths +1}] call CBA_fnc_addEventHandler;
	["sandi_red_IFV_killed", {sandi_red_IFVdeaths = sandi_red_IFVdeaths +1}] call CBA_fnc_addEventHandler;
	["liquidation", {liquidationPoints = liquidationPoints +30; publicvariable "liquidationPoints";}] call CBA_fnc_addEventHandler;

	[] spawn {
		sleep (60 *60); // 60 minutes
		["sandi_endMission", ["time"]] call CBA_fnc_globalEvent;
	}; 

	[]spawn{
		sleep 1;
		helo lock true; 
		sleep 420; 
		helo lock false; 
		[-1, {if (side player == east) then {hint "Base helicopter has finished being prepped and is ready to take off!"}; }] call CBA_fnc_globalExecute;
	};

};

if (!(isNull player)) then  //non-JIP player
{
	[] execVM "briefing.sqf";
	[] execVM "scripts\outOfBounds.sqf";
	[] execVM "scripts\playerDeath.sqf";
	[] execVM "scripts\setRadio.sqf";
	[] execVM "scripts\weaponCheck.sqf";
	[] execVM "scripts\pilotCheck.sqf";
	[] execVM "scripts\defectorCheck.sqf";

	"retardlake" setMarkerAlpha 0; 	
	
	if ( "seniorsgt" == vehicleVarName player ) then {	
		
		onMapSingleClick "if (_shift && _alt && (time < 300) && (tripflares > 0) && (_pos distance offlimits1 > 200) && (_pos distance offlimits2 > 10) && (_pos distance offlimits3 > 25) && (_pos distance offlimits4 > 25) && (_pos distance offlimits5 > 100)) then {[_pos]execvm 'scripts\deployTripFlare.sqf';}; true;";	

	};

	decode = player addAction ["Decode CIA Message", "scripts\decodeMessage.sqf",[this],-1,false,true,"","('EvMoscow' in weapons _this) && ('signaller' == vehicleVarName _this)"];

	
	//goldeneye mode, ACTIVATE

	if (((isserver) && (local player)) || !(isserver)) then 
	{
		waitUntil {player==player};
		

		
		goldenEyeMode = player addAction ["Activate Goldeneye Mode (Don't turn this on, it'll go away in 30 seconds)", "scripts\goldeneyeMode.sqf","",-1,false,true,"","time < 30"];

		
		

	};
	
	if (typeof player == "Pastor") then { 
		[] execVM "scripts\playerIsDog.sqf";
	};
	
	player setVariable ["canBeBit", -999, true];
	
	if (side player == WEST) then { 
		_marker = createMarkerlocal ["boats", ([ getPos boats1 select 0, (getPos boats1 select 1) +0, getPos boats1 select 2]) ];
		"boats" setMarkerSizeLocal [1, 1];
		"boats" setMarkerColorLocal "ColorBlue";
		"boats" setMarkerTypeLocal "boat";
		"boats" setMarkertextLocal "x2 CRRC Boats";
		
		_marker = createMarkerlocal ["boats2", ([ getPos boats2 select 0, (getPos boats2 select 1) +0, getPos boats2 select 2]) ];
		"boats2" setMarkerSizeLocal [1, 1];
		"boats2" setMarkerColorLocal "ColorBlue";
		"boats2" setMarkerTypeLocal "boat";
		"boats2" setMarkertextLocal "x2 CRRC Boats";
		
		_marker = createMarkerlocal ["boats3", ([ getPos boats3 select 0, (getPos boats3 select 1) +0, getPos boats3 select 2]) ];
		"boats3" setMarkerSizeLocal [1, 1];
		"boats3" setMarkerColorLocal "ColorBlue";
		"boats3" setMarkerTypeLocal "boat";
		"boats3" setMarkertextLocal "x2 CRRC Boats";
	}; 	
	
	
	if (side player == WEST) then { 
		player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then {	["liquidation", player] call CBA_fnc_globalEvent;}; }];
		[(actionKeys "ReloadMagazine") select 0, [true, false, false], { []execVM "scripts\knife.sqf";  }, "keydown", "knifebitches"] call CBA_fnc_addKeyHandler;
		
		if (((isserver) && (local player)) || !(isserver)) then //pistol stuff
		{
			waitUntil {player==player};

			drawpistol = player addAction ["Draw Pistol", "scripts\drawPistol.sqf",["draw", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 0) "];
			holsterpistol = player addAction ["Holster Pistol", "scripts\drawPistol.sqf",["holster", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 1) && ('ACE_USPSD' in (weapons _target))"];
			stealRadarIntel = player addAction ["Steal Control Tower Intel", "scripts\stealStuff.sqf",["controlTower"],-1,false,true,"","(_this distance controlTower < 3) && !stealRadarTower"];
			stealPhysics = player addAction ["Steal Dr. Hudsonski's Plans", "scripts\stealStuff.sqf",["hudsonPlans"],-1,false,true,"","(_this distance hudsonPlans < 10) && !stealHudsonPlans"];
			photographCannon = player addAction ["Photograph Experimental Cannon", "scripts\stealStuff.sqf",["experPhoto"],-1,false,true,"","(_this distance expercanon < 5) && !photoCannon"];

		};	
	};
	
	if (side player == EAST) then { 
	[(actionKeys "ReloadMagazine") select 0, [true, false, false], { []execVM "scripts\buttstroke.sqf";  }, "keydown", "buttstrokebitches"] call CBA_fnc_addKeyHandler;
		
		pistolFolk = ["dr1", "dr2", "pilot1", "pilot2"];

		{              
			if ( _x == vehicleVarName player ) then {
				
				if (((isserver) && (local player)) || !(isserver)) then //pistol stuff
				{
					waitUntil {player==player};

					drawpistol = player addAction ["Draw Pistol", "scripts\drawPistol.sqf",["draw", "opfor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 0) "];
					holsterpistol = player addAction ["Holster Pistol", "scripts\drawPistol.sqf",["holster", "opfor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 1) && ('Makarov' in (weapons _target))"];

				};	
			}
		}
		forEach pistolFolk;

	};	
	
	if (((isserver) && (local player)) || !(isserver)) then //VC whistle blowing
	{
		waitUntil {player==player};
		
		if (("handler1" == vehicleVarName player) || ("handler2" == vehicleVarName player)) then {
			
			player addAction ["Blow Whistle", "scripts\whistle.sqf","",-1,false,true,"",""];

			player setVariable ["b_lastWhistle", -10, true];
			
		};

	};
	
	//set side 
	player setVariable ["playerSide", side player, true];
	
	if ( "camman" == vehicleVarName player ) then { 
		player addAction ["Enter Spectator Mode", "scripts\specAction.sqf", [], 1, false, true, "", ""];
		player setVariable["acre_sys_core_isDisabled", true, true];
		onMapSingleClick "player setpos (_pos); true;";
		
		[]spawn {
			sleep 1; 
			while {true} do { 
				removeallweapons player; 
				
				if (vehicle player != player) then { 
					moveOut player;
					[-1, {hint "Be advised: the Camera Man is entering player vehicles. Ban him or something.";}] call CBA_fnc_globalExecute;				
				}; 
				sleep 1; 
			};	 
		};

	}; 
	
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
	player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";  //lower players weapon
	
	[] execVM "scripts\fair.sqf";  //fairness code
	
	
};

if (!isServer && isNull player) then  //JIP player
{
	waitUntil {!isNull player};
	
	[] execVM "briefing.sqf";
	[] execVM "scripts\outOfBounds.sqf";
	[] execVM "scripts\playerDeath.sqf";
	[] execVM "scripts\setRadio.sqf";
	[] execVM "scripts\weaponCheck.sqf";
	[] execVM "scripts\pilotCheck.sqf";
	[] execVM "scripts\defectorCheck.sqf";

	"retardlake" setMarkerAlpha 0; 	
	
	player setVariable ["canBeBit", -999, true];

	decode = player addAction ["Decode CIA Message", "scripts\decodeMessage.sqf",[this],-1,false,true,"","('EvMoscow' in weapons _this) && ('signaller' == vehicleVarName _this)"];
	
	
	if ( "seniorsgt" == vehicleVarName player ) then {	
		
		onMapSingleClick "if (_shift && _alt && (time < 300) && (tripflares > 0) && (_pos distance offlimits1 > 200) && (_pos distance offlimits2 > 10) && (_pos distance offlimits3 > 25) && (_pos distance offlimits4 > 25) && (_pos distance offlimits5 > 100)) then {[_pos]execvm 'scripts\deployTripFlare.sqf';}; true;";	

	};

	//goldeneye mode, ACTIVATE

	if (((isserver) && (local player)) || !(isserver)) then 
	{
		waitUntil {player==player};
		

		
		goldenEyeMode = player addAction ["Activate Goldeneye Mode (Don't turn this on, it'll go away in 30 seconds)", "scripts\goldeneyeMode.sqf","",-1,false,true,"","time < 30"];

		
		

	};	
	
	if (side player == WEST) then { 
		_marker = createMarkerlocal ["boats", ([ getPos boats1 select 0, (getPos boats1 select 1) +0, getPos boats1 select 2]) ];
		"boats" setMarkerSizeLocal [1, 1];
		"boats" setMarkerColorLocal "ColorBlue";
		"boats" setMarkerTypeLocal "boat";
		"boats" setMarkertextLocal "x2 CRRC Boats";
		
		_marker = createMarkerlocal ["boats2", ([ getPos boats2 select 0, (getPos boats2 select 1) +0, getPos boats2 select 2]) ];
		"boats2" setMarkerSizeLocal [1, 1];
		"boats2" setMarkerColorLocal "ColorBlue";
		"boats2" setMarkerTypeLocal "boat";
		"boats2" setMarkertextLocal "x2 CRRC Boats";
		
		_marker = createMarkerlocal ["boats3", ([ getPos boats3 select 0, (getPos boats3 select 1) +0, getPos boats3 select 2]) ];
		"boats3" setMarkerSizeLocal [1, 1];
		"boats3" setMarkerColorLocal "ColorBlue";
		"boats3" setMarkerTypeLocal "boat";
		"boats3" setMarkertextLocal "x2 CRRC Boats";
	}; 	

	if (side player == WEST) then { 
		player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then {	["liquidation", player] call CBA_fnc_globalEvent;}; }];
		[(actionKeys "ReloadMagazine") select 0, [true, false, false], { []execVM "scripts\knife.sqf";  }, "keydown", "knifebitches"] call CBA_fnc_addKeyHandler;

		if (((isserver) && (local player)) || !(isserver)) then //pistol stuff
		{
			waitUntil {player==player};

			drawpistol = player addAction ["Draw Pistol", "scripts\drawPistol.sqf",["draw", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 0) "];
			holsterpistol = player addAction ["Holster Pistol", "scripts\drawPistol.sqf",["holster", "blufor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 1) && ('ACE_USPSD' in (weapons _target))"];
			stealRadarIntel = player addAction ["Steal Control Tower Intel", "scripts\stealStuff.sqf",["controlTower"],-1,false,true,"","(_this distance controlTower < 3) && !stealRadarTower"];
			stealPhysics = player addAction ["Steal Dr. Hudsonski's Plans", "scripts\stealStuff.sqf",["hudsonPlans"],-1,false,true,"","(_this distance hudsonPlans < 10) && !stealHudsonPlans"];
			photographCannon = player addAction ["Photograph Experimental Cannon", "scripts\stealStuff.sqf",["experPhoto"],-1,false,true,"","(_this distance expercanon < 5) && !photoCannon"];

		};	
	};
	
	if (side player == EAST) then { 
	[(actionKeys "ReloadMagazine") select 0, [true, false, false], { []execVM "scripts\buttstroke.sqf";  }, "keydown", "buttstrokebitches"] call CBA_fnc_addKeyHandler;

		pistolFolk = ["dr1", "dr2", "pilot1", "pilot2"];

		{              
			if ( _x == vehicleVarName player ) then {
				
				if (((isserver) && (local player)) || !(isserver)) then //pistol stuff
				{
					waitUntil {player==player};

					drawpistol = player addAction ["Draw Pistol", "scripts\drawPistol.sqf",["draw", "opfor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 0) "];
					holsterpistol = player addAction ["Holster Pistol", "scripts\drawPistol.sqf",["holster", "opfor"],-1,false,true,"","(_target getVariable 'pistolDrawn' == 1) && ('Makarov' in (weapons _target))"];

				};	
			}
		}
		forEach pistolFolk;

	};
	
	if (((isserver) && (local player)) || !(isserver)) then //VC whistle blowing
	{
		waitUntil {player==player};
		
		if (("handler1" == vehicleVarName player) || ("handler2" == vehicleVarName player)) then {
			
			player addAction ["Blow Whistle", "scripts\whistle.sqf","",-1,false,true,"",""];

			player setVariable ["b_lastWhistle", -10, true];
			
		};

	};
	
	//set side 
	player setVariable ["playerSide", side player, true];

	if ( "camman" == vehicleVarName player ) then { 
		player addAction ["Enter Spectator Mode", "scripts\specAction.sqf", [], 1, false, true, "", ""];
		player setVariable["acre_sys_core_isDisabled", true, true];
		onMapSingleClick "player setpos (_pos); true;";
		
		[]spawn {
			sleep 1; 
			while {true} do { 
				removeallweapons player; 
				
				if (vehicle player != player) then { 
					moveOut player;
					[-1, {hint "Be advised: the Camera Man is entering player vehicles. Ban him or something.";}] call CBA_fnc_globalExecute;				
				}; 
				sleep 1; 
			};	 
		};

	}; 
	
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
	player switchMove "amovpercmstpslowwrfldnon_player_idlesteady03";  //lower players weapon
	
	[] execVM "scripts\fair.sqf";  //fairness code
	

};

[] execVM "bScripts\bInit.sqf";  //init bScripts functions
