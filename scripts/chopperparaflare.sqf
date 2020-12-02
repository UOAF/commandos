private ["_veh","_flare"];

_veh = _this select 0;
_veh setVariable ["chopperFlares", (_veh getVariable "chopperFlares") -1, true];

_flare = "F_40mm_White" createVehicle (getpos _veh);
//_flare setVelocity [sin (_dir) * 90, cos (_dir) * 90, 80];

//ACE flares
[nil, nil, nil, nil, nil, nil, _flare] spawn ace_sys_flares_fnc_slowdescent;
[nil, nil, nil, nil, "F_40mm_White", nil, _flare] execFSM "\x\ace\addons\sys_flares\fnc_rocko_flares.fsm";

hint format ["You have %1 flares left", _veh getVariable 'chopperFlares'];