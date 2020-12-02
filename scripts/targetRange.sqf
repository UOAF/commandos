private ["_marker", "_randompos", "_tgtObject"];

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt1", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP1";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt1';  
" ]; 


_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt2", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP2";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt2';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt3", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP3";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt3';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt4", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP4";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt4';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt5", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP5";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt5';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt6", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP6";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt6';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt7", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP7";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt7';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt8", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP8";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt8';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt9", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP9";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt9';  
" ]; 

_randompos = [(getpos centerofrange select 0) + random 1000 - 500, (getpos centerofrange select 1) + random 1000 - 500, (getpos centerofrange select 2)];
_marker = createMarker ["tgt10", _randompos]; 
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_destroy";
_marker setMarkerText "TRP10";
_tgtObject = "Fuel_can" createVehicle (getMarkerPos _marker);
_tgtObject setpos (getMarkerPos _marker); 
_tgtObject addEventHandler ["hit", "
if ((_this select 2) > 0.1) then { sciencepoints = sciencepoints + 1; publicvariable 'sciencepoints';}; 
[scienceRadio, 'tgtdestroyed'] call CBA_fnc_globalSay3d;
deletevehicle (_this select 0);
deletemarker 'tgt10';  
" ]; 

