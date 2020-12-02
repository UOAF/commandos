"retardlake" setMarkerAlpha 0; //sets marker for lake invisible 

//goldeneye mode, ACTIVATE

if (((isserver) && (local player)) || !(isserver)) then 
{
	waitUntil {player==player};
	

	
	goldenEyeMode = player addAction ["Activate Goldeneye Mode (Don't turn this on, it'll go away in 30 seconds)", "scripts\goldeneyeMode.sqf","",-1,false,true,"","time < 30"];

	
	

};

player setVariable ["canBeBit", -999, true]; //neccesary for dog biting script

player setVariable ["buttStroked", false, true]; //neccesary for butt stroke script

//set side 
player setVariable ["playerSide", side player, true];

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

[(actionKeys "Binocular") select 0, [true, true, true], { 
	player sidechat "You have been placed into the spectator script on your own discretion by pressing shift-alt-ctrl-b. IF you did not intend to do this please reslot."; 

	_has_spec = false; 
	_message = "You have been placed into the spectator script on your own discretion by pressing shift-alt-ctrl-b. IF you did not intend to do this please reslot.";

	player setPos (getpos specpen);
	
	if (!_has_spec) then { [] execVM "scripts\gdtmod_spectator.sqf"; _has_spec = true; }
	else { titleText [_message, "BLACK IN", 0.2]; };
	player addEventHandler ["HandleDamage", {false}];
	player setVariable ["ace_w_allow_dam", false];  
	player setVariable ["ace_w_eh",0];
	{player removeMagazine _x} forEach magazines player;
	removeAllWeapons player;
	removeAllItems player;
	["iWantSpecpen"] call CBA_fnc_removeKeyHandler;
}, "keydown", "iWantSpecpen"] call CBA_fnc_addKeyHandler;
