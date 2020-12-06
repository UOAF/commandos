private ["_vehicle", "_vehicleType"]; 

_vehicle = _this select 3 select 0; 
_vehicleType = _this select 3 select 1; 

if (_vehicleType == "uaz") then { 
    _vehicle setVehicleInit "this setHit ['glass2', 1];";
    [_vehicle, "windowbreak"] call CBA_fnc_globalSay3d;
    processInitCommands;

    hint "Hotwiring vehicle!"; 

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
        [_vehicle, "breakingin"] call CBA_fnc_globalSay3d;

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;

    [-2, {
        (_this select 0) lock false;     (_this select 0) removeAction unlockvehicle;  (_this select 0) removeAction lockvehicle;  (_this select 0) removeAction hotwire; 
    }, [_vehicle]] call CBA_fnc_globalExecute;
    
    hint "Vehicle successfully hotwired!"; 

};

if (_vehicleType == "motorbike") then { 

    hint "Hotwiring vehicle!"; 

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
            [_vehicle, "breakingin"] call CBA_fnc_globalSay3d;

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;

    [-2, {
        (_this select 0) lock false;     (_this select 0) removeAction unlockvehicle;  (_this select 0) removeAction lockvehicle;  (_this select 0) removeAction hotwire; 
    }, [_vehicle]] call CBA_fnc_globalExecute;
    
    hint "Vehicle successfully hotwired!"; 

};

if (_vehicleType == "ural") then { 
    _vehicle setVehicleInit "this setHit ['glass3', 1];";
    [_vehicle, "windowbreak"] call CBA_fnc_globalSay3d;
    processInitCommands;

    hint "Hotwiring vehicle!"; 

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
            [_vehicle, "breakingin"] call CBA_fnc_globalSay3d;

    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;
    player playMove "AinvPknlMstpSlayWrflDnon_medic";
    sleep 9;

    [-2, {
        (_this select 0) lock false;     (_this select 0) removeAction unlockvehicle;  (_this select 0) removeAction lockvehicle;  (_this select 0) removeAction hotwire; 
    }, [_vehicle]] call CBA_fnc_globalExecute;
    
    hint "Vehicle successfully hotwired!"; 

};