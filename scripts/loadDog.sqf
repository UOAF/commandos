private ["_vehicle", "_dog"];

_vehicle = _this select 3 select 0;
_dog = _this select 3 select 1 select 0;
//hint format ["%1, %2", _vehicle, _dog];

    [-2, {
    if (typeof (_this select 1) == "UK3CB_CW_SOV_O_EARLY_UAZ_Closed") then{
        (_this select 0) attachTo [(_this select 1),[0,-0.5,0.25]];
    };
    if (typeof (_this select 1) == "UK3CB_CW_SOV_O_EARLY_Ural") then{
        (_this select 0) attachTo [(_this select 1),[0,-1,0.4]];
    };
    (_this select 0) setVariable ["dogInCar", 1];
    }, [_dog, _vehicle]] call CBA_fnc_globalExecute;

_vehicle removeaction loadDog;
unloadDog = _vehicle addAction ["Unload Dog From Vehicle", "scripts\unloadDog.sqf",[_vehicle, _dog],-1,false,true,"","((vehicle _this) == player)"];
