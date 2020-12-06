

//senior sergeant tripflares
if ( "seniorsgt" == vehicleVarName player ) then {

    onMapSingleClick "if (_shift && _alt && (time < 300) && (tripflares > 0) && (_pos distance offlimits1 > 200) && (_pos distance offlimits2 > 10) && (_pos distance offlimits3 > 25) && (_pos distance offlimits4 > 25) && (_pos distance offlimits5 > 100)) then {[_pos]execvm 'scripts\deployTripFlare.sqf';}; true;";

};

//signaller decode ability
decode = player addAction ["Decode CIA Message", "scripts\decodeMessage.sqf",[this],-1,false,true,"","('EvMoscow' in weapons _this) && ('signaller' == vehicleVarName _this)"];


//buttstroke
[(actionKeys "Stand") select 0, [true, false, false], { []execVM "scripts\buttstroke.sqf";  }, "keydown", "buttstrokebitches"] call CBA_fnc_addKeyHandler;

//hidden pistols

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



if (((isserver) && (local player)) || !(isserver)) then //whistle blowing for dog handlers
{
    waitUntil {player==player};

    if (("handler1" == vehicleVarName player) || ("handler2" == vehicleVarName player)) then {

        player addAction ["Blow Whistle", "scripts\whistle.sqf","",-1,false,true,"",""];

        player setVariable ["b_lastWhistle", -10, true];

    };

};
