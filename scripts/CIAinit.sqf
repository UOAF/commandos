
//starting boat markers
_marker = createMarkerlocal ["boats", ([ getPos boats1 select 0, (getPos boats1 select 1) +0, getPos boats1 select 2]) ];
"boats" setMarkerSizeLocal [1, 1];
"boats" setMarkerColorLocal "ColorBlue";
"boats" setMarkerTypeLocal "b_naval";
"boats" setMarkertextLocal "x2 CRRC Boats";

_marker = createMarkerlocal ["boats2", ([ getPos boats2 select 0, (getPos boats2 select 1) +0, getPos boats2 select 2]) ];
"boats2" setMarkerSizeLocal [1, 1];
"boats2" setMarkerColorLocal "ColorBlue";
"boats2" setMarkerTypeLocal "b_naval";
"boats2" setMarkertextLocal "x2 CRRC Boats";

_marker = createMarkerlocal ["boats3", ([ getPos boats3 select 0, (getPos boats3 select 1) +0, getPos boats3 select 2]) ];
"boats3" setMarkerSizeLocal [1, 1];
"boats3" setMarkerColorLocal "ColorBlue";
"boats3" setMarkerTypeLocal "b_naval";
"boats3" setMarkertextLocal "x2 CRRC Boats";

//liquidation upon death if in stockade
player addEventHandler ["killed", { if ((_this select 0) distance stockade < 50) then { ["liquidation", player] call CBA_fnc_globalEvent;}; }];

//knife attack
[46, [true, false, false], { []execVM "scripts\knife.sqf";  }, "keydown", "knifebitches"] call CBA_fnc_addKeyHandler;

if (((isserver) && (local player)) || !(isserver)) then //intelligence actions
{
    waitUntil {player==player};

    stealRadarIntel = player addAction ["Steal Control Tower Intel", "scripts\stealStuff.sqf",["controlTower"],-1,false,true,"","(_this distance controlTower < 3) && !stealRadarTower"];
    stealPhysics = player addAction ["Steal Dr. Hudsonski's Plans", "scripts\stealStuff.sqf",["hudsonPlans"],-1,false,true,"","(_this distance hudsonPlans < 10) && !stealHudsonPlans"];
    photographCannon = player addAction ["Photograph Experimental Cannon", "scripts\stealStuff.sqf",["experPhoto"],-1,false,true,"","(_this distance expercanon < 5) && !photoCannon"];

};

if (time > 900) then {  //put CIA who jip after 15 minutes into the spec pen

    player sidechat "Sorry you can't JIP into this mission as CIA after 15 minutes. You have been put into the spectator script.";

    _has_spec = false;
    _message = "Sorry you can't JIP into this mission as CIA after 15 minutes. You have been put into the spectator script.";

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