private ["_vehicle", "_dog"];

_vehicle = _this select 3 select 0;
_dog = _this select 3 select 1 select 0;
//hint format ["%1, %2", _vehicle, _dog];

    [-2, {
    if (typeof (_this select 1) == "UAZ_RU") then{
    (_this select 0) attachTo [(_this select 1),[0,-0.5,-1.5]];
    };
        if (typeof (_this select 1) == "ACE_Ural_RU") then{
    (_this select 0) attachTo [(_this select 1),[0,-1,-0.3]];

        };
    (_this select 0) setVariable ["dogInCar", 1];
    }, [_dog, _vehicle]] call CBA_fnc_globalExecute;

_vehicle removeaction loadDog;
unloadDog = _vehicle addAction ["Unload Dog From Vehicle", "scripts\unloadDog.sqf",[_vehicle, _dog],-1,false,true,"","((vehicle _this) == player)"];
