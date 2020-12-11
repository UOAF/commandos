private ["_veh","_flare"];

commandos_handle_helo_flare = {
    _veh = _this select 0;
    _veh setVariable ["chopperFlares", (_veh getVariable "chopperFlares") -1, true];

    _flare = "F_40mm_White" createVehicle (getpos _veh);
    //_flare setVelocity [sin (_dir) * 90, cos (_dir) * 90, 80];

    //ACE flares (not working in Arma3)
    // [nil, nil, nil, nil, nil, nil, _flare] spawn ace_sys_flares_fnc_slowdescent;
    // [nil, nil, nil, nil, "F_40mm_White", nil, _flare] execFSM "\x\ace\addons\sys_flares\fnc_rocko_flares.fsm";

    hint format ["You have %1 flares left", _veh getVariable 'chopperFlares'];

};

fn_isInTurret = {
    private _crew = fullCrew (vehicle _this);
    diag_log format ["crew is %1", str(_crew)];
    private _found = False; 
    {
         _x params ["_unit", 
                    "_role", 
                    "_cargoIndex", 
                    "_turretPath", 
                    "_personTurret"]; 
        diag_log format ["unit is %1", _unit]; 
        if (_unit == _this && _role == "Turret" ) then { 
            _found = True; 
        } 
    } foreach _crew;    
    _found;
};


helo addAction ["Drop flare", 
                commandos_handle_helo_flare,
                [], 
                10, 
                true, 
                true, 
                "", 
                "player call fn_isInTurret"];

