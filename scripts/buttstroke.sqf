

private ["_nearestunits", "_nearestunitofside", "_prevAnim"];

_prevAnim = animationState player;

_nearestunits = nearestObjects [player,["Man"],3];

_nearestunitofside = [];

"buttstrokin" call fnc_debugPrint;

if ((vehiclevarname player == "dr1") || (vehiclevarname player == "dr2") || (vehiclevarname player == "ruscommander")) then {
    if(west countSide _nearestunits > 0) then {
        {
            _unit = _x;
            //_unit call fnc_debugPrint;
            if((side _unit == west) && !(_unit getVariable "buttStroked")) then{_nearestunitofside = _nearestunitofside + [_unit]};
        } foreach _nearestunits;

        [-2, {
            (_this select 0) switchMove "CtsDoktor_Vojak_uder1";
        }, [player]] call CBA_fnc_globalExecute;

        [player, "stab"] call CBA_fnc_globalSay3d;

        [-2, {
            [(_this select 0), 0.8,true,9999999] call ace_w_setunitdam;
            (_this select 0) call ace_sys_wounds_fnc_RemoveBleed;
            (_this select 0) call ace_sys_wounds_fnc_RemovePain;
        }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

        //(_nearestunitofside select 0) call fnc_debugPrint;
        (_nearestunitofside select 0) setVariable ["buttStroked", true, true];
        [0, {
            sleep 600;
            (_this select 0) setVariable ["buttStroked", false, true];
        }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

        [-2, {
            revive = (_this select 0) addAction ["Revive Prisoner", "scripts\revive.sqf", [], 6, false, true, "", "(_this distance _target < 3) && (alive _target)"];
        }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

        //[(_nearestunitofside select 0), 1] call ace_blackoutAll;
        sleep 2;
        [-2, {
            (_this select 0) switchmove (_this select 1);
        }, [player, _prevAnim]] call CBA_fnc_globalExecute;

    };
}else{
    if(count _nearestunits > 0) then {

        {
            _unit = _x;
            _unit call fnc_debugPrint;
            if(((side _unit == west) || (vehiclevarname _unit == "dr1") || (vehiclevarname _unit == "dr2") || (vehiclevarname _unit == "ruscommander")) && !(_unit getVariable "buttStroked")) then{_nearestunitofside = _nearestunitofside + [_unit]};
        } foreach _nearestunits;

        if (count _nearestunitofside  > 0) then {
            "more than 1 unit of side" call fnc_debugPrint;
            player playActionNow "PutDown";

            [player, "stab"] call CBA_fnc_globalSay3d;

            [-2, {
				[(_this select 0), 0.1, "Head", "punch"] call ace_medical_fnc_addDamageToUnit;
				[(_this select 0), true, 600, true] call ace_medical_fnc_setUnconscious; //knock him out for 10 minutes (600 seconds)
            }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

            (_nearestunitofside select 0) setVariable ["buttStroked", true, true];

            //spawn off a timer to revive the guy after 600 seconds on server, otherwise if buttstroker disconnects in the 600 seconds
            //our guy will be perma stunned
            [0, {
                sleep 600;
                (_this select 0) setVariable ["buttStroked", false, true];
            }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

            [-2, {
                revive = (_this select 0) addAction ["Revive Prisoner", "scripts\revive.sqf", [], 6, false, true, "", "(_this distance _target < 3) && (alive _target)"];
            }, [(_nearestunitofside select 0)]] call CBA_fnc_globalExecute;

            //[(_nearestunitofside select 0), 1] call ace_blackoutAll;
            sleep 2;
            [-2, {
                (_this select 0) switchmove (_this select 1);
            }, [player, _prevAnim]] call CBA_fnc_globalExecute;
        };
    };

};
