private ["_flarePos", "_flareTrg", "_flareMarker", "_flareIndex", "_flareName"]; 

_flarePos = _this select 0; 

[0, {
private ["_flarePos", "_flareTrg", "_flareMarker", "_flareIndex", "_flareName"]; 
_flarePos = (_this select 0);
_flareTrg = createTrigger["EmptyDetector",_flarePos]; _flareTrg setTriggerArea[10,2,180,true];
_flareTrg setTriggerActivation["ANY","PRESENT",false];
_flareTrg setTriggerStatements["this", "    [-1, {
private '_flareList'; 
_flareList = (_this select 0); 
id = [_flareList] execVM 'bscripts\ambient\tripflare.sqf';
}, [thisList]] call CBA_fnc_globalExecute; ", ""]; 
}, [_flarePos]] call CBA_fnc_globalExecute;

[-2, {
private ["_flarePos", "_flareTrg", "_flareMarker", "_flareIndex", "_flareName"]; 
if (side player == EAST) then {

_flareIndex = (_this select 0); 
_flareName = (_this select 1); 
_flareMarker = (_this select 2); 
_flarePos = (_this select 3); 

_flareIndex = flareFlareMarkerIndex + 1;
flareFlareMarkerIndex = flareFlareMarkerIndex + 1; 
publicvariable "flareFlareMarkerIndex"; 
_flareName = "tripflare" + (str _flareIndex);

_flareMarker = createMarkerLocal[_flareName,_flarePos];
_flareMarker setMarkerShapeLocal "ICON";
_flareMarker setMarkerTypeLocal "DOT";
_flareMarker setMarkerShapeLocal "RECTANGLE";
_flareMarker setMarkerSizelocal [10, 2];
_flareMarker setMarkerDirlocal 180;

};

}, [_flareIndex, _flareName, _flareMarker, _flarePos ]] call CBA_fnc_globalExecute;


hint "Tripflare deployed"; 

tripflares = tripflares - 1; 
publicvariable "tripflares";
