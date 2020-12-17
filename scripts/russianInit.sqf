

//senior sergeant tripflares
if ( "seniorsgt" == vehicleVarName player ) then {

    onMapSingleClick "if (_shift && _alt && (time < 300) && (tripflares > 0) && (_pos distance offlimits1 > 200) && (_pos distance offlimits2 > 10) && (_pos distance offlimits3 > 25) && (_pos distance offlimits4 > 25) && (_pos distance offlimits5 > 100)) then {[_pos]execvm 'scripts\deployTripFlare.sqf';}; true;";

};

//signaller decode ability
decode = player addAction ["Decode CIA Message", "scripts\decodeMessage.sqf",[this],-1,false,true,"","('CUP_item_Cobalt_File' in items _this) && ('signaller' == vehicleVarName _this)"];


//buttstroke
[46, [true, false, false], { []execVM "scripts\buttstroke.sqf";  }, "keydown", "buttstrokebitches"] call CBA_fnc_addKeyHandler;

if (((isserver) && (local player)) || !(isserver)) then //whistle blowing for dog handlers
{
    waitUntil {player==player};

    if (("handler1" == vehicleVarName player) || ("handler2" == vehicleVarName player)) then {

        player addAction ["Blow Whistle", "scripts\whistle.sqf","",-1,false,true,"",""];

        player setVariable ["b_lastWhistle", -10, true];

    };

};
