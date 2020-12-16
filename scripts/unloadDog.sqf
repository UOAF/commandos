private ["_vehicle", "_dog"];

_vehicle = _this select 3 select 0;
_dog = _this select 3 select 1;
//hint format ["%1, %2", _vehicle, _dog];

    [-2, {
    detach (_this select 0);
    (_this select 0) setPos [ (getPos (_this select 1) select 0) + 3, getPos (_this select 1) select 1, getPos (_this select 1) select 2];
    (_this select 0) setVariable ["dogInCar", 0];
    }, [_dog, _vehicle]] call CBA_fnc_globalExecute;

_vehicle removeaction unloaddog;
loadDog = _vehicle addAction ["Load Dog Into Vehicle", "scripts\loadDog.sqf",[_vehicle, nearestObjects [_vehicle, ['krauseDog'], 3]],-1,false,true,"","(count (nearestObjects [_target, ['krauseDog'], 3]) > 0) && ((vehicle _this) == player)"];
