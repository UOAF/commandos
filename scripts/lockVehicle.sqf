private ["_veh"]; 

_veh = _this select 3 select 0; 

    [-2, {
    (_this select 0) setVehicleLock "LOCKED";
    }, [_veh]] call CBA_fnc_globalExecute;

    hint "Vehicle locked"; 

    