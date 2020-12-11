private ["_vehicle", "_vehicleType", "_hider", "_hiding", "_EscapeVehicle", "_vehicleCrew", "_badDudesInVehicle"];

_vehicle = _this select 3 select 0;
_vehicleType = _this select 3 select 1;
_hider = _this select 1;
_hiding = _hider getVariable "isHiding";

_vehicleCrew = crew _vehicle;
_badDudesInVehicle = [];
{
    if ((side _x == east) && !(driver _vehicle == _x)) then {
        _badDudesInVehicle set[(count _badDudesInVehicle), _x];
    };

}
foreach _vehicleCrew;

if (count _badDudesInVehicle > 0) exitwith {hint "You can't hide in a vehicle when there's enemy in the troop compartment!";};

if(!(local _hider)) exitWith { false };

if (_vehicleType == "ural") then {

    [-2, {
        (_this select 0) removeaction hideinvehicle;
    }, [_vehicle]] call CBA_fnc_globalExecute;


    hint "To get out of the vehicle press your jump key (default v)";

    _hider attachTo [_vehicle,[0,-1.5,-0.2]];
    _hider setVariable ["isHiding", true];
    _hiding = _hider getVariable "isHiding";

    _EscapeVehicle = [(actionKeys "GetOver") select 0, [false, false, false], { player setVariable ["isHiding", false]; }, "keydown", "hideinvehicle"] call CBA_fnc_addKeyHandler;

    while{ (_hiding) && (alive _hider) && (count _badDudesInVehicle < 1)} do {

        _vehicleCrew = crew _vehicle;
        _badDudesInVehicle = [];
        {
            if ((side _x == east) && !(driver _vehicle == _x)) then {
                _badDudesInVehicle set[(count _badDudesInVehicle), _x];
            };

        }
        foreach _vehicleCrew;

        _hiding = _hider getVariable "isHiding";

        _hider switchmove "AmovPincMstpSnonWnonDnon";

    };

    if ((!_hiding) || (!alive _hider) || (count _badDudesInVehicle > 0)) then {
        if (count _badDudesInVehicle > 0) then {
            hint "You have been detected and have bailed out of the vehicle! RUN!";

            [-2, {
                if (player in (_this select 0)) then {
                    hint "You hear someone bailing out of the back of the truck bed!";
                };
            }, [(crew _vehicle)]] call CBA_fnc_globalExecute;
        };
        detach _hider;
        ["hideinvehicle"] call CBA_fnc_removeKeyHandler;
        _hider setPos [((getPos _hider) select 0), ((getPos _hider) select 1)+2.5, ((getPos _hider) select 2)];
        _hider switchmove "";
        _hider playActionNow "SitDown";

        [-2, {
            hideinvehicle = (_this select 0) addAction ["Hide in Back of Truck", "scripts\hideinvehicle.sqf",[(_this select 0), "ural"],-1,false,true,"","(side _this == west) && (alive _target)"];
        }, [_vehicle]] call CBA_fnc_globalExecute;
    };
};